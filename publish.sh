#!/bin/bash
set -e

export PATH="$HOME/.cargo/bin:$PATH"

DOMAIN="ameopoema.com"

# ============================================================
# Renomeia arquivos .md com base no título (cabeçalho #)
# ============================================================
echo "🏷️  Renomeando arquivos .md conforme título..."
if [ -f "./rename-files.sh" ]; then
    ./rename-files.sh
else
    echo "⚠️  Aviso: rename-files.sh não encontrado. Pulando renomeação."
fi

echo "🔄 Atualizando SUMMARY.md..."
./update-summary.sh

echo "📅 Corrigindo data nos blocos de citação..."
./fix-dates.sh

echo "✍️ Corrigindo quebras de linha nos arquivos .md..."
./fix-line-breaks.sh


# ============================================================
# Geração do feed RSS (com verificação e cópia)
# ============================================================
echo "📡 Gerando feed RSS..."
if [ -f "./generate-feed.sh" ]; then
    ./generate-feed.sh
else
    echo "❌ ERRO: generate-feed.sh não encontrado."
    exit 1
fi

# Verifica se o feed foi gerado
if [ ! -f "feed.xml" ]; then
    echo "❌ ERRO: generate-feed.sh não criou o arquivo feed.xml."
    exit 1
fi
echo "   ✅ feed.xml gerado com sucesso."

# ============================================================
# Commit e push das alterações (incluindo renomeações)
# ============================================================
if [ -n "$(git status --porcelain)" ]; then
    echo "📝 Adicionando todas as alterações..."
    git add .
    commit_date=$(date '+%Y-%m-%d %H:%M:%S')
    changed_files=$(git diff --cached --name-only)
    git commit -m "Atualização automática em $commit_date

Arquivos alterados:
$changed_files"

    echo "📤 Enviando commit para o repositório remoto..."
    git push origin HEAD
else
    echo "ℹ️ Nenhuma alteração para commitar."
fi


# ============================================================
# Build do site com mdBook
# ============================================================
echo "📚 Construindo o site com mdBook..."
rm -rf book/
mdbook build

# ============================================================
# Criar blog.html (leitura contínua)
# ============================================================
echo "📄 Criando blog.html para leitura contínua..."
if [ -f "./create-blog.sh" ]; then
    ./create-blog.sh
else
    echo "⚠️  Aviso: create-blog.sh não encontrado. Pulando."
fi

# ============================================================
# Copiar feed.xml e configurar domínio
# ============================================================
echo "   Copiando feed.xml para book/..."
cp feed.xml book/feed.xml
echo "   ✅ feed.xml copiado para book/"

echo "🌐 Configurando domínio personalizado: $DOMAIN"
echo "$DOMAIN" > book/CNAME
# Também cria CNAME na raiz do repositório (para manter consistência)
echo "$DOMAIN" > CNAME

# ============================================================
# Deploy para gh-pages
# ============================================================
echo "🚀 Publicando para gh-pages..."
TMP_DIR=$(mktemp -d -t gh-pages-deploy-XXXXXX)
cp -r book/* "$TMP_DIR/"
cd "$TMP_DIR"
git init
git checkout -b gh-pages
git add .
git commit -m "Deploy do site - $(date '+%Y-%m-%d %H:%M:%S')"
git remote add origin git@github.com:claudeblog/nefelibata.git
git push origin gh-pages --force
cd -
rm -rf "$TMP_DIR"

# ============================================================
# Finalização
# ============================================================
echo "✍️  Gerando template para novo poema (se disponível)..."
if [ -f "./template.sh" ]; then
    ./template.sh || true
else
    echo "ℹ️  template.sh não encontrado. Pulando."
fi

echo "✅ Publicação concluída! O domínio $DOMAIN foi persistido."
echo "   O feed RSS está disponível em: https://$DOMAIN/feed.xml"
#!/bin/bash
set -e

export PATH="$HOME/.cargo/bin:$PATH"

DOMAIN="ameopoema.com"

echo "🏷️  Renomeando arquivos .md conforme título..."
    ./rename-files.sh

echo "🔄 Atualizando SUMMARY.md..."
./update-summary.sh

echo "📅 Corrigindo data nos blocos de citação..."
./fix-dates.sh

echo "✍️ Corrigindo quebras de linha nos arquivos .md..."
./fix-line-breaks.sh

echo "📚 Construindo o site base com mdBook..."
rm -rf book/
mdbook build

echo "📄 Criando blog.html para leitura contínua..."
./create-blog.sh

echo "📡 Gerando feed RSS..."
./generate-feed.sh

echo "🌐 Configurando domínio personalizado: $DOMAIN"
echo "$DOMAIN" > book/CNAME
echo "$DOMAIN" > CNAME

echo "📤 Commitando alterações no repositório principal"
if [ -n "$(git status --porcelain)" ]; then
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


echo "✍️  Gerando templates"
./template.sh || true

echo "✅ Publicação concluída em: $DOMAIN"
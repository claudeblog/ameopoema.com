#!/bin/bash
set -e

echo "Carregando arquivo env..."
set -a
. .env
set +a

export PATH="$HOME/.cargo/bin:$PATH"

echo "🏷️  Renomeando arquivos .md conforme título..."
./scripts/rename-files.sh

echo "🔄 Atualizando SUMMARY.md..."
./scripts/update-summary.sh

echo "📅 Corrigindo data nos blocos de citação..."
./scripts/fix-dates.sh

echo "✍️ Corrigindo quebras de linha nos arquivos .md..."
./scripts/fix-line-breaks.sh

echo "📚 Construindo o site base com mdBook..."
rm -rf book/
mdbook build

echo "📄 Criando blog.html para leitura contínua..."
./scripts/create-blog.sh

echo "📡 Gerando feed RSS..."
./scripts/generate-feed.sh

echo "🌐 Configurando domínio personalizado: $DOMAIN"
echo "$DOMAIN" > book/CNAME
echo "$DOMAIN" > CNAME


echo "✍️  Gerando templates"
./scripts/template.sh || true

echo "📤 Commitando alterações no repositório principal"
./scripts/git-push.sh 


echo "✅ Publicação concluída em: $DOMAIN"
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
./push.sh 

echo "✍️  Gerando templates"
./template.sh || true

echo "✅ Publicação concluída em: $DOMAIN"
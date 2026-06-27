#!/bin/bash
set -e

echo "Carregando arquivo env..."
set -a
. .env
set +a

export PATH="$HOME/.cargo/bin:$PATH"

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


echo "✍️  Gerando templates"
./template.sh || true

echo "📤 Commitando alterações no repositório principal"
./git-push.sh 


echo "✅ Publicação concluída em: $DOMAIN"
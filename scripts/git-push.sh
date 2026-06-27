#!/bin/bash
set -e

# Obtém o diretório onde este script está localizado
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Assume que a raiz do projeto é um nível acima (scripts/ fica na raiz)
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
BOOK_DIR="${PROJECT_ROOT}/book"

echo "📤 Commitando alterações no repositório principal"
# Navega para a raiz para que todos os comandos git funcionem corretamente
cd "$PROJECT_ROOT"

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
# Cria um diretório temporário para o deploy
TMP_DIR=$(mktemp -d -t gh-pages-deploy-XXXXXX)
# Limpa o diretório temporário ao sair (mesmo em erro)
trap 'rm -rf "$TMP_DIR"' EXIT

# Copia o conteúdo da pasta book/ para o temporário
cp -r "$BOOK_DIR"/* "$TMP_DIR/"

# Entra no temporário e publica como gh-pages
cd "$TMP_DIR"
git init
git checkout -b gh-pages
git add .
git commit -m "Deploy do site - $(date '+%Y-%m-%d %H:%M:%S')"
git remote add origin git@github.com:claudeblog/nefelibata.git
git push origin gh-pages --force

# Volta ao diretório anterior e limpa o temporário (o trap cuida disso)
cd - > /dev/null

echo "✅ Deploy concluído com sucesso!"
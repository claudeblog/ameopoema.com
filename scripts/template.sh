#!/bin/bash
set -euo pipefail

# Obtém o diretório onde este script está localizado
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Assume que a raiz do projeto é um nível acima (scripts/ fica na raiz)
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Define o diretório de destino (absoluto)
SRC_DIR="${PROJECT_ROOT}/src"

# Data atual no formato YYYY-MM-DD
DATA=$(date +%Y-%m-%d)
FILENAME="${SRC_DIR}/${DATA}-Template.md"

echo "📝 Criando novo template em: $FILENAME"

# Conteúdo do template
read -r -d '' CONTEUDO << EOF || true
# Template

Lorem ipsum dolor sit amet, 
consectetur adipiscing elit, 
sed do eiusmod tempor incididunt ut labore 
et dolore magna aliqua. Ut enim ad minim veniam, 

quis nostrud exercitation ullamco laboris 
nisi ut aliquip ex ea commodo consequat. 
Duis aute irure dolor in reprehenderit 
in voluptate velit esse cillum dolore 

eu fugiat nulla pariatur. 
Excepteur sint occaecat 
cupidatat non proident, 
sunt in culpa qui officia 

deserunt mollit anim id est laborum.

###### *$(date +%d/%m/%Y)*
EOF

# Verifica se o arquivo já existe
if [ -e "$FILENAME" ]; then
    echo "❌ Erro: O arquivo $FILENAME já existe."
    exit 1
fi

# Cria o arquivo
echo "$CONTEUDO" > "$FILENAME"

# Confirmação
echo "✅ Template criado com sucesso: $FILENAME"
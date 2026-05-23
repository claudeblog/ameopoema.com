#!/bin/bash

# Script create-template.sh
# Gera um template Markdown para mdbook com título "template", texto "Lorem Ipsum" e data atual

# Obtém a data atual no formato YYYY-MM-DD
DATA=$(date +%Y-%m-%d)

# Nome do arquivo: DATA-template.md
FILENAME="${DATA}-template.md"

# Conteúdo do template (título, lorem ipsum e data atual)
read -r -d '' CONTEUDO << EOF
# template

Lorem Ipsum

$(date +%d/%m/%Y)
EOF

# Verifica se o arquivo já existe
if [ -e "$FILENAME" ]; then
    echo "Erro: O arquivo '$FILENAME' já existe. Abortando."
    exit 1
fi

# Cria o arquivo
echo "$CONTEUDO" > "$FILENAME"

# Confirmação
echo "Template criado com sucesso: $FILENAME"
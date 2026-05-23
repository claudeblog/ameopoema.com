#!/bin/bash

# Script create-template.sh
# Gera um template Markdown para mdbook com título "template", texto "Lorem Ipsum" e data atual

# Obtém a data atual no formato YYYY-MM-DD
DATA=$(date +%Y-%m-%d)

# Nome do arquivo: DATA-template.md
FILENAME="src/${DATA}-Template.md"

# Conteúdo do template (título, lorem ipsum e data atual)
read -r -d '' CONTEUDO << EOF
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
    echo "Erro: O arquivo '$FILENAME' já existe. Abortando."
    exit 1
fi

# Cria o arquivo
echo "$CONTEUDO" > "$FILENAME"

# Confirmação
echo "Template criado com sucesso: $FILENAME"
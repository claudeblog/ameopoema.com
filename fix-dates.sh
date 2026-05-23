#!/bin/bash

# Pasta onde estão os arquivos .md
TARGET_DIR="./src"

find "$TARGET_DIR" -maxdepth 1 -type f -name "[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-*.md" | while read -r file; do
    filename=$(basename "$file")
    
    # Extrai YYYY-MM-DD (primeiros 10 caracteres)
    date_part="${filename:0:10}"
    year="${date_part:0:4}"
    month="${date_part:5:2}"
    day="${date_part:8:2}"
    formatted_date="$day/$month/$year"

    tmp_file=$(mktemp)

    awk -v newdate="$formatted_date" '
    NR == 1 {
        # Cabeçalho
        print
        # Linha em branco antes do blockquote
        print ""
        # Blockquote com a data
        print "> " newdate
        # Linha em branco depois do blockquote
        print ""
        next
    }
    NR == 2 {
        # Pula a linha original se ela for um blockquote antigo
        if ($0 ~ /^> /) {
            # Não imprime, apenas descarta
        } else {
            # Se não for blockquote, imprime (pode ser conteúdo ou linha em branco)
            print $0
        }
        next
    }
    {
        # Todas as demais linhas são mantidas
        print
    }' "$file" > "$tmp_file"

    mv "$tmp_file" "$file"
    echo "Corrigido: $file -> $formatted_date"
done
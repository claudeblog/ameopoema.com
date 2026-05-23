#!/bin/bash

# Pasta onde estão os arquivos .md
TARGET_DIR="./src"

find "$TARGET_DIR" -maxdepth 1 -type f -name "[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-*.md" | while read -r file; do
    filename=$(basename "$file")
    
    # Extrai YYYY-MM-DD (primeiros 10 caracteres) e converte para DD/MM/YYYY
    date_part="${filename:0:10}"
    year="${date_part:0:4}"
    month="${date_part:5:2}"
    day="${date_part:8:2}"
    formatted_date="$day/$month/$year"

    tmp_file=$(mktemp)

    awk -v newdate="$formatted_date" '
    # Remove linhas que contenham data nos formatos antigos:
    #   > DD/MM/AAAA   (blockquote)
    #   ###### *DD/MM/AAAA*   (h6 itálico)
    # Depois, no final do arquivo, adiciona uma linha em branco e o h6 com a data em itálico.
    {
        # Se a linha não for uma data antiga, guarda
        if ($0 !~ /^> [0-9]{2}\/[0-9]{2}\/[0-9]{4}/ && 
            $0 !~ /^#{6} \*[0-9]{2}\/[0-9]{2}\/[0-9]{4}\*/) {
            lines[++n] = $0
        }
    }
    END {
        # Imprime todas as linhas mantidas
        for (i = 1; i <= n; i++) {
            print lines[i]
        }
        # Adiciona uma linha em branco (garante separação)
        print ""
        # Imprime a data como h6 itálico
        print "###### *" newdate "*"
    }' "$file" > "$tmp_file"

    mv "$tmp_file" "$file"
    echo "Corrigido: $file -> data adicionada ao final como ###### *$formatted_date*"
done
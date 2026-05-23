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
    {
        # Armazena todas as linhas em um array
        lines[++n] = $0
    }
    END {
        # Imprime todas as linhas exceto a última
        for (i = 1; i <= n-1; i++) {
            print lines[i]
        }
        # Trata a última linha
        last = lines[n]
        # Verifica se a última linha já está no formato "###### *DD/MM/AAAA*"
        if (last ~ /^###### \*[0-9]{2}\/[0-9]{2}\/[0-9]{4}\*$/ || 
            last ~ /^###### \*[0-9]{2}\/[0-9]{2}\/[0-9]{4}\*[[:space:]]*$/) {
            # Substitui pela nova data
            print "###### *" newdate "*"
        } else {
            # Mantém a última linha
            print last
            # Adiciona linha em branco se a última não for vazia
            if (last != "") {
                print ""
            }
            # Adiciona a nova data
            print "###### *" newdate "*"
        }
    }' "$file" > "$tmp_file"

    mv "$tmp_file" "$file"
    echo "Corrigido: $file -> data atualizada/adicionada ao final como ###### *$formatted_date*"
done
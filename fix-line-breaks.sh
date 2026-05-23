#!/bin/bash

# Script: fix-line-breaks.sh
# Descrição: Garante que linhas não vazias terminem com 2 espaços,
#            remove linhas vazias duplicadas (deixa no máximo uma por vez),
#            e adiciona 10 linhas com 2 espaços + caractere invisível (zero-width space) no final do arquivo.

echo "🔧 Corrigindo arquivos .md..."

# Define o caractere invisível (zero-width space - U+200B)
INVISIBLE_CHAR=$(printf '\u200B')

find . -name "*.md" -not -path "./book/*" -not -path "./.git/*" -not -path "./node_modules/*" | while read -r file; do
    awk -v invisible="$INVISIBLE_CHAR" '
    BEGIN { blank_printed = 0 }
    {
        gsub(/[[:space:]]+$/, "", $0)
        
        if (length($0) > 0) {
            print $0 "  "
            blank_printed = 0
        } else {
            if (!blank_printed) {
                print ""
                blank_printed = 1
            }
        }
    }
    END {
        for (i = 1; i <= 10; i++) {
            # Imprime dois espaços + o caractere invisível para garantir que seja conteúdo
            print ".  "
        }
    }' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
    echo "   ✔ $file"
done

echo "✅ Concluído: 10 linhas com espaços e caractere invisível adicionadas ao final de cada arquivo."
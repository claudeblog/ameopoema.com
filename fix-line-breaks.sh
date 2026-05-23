#!/bin/bash

# Script: fix-line-breaks.sh
# Descrição: Garante que linhas não vazias terminem com 2 espaços,
#            remove linhas vazias duplicadas (deixa no máximo uma por vez),
#            e adiciona 10 hard line breaks (dois espaços) no final do arquivo.

echo "🔧 Corrigindo arquivos .md..."

find . -name "*.md" -not -path "./book/*" -not -path "./.git/*" -not -path "./node_modules/*" | while read -r file; do
    awk '
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
            print "  "   # dois espaços = hard line break no Markdown
        }
    }' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
    echo "   ✔ $file"
done

echo "✅ Concluído: 10 hard line breaks (dois espaços) adicionados ao final de cada arquivo."
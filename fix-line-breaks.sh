#!/bin/bash

# Script: fix-line-breaks.sh
# Descrição: Garante que linhas não vazias terminem com 2 espaços e
#            remove linhas vazias duplicadas (deixa no máximo uma por vez).

echo "🔧 Garantindo que linhas não vazias terminem com 2 espaços e removendo linhas vazias duplicadas..."

find . -name "*.md" -not -path "./book/*" -not -path "./.git/*" -not -path "./node_modules/*" | while read -r file; do
    awk '
    BEGIN { blank_printed = 0 }
    {
        # Remove qualquer whitespace do final da linha
        gsub(/[[:space:]]+$/, "", $0)
        
        if (length($0) > 0) {
            # Linha com conteúdo: adiciona dois espaços e imprime
            print $0 "  "
            blank_printed = 0   # reseta flag de linha vazia
        } else {
            # Linha vazia (ou só espaços depois da limpeza)
            if (!blank_printed) {
                # Imprime apenas uma linha vazia se a anterior não foi vazia
                print ""
                blank_printed = 1
            }
            # Se blank_printed já for 1, não imprime nada (pula duplicadas)
        }
    }' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
    echo "   ✔ $file"
done

echo "✅ Correção concluída:"
echo "   - Linhas com conteúdo → exatamente 2 espaços no final"
echo "   - Linhas vazias duplicadas → reduzidas a apenas uma"
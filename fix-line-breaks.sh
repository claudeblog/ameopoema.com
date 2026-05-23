#!/bin/bash

# Script: fix-line-breaks.sh
# Descrição: 
#   1. Limpa vestígios de execuções anteriores (remove zero-width spaces e espaços extras).
#   2. Garante que linhas não vazias terminem com 2 espaços.
#   3. Remove linhas vazias duplicadas (deixa no máximo uma por vez).
#   4. Adiciona 10 linhas com 2 espaços + caractere invisível (U+200B) no final do arquivo.

echo "🔧 Limpando e corrigindo arquivos .md..."

# Caractere invisível: zero-width space (U+200B)
INVISIBLE_CHAR=$(printf '\u200B')

find . -name "*.md" \
     -not -path "./book/*" \
     -not -path "./.git/*" \
     -not -path "./node_modules/*" | while read -r file; do

    # Usa awk para fazer limpeza + transformação em um único passe
    awk -v inv="$INVISIBLE_CHAR" '
    BEGIN { blank_printed = 0 }
    {
        # 1. REMOÇÃO DE VESTÍGIOS DE EXECUÇÕES ANTERIORES
        # Remove qualquer caractere invisível (zero-width space) da linha inteira
        gsub(inv, "", $0)
        # Remove qualquer whitespace (espaços, tabs, etc.) do final da linha
        gsub(/[[:space:]]+$/, "", $0)
        
        # 2. NORMALIZAÇÃO DAS LINHAS
        if (length($0) > 0) {
            # Linha com conteúdo: adiciona exatamente dois espaços
            print $0 "  "
            blank_printed = 0
        } else {
            # Linha vazia (depois da limpeza)
            if (!blank_printed) {
                # Imprime apenas uma linha vazia se a anterior não era vazia
                print ""
                blank_printed = 1
            }
            # Se blank_printed == 1, ignora (elimina duplicadas)
        }
    }
    END {
        # 3. ADIÇÃO DAS 10 LINHAS COM DOIS ESPAÇOS + INVISÍVEL
        for (i = 1; i <= 100; i++) {
            # Cada linha contém: dois espaços (hard break) + caractere invisível
            print "  " inv
        }
    }' "$file" > "$file.tmp" && mv "$file.tmp" "$file"

    echo "   ✔ $file"
done

echo "✅ Concluído:"
echo "   - Limpeza de invisíveis e espaços residuais."
echo "   - Linhas com conteúdo → exatamente 2 espaços no final."
echo "   - Linhas vazias duplicadas → reduzidas a apenas uma."
echo "   - Adicionadas 10 linhas com '  + caractere invisível' ao final."
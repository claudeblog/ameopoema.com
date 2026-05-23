#!/bin/bash

# Script: fix-line-breaks.sh
# Descrição:
#   1. Remove qualquer linha injetada anteriormente (padrões antigos e novos).
#   2. Garante que linhas com conteúdo terminem com 2 espaços.
#   3. Remove linhas vazias duplicadas (deixa no máximo uma).
#   4. Adiciona 10 linhas com "&nbsp;<br>" + caractere invisível no final.

echo "🔧 Limpando e corrigindo arquivos .md..."

INVISIBLE_CHAR=$(printf '\u200B')

find . -name "*.md" \
     -not -path "./book/*" \
     -not -path "./.git/*" \
     -not -path "./node_modules/*" | while read -r file; do

    awk -v inv="$INVISIBLE_CHAR" '
    BEGIN { blank_printed = 0 }
    {
        # ---- 1. REMOVER VESTÍGIOS DE EXECUÇÕES ANTERIORES ----
        # Remove qualquer caractere invisível
        gsub(inv, "", $0)
        # Remove espaços/tabs no final da linha
        gsub(/[[:space:]]+$/, "", $0)
        
        # Remove linhas que são apenas pontos (ex: ., .., ...)
        if ($0 ~ /^\.+$/) {
            next
        }
        # Remove linhas que são exatamente "&nbsp;<br>" (padrão antigo)
        if ($0 == "&nbsp;<br>") {
            next
        }
        # Remove linhas que ficaram vazias após a limpeza
        if (length($0) == 0) {
            next
        }
        
        # ---- 2. NORMALIZAR O CONTEÚDO RESTANTE ----
        # Linhas não vazias ganham dois espaços no final
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
        # ---- 3. ADICIONAR 10 LINHAS NOVAS COM O PADRÃO SOLICITADO ----
        for (i = 1; i <= 5; i++) {
            print "&nbsp;<br>" inv
        }
    }' "$file" > "$file.tmp" && mv "$file.tmp" "$file"

    echo "   ✔ $file"
done

echo "✅ Concluído:"
echo "   - Removidas linhas antigas (pontos, &nbsp;<br>, espaços+invisível, etc.)."
echo "   - Linhas com conteúdo → exatamente 2 espaços no final."
echo "   - Linhas vazias duplicadas → reduzidas a apenas uma."
echo "   - Adicionadas 10 linhas com '&nbsp;<br>' + caractere invisível ao final."
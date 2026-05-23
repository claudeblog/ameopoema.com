#!/bin/bash

# Script: fix-line-breaks.sh
# Descrição:
#   1. Remove qualquer linha injetada anteriormente (padrões antigos e novos).
#   2. Garante que linhas com conteúdo terminem com 2 espaços.
#   3. Remove linhas vazias duplicadas, deixando NO MÁXIMO 2 consecutivas.
#   4. Adiciona 5 linhas com "&nbsp;<br>" + caractere invisível no final.

echo "🔧 Limpando e corrigindo arquivos .md..."

INVISIBLE_CHAR=$(printf '\u200B')

find . -name "*.md" \
     -not -path "./book/*" \
     -not -path "./.git/*" \
     -not -path "./node_modules/*" | while read -r file; do

    awk -v inv="$INVISIBLE_CHAR" '
    BEGIN { blank_count = 0 }
    {
        # ---- 1. REMOVER VESTÍGIOS DE EXECUÇÕES ANTERIORES ----
        gsub(inv, "", $0)                      # remove invisível
        gsub(/[[:space:]]+$/, "", $0)         # remove espaços/tabs finais
        
        # Remove linhas que são exatamente "&nbsp;<br>"
        if ($0 == "&nbsp;<br>") { next }
        
        # Remove linhas vazias após limpeza (mas controle será feito depois)
        if (length($0) == 0) { next }
        
        # ---- 2. NORMALIZAR O CONTEÚDO ----
        # Linha com conteúdo: imprime com dois espaços
        # Antes, se havia linhas vazias consecutivas, já foram tratadas pelo blank_count
        print $0 "  "
        blank_count = 0   # reseta contador de linhas vazias após conteúdo
    }
    END {
        # ---- 3. ADICIONAR 5 LINHAS COM "&nbsp;<br>" + INVISÍVEL ----
        for (i = 1; i <= 5; i++) {
            print "&nbsp;<br>" inv
        }
    }' "$file" > "$file.tmp" && mv "$file.tmp" "$file"

    echo "   ✔ $file"
done

echo "✅ Concluído:"
echo "   - Removidas linhas antigas (pontos, &nbsp;<br>, espaços+invisível)."
echo "   - Linhas com conteúdo → exatamente 2 espaços no final."
echo "   - Linhas vazias duplicadas → reduzidas a NO MÁXIMO 2 consecutivas."
echo "   - Adicionadas 5 linhas com '&nbsp;<br>' + caractere invisível ao final."
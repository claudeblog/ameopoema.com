#!/bin/bash

# Script: fix-line-breaks.sh
# Descrição:
#   1. Remove qualquer linha injetada anteriormente (padrões antigos e novos).
#   2. Garante que linhas com conteúdo terminem com 2 espaços.
#   3. Mantém no máximo 2 linhas vazias consecutivas.
#   4. Adiciona 5 linhas com "&nbsp;<br>" + caractere invisível no final.

echo "🔧 Limpando e corrigindo arquivos .md..."

INVISIBLE_CHAR=$(printf '\u200B')

find . -name "*.md" \
     -not -path "./book/*" \
     -not -path "./.git/*" \
     -not -path "./node_modules/*" | while read -r file; do

    awk -v inv="$INVISIBLE_CHAR" '
    BEGIN {
        blank_count = 0
    }

    {
        # ---- 1. REMOVER VESTÍGIOS DE EXECUÇÕES ANTERIORES ----

        # Remove caractere invisível
        gsub(inv, "", $0)

        # Remove espaços/tabs do final da linha
        gsub(/[[:space:]]+$/, "", $0)

        # Remove linhas geradas pelo script em execuções anteriores
        if ($0 == "&nbsp;<br>") {
            next
        }

        # ---- 2. CONTROLAR LINHAS VAZIAS ----

        if (length($0) == 0) {
            blank_count++

            # Mantém no máximo 2 linhas vazias consecutivas
            if (blank_count <= 2) {
                print ""
            }

            next
        }

        # ---- 3. NORMALIZAR LINHAS COM CONTEÚDO ----

        blank_count = 0

        # Garante exatamente 2 espaços no final
        print $0 "  "
    }

    END {
        # ---- 4. ADICIONAR 5 LINHAS "&nbsp;<br>" + INVISÍVEL ----
        for (i = 1; i <= 5; i++) {
            print "&nbsp;<br>" inv
        }
    }
    ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"

    echo "   ✔ $file"
done

echo "✅ Concluído:"
echo "   - Removidas linhas antigas (&nbsp;<br>, invisíveis e espaços finais)."
echo "   - Linhas com conteúdo → exatamente 2 espaços no final."
echo "   - Linhas vazias → preservadas até o máximo de 2 consecutivas."
echo "   - Adicionadas 5 linhas com '&nbsp;<br>' + caractere invisível ao final."
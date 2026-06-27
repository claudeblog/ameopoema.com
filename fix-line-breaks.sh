#!/bin/bash

echo "🔧 Limpando quebras de linha em arquivos .md..."

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
done
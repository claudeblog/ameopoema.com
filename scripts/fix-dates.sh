#!/bin/bash
set -e

# Obtém o diretório onde este script está localizado
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Assume que a raiz do projeto é um nível acima (scripts/ fica na raiz)
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Pasta onde estão os arquivos .md (agora usando caminho absoluto)
TARGET_DIR="${PROJECT_ROOT}/src"

echo "📂 Processando arquivos .md em ${TARGET_DIR}..."

find "$TARGET_DIR" -maxdepth 1 -type f -name "[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-*.md" | while read -r file; do
    filename=$(basename "$file")
    
    # Extrai YYYY-MM-DD (primeiros 10 caracteres) e converte para DD/MM/YYYY
    date_part="${filename:0:10}"
    year="${date_part:0:4}"
    month="${date_part:5:2}"
    day="${date_part:8:2}"
    formatted_date="$day/$month/$year"

    tmp_file=$(mktemp)

    echo "   Processando: $filename -> data $formatted_date"

    awk -v newdate="$formatted_date" '
    # Remove qualquer linha que seja exatamente "###### *DD/MM/AAAA*" (com espaços opcionais no final)
    /^###### \*[0-9]{2}\/[0-9]{2}\/[0-9]{4}\*\s*$/ { next }
    
    # Acumula as demais linhas em um array
    { lines[++n] = $0 }
    
    END {
        # Imprime todo o conteúdo que não era uma linha de data
        for (i = 1; i <= n; i++) {
            print lines[i]
        }
        # Adiciona uma linha em branco somente se a última linha impressa não estiver vazia
        if (n > 0 && lines[n] != "") {
            print ""
        }
        # Adiciona a nova data no final
        print "###### *" newdate "*"
    }' "$file" > "$tmp_file"

    mv "$tmp_file" "$file"
done

echo "✅ Concluído!"
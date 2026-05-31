#!/bin/bash

set -euo pipefail

SRC_DIR="./src"

if [ ! -d "$SRC_DIR" ]; then
    echo "❌ Erro: Diretório $SRC_DIR não encontrado."
    exit 1
fi

cd "$SRC_DIR"

for file in *.md; do
    [ -f "$file" ] || continue

    # Extrai a data do nome (formato YYYY-MM-DD-)
    if [[ ! "$file" =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})- ]]; then
        echo "⚠️  Aviso: $file não começa com data YYYY-MM-DD, pulando."
        continue
    fi
    date="${BASH_REMATCH[1]}"

    # Extrai o título (primeira linha que começa com '# ')
    raw_title=$(grep -m 1 '^# ' "$file" | sed 's/^# //' | sed 's/^[[:space:]]*//' || true)

    if [ -z "$raw_title" ]; then
        echo "⚠️  Aviso: $file não contém cabeçalho # Título, pulando."
        continue
    fi

    # Se o título contiver um hífen, pega apenas a parte após o primeiro hífen
    if [[ "$raw_title" == *-* ]]; then
        cleaned_title="${raw_title#*-}"
        cleaned_title="${cleaned_title## }"
    else
        cleaned_title="$raw_title"
    fi

    # Remove toda pontuação e converte espaços em underscores
    slug=$(echo "$cleaned_title" |
        tr -d '[:punct:]' |
        tr ' ' '_' |
        sed 's/_\+/_/g' |
        sed 's/^_//;s/_$//')

    newname="${date}-${slug}.md"

    if [ "$file" = "$newname" ]; then
        echo "✅ $file já está correto."
        continue
    fi

    if [ -e "$newname" ]; then
        echo "❌ Erro: $newname já existe, não foi possível renomear $file"
        continue
    fi

    echo "🔄 Renomeando: $file -> $newname"
    mv -- "$file" "$newname"
done

echo "🎉 Concluído!"
#!/bin/bash
set -e

SUMMARY_FILE="src/SUMMARY.md"
TMP_SUMMARY=$(mktemp)

# Limpa o conteúdo do arquivo (sem remover o arquivo)
> "$SUMMARY_FILE"

# Gera o novo conteúdo no temporário
cat > "$TMP_SUMMARY" << 'HEAD'
# Sumário

HEAD

# Lista todos os arquivos .md
files=()
for file in src/*.md; do
    [ -f "$file" ] || continue
    basename=$(basename "$file")
    # Ignorar páginas especiais e arquivos que contenham espaços
    [[ "$basename" =~ ^(README|SUMMARY|Sobre|Capa)\.md$ ]] && continue
    [[ "$basename" =~ \  ]] && { echo "⚠️ Ignorando arquivo com espaço: $basename"; continue; }
    # Ignorar arquivos que terminam com Template.md (case-sensitive)
    [[ "$basename" =~ Template\.md$ ]] && continue
    files+=("$file")
done

extract_date() {
    local filename=$(basename "$1")
    [[ "$filename" =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)$ ]] && echo "${BASH_REMATCH[1]}" || echo "0000-00-00"
}

IFS=$'\n' sorted_files=($(for f in "${files[@]}"; do
    echo "$(extract_date "$f") $f"
done | sort -r | awk '{print $2}'))

for file in "${sorted_files[@]}"; do
    basename=$(basename "$file" .md)
    if [[ "$basename" =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)$ ]]; then
        title_part="${BASH_REMATCH[2]}"
    else
        title_part="$basename"
    fi
    title=$(echo "$title_part" | sed 's/_/ /g; s/-/ /g; s/  */ /g')
    rel_path=$(echo "$file" | sed 's|src/||')
    echo "- [$title]($rel_path)" >> "$TMP_SUMMARY"
done

# Adiciona páginas especiais
echo "- [Sumário](SUMMARY.md)" >> "$TMP_SUMMARY"

[ -f "src/Sobre.md" ] && echo "- [Sobre](Sobre.md)" >> "$TMP_SUMMARY"
[ -f "src/Capa.md" ] && echo "- [Capa](Capa.md)" >> "$TMP_SUMMARY"

# Sobrescreve o conteúdo do arquivo original (sem deletá-lo)
cat "$TMP_SUMMARY" > "$SUMMARY_FILE"
rm -f "$TMP_SUMMARY"

echo "✅ SUMMARY.md foi limpo e reescrito (arquivo mantido). Link do Blog adicionado após Sobre."
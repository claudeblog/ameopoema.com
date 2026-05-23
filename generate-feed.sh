#!/bin/bash
# ================= CONFIGURAÇÕES =================
SITE_URL="https://ameopoema.com"
FEED_TITLE="Ame o Poema"
FEED_DESCRIPTION="Poemas do livro Nefelibata"

# Diretório onde este script está localizado (raiz do projeto)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC_DIR="$SCRIPT_DIR/src"               # pasta com os arquivos .md
OUTPUT_FILE="$SCRIPT_DIR/feed.xml"      # feed gerado na raiz
# =================================================

# Gera o cabeçalho do RSS
cat > "$OUTPUT_FILE" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
<channel>
  <title>${FEED_TITLE}</title>
  <link>${SITE_URL}</link>
  <description>${FEED_DESCRIPTION}</description>
  <language>pt-br</language>
  <lastBuildDate>$(LC_TIME=en_US.UTF-8 date "+%a, %d %b %Y %H:%M:%S %z" 2>/dev/null || date -R)</lastBuildDate>
EOF

# Coleta apenas arquivos .md cujo nome comece com DATA (YYYY-MM-DD-)
# Exemplo: 2025-01-01-Haicai_de_Ano_novo.md
# Usa find com regex para garantir o padrão
files=()
while IFS= read -r -d '' file; do
    files+=("$(basename "$file")")
done < <(find "$SRC_DIR" -maxdepth 1 -type f -name '*.md' ! -name 'SUMMARY.md' -print0 | \
         while IFS= read -r -d '' f; do
             basename_f=$(basename "$f")
             # Verifica se o nome começa com 4 dígitos, hífen, 2 dígitos, hífen, 2 dígitos, hífen
             if [[ "$basename_f" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}-.+\.md$ ]]; then
                 printf "%s\0" "$f"
             fi
         done | sort -rz)

# Para cada arquivo, gera um <item>
for filename in "${files[@]}"; do
    filepath="$SRC_DIR/$filename"

    # Extrai a data do nome (YYYY-MM-DD)
    filedate="${filename:0:10}"
    day="${filedate:8:2}"
    month="${filedate:5:2}"
    year="${filedate:0:4}"

    # Converte o mês para abreviatura em inglês (RFC‑2822)
    case $month in
        01) mon="Jan";; 02) mon="Feb";; 03) mon="Mar";;
        04) mon="Apr";; 05) mon="May";; 06) mon="Jun";;
        07) mon="Jul";; 08) mon="Aug";; 09) mon="Sep";;
        10) mon="Oct";; 11) mon="Nov";; 12) mon="Dec";;
        *)  mon="Jan" ;;
    esac
    pubdate="${day} ${mon} ${year} 00:00:00 +0000"

    # Título: primeira linha que começa com "# "
    title=$(sed -n 's/^# //p;q' "$filepath" 2>/dev/null)
    if [ -z "$title" ]; then
        # Fallback: remove data e extensão, substitui underscores por espaços
        title="${filename:11}"
        title="${title%.md}"
        title="${title//_/ }"
    fi

    # Link para o HTML correspondente
    link="${SITE_URL}/${filename%.md}.html"

    # Conteúdo: remove título, data e linhas com &nbsp;<br>
    filtered_content=$(sed -e '1{/^# /d}' -e '/^######/d' -e '/&nbsp;<br>/d' -e '/^[[:space:]]*$/d' "$filepath")
    escaped_content=$(echo "$filtered_content" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g')

    # Adiciona o item ao feed
    cat >> "$OUTPUT_FILE" <<ITEMEOF
  <item>
    <title>$(echo "$title" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g')</title>
    <link>${link}</link>
    <guid isPermaLink="true">${link}</guid>
    <pubDate>${pubdate}</pubDate>
    <description>&lt;pre&gt;${escaped_content}&lt;/pre&gt;</description>
  </item>
ITEMEOF
done

# Fecha as tags do RSS
cat >> "$OUTPUT_FILE" <<EOF
</channel>
</rss>
EOF

echo "Feed gerado em: ${OUTPUT_FILE}"
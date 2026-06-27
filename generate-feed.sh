#!/bin/bash
# ================= CONFIGURAÇÕES =================
SITE_URL="https://ameopoema.com"
FEED_TITLE="Ame o Poema"
FEED_DESCRIPTION="Poesias do Nuvem, Poemas, Palindromos e Haicais, talvez um podcast em algum momento"

# Diretórios
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC_DIR="$SCRIPT_DIR/src"
OUTPUT_FILE="$SCRIPT_DIR/feed.xml"

# Extensões de áudio suportadas (ordem de preferência)
AUDIO_EXTS=("mp3" "m4a" "ogg" "wav")

# Função para obter MIME type baseado na extensão
get_mime_type() {
    case "$1" in
        mp3) echo "audio/mpeg" ;;
        m4a) echo "audio/mp4" ;;
        ogg) echo "audio/ogg" ;;
        wav) echo "audio/wav" ;;
        *)   echo "application/octet-stream" ;;
    esac
}

# Gera o cabeçalho do RSS com namespaces para podcast
cat > "$OUTPUT_FILE" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0"
     xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd"
     xmlns:podcast="https://podcastindex.org/namespace/1.0">
<channel>
  <title>${FEED_TITLE}</title>
  <link>${SITE_URL}</link>
  <description>${FEED_DESCRIPTION}</description>
  <language>pt-br</language>
  <lastBuildDate>$(LC_TIME=en_US.UTF-8 date "+%a, %d %b %Y %H:%M:%S %z" 2>/dev/null || date -R)</lastBuildDate>
  <itunes:author>Claudeblog</itunes:author>
  <itunes:explicit>false</itunes:explicit>
  <itunes:category text="Arte"/>
  <itunes:image href="${SITE_URL}/logo.jpg"/>
EOF

# Coleta apenas arquivos .md que:
# 1) Começam com DATA no formato YYYY-MM-DD-
# 2) NÃO terminam com "Template.md" (case sensitive)
files=()
while IFS= read -r -d '' file; do
    basename_f=$(basename "$file")
    if [[ "$basename_f" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}-.+\.md$ ]] && [[ ! "$basename_f" == *Template.md ]]; then
        files+=("$basename_f")
    fi
done < <(find "$SRC_DIR" -maxdepth 1 -type f -name '*.md' ! -name 'SUMMARY.md' -print0)

# Ordena os arquivos em ordem alfabética decrescente (mais recentes primeiro)
IFS=$'\n' files=($(sort -r <<<"${files[*]}"))
unset IFS

# Para cada arquivo, gera um <item>
for filename in "${files[@]}"; do
    filepath="$SRC_DIR/$filename"
    base="${filename%.md}"
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

    # Título
    title=$(sed -n 's/^# //p;q' "$filepath" 2>/dev/null)
    if [ -z "$title" ]; then
        title="${filename:11}"
        title="${title%.md}"
        title="${title//_/ }"
    fi

    # Link para o HTML
    link="${SITE_URL}/${base}.html"

    # Conteúdo do poema (limpo)
    filtered_content=$(sed -e '1{/^# /d}' -e '/^######/d' -e '/&nbsp;<br>/d' -e '/^[[:space:]]*$/d' "$filepath")
    escaped_content=$(echo "$filtered_content" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g')

    # Procura por arquivo de áudio associado
    audio_url=""
    audio_length=""
    audio_type=""
    audio_duration=""

    for ext in "${AUDIO_EXTS[@]}"; do
        audio_file="$SRC_DIR/$base.$ext"
        if [[ -f "$audio_file" ]]; then
            audio_url="${SITE_URL}/${base}.${ext}"
            audio_length=$(stat -c %s "$audio_file" 2>/dev/null || stat -f %z "$audio_file" 2>/dev/null)
            audio_type=$(get_mime_type "$ext")
            # Tenta obter duração via ffprobe (se disponível)
            if command -v ffprobe &> /dev/null; then
                audio_duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$audio_file" 2>/dev/null | cut -d. -f1)
            fi
            break
        fi
    done

    # Monta o item RSS
    cat >> "$OUTPUT_FILE" <<ITEMEOF
  <item>
    <title>$(echo "$title" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g')</title>
    <link>${link}</link>
    <guid isPermaLink="true">${link}</guid>
    <pubDate>${pubdate}</pubDate>
    <description>&lt;pre&gt;${escaped_content}&lt;/pre&gt;</description>
ITEMEOF

    # Se há áudio, adiciona enclosure e duração
    if [[ -n "$audio_url" ]]; then
        cat >> "$OUTPUT_FILE" <<ENCLOSURE
    <enclosure url="${audio_url}" length="${audio_length}" type="${audio_type}"/>
ENCLOSURE
        if [[ -n "$audio_duration" ]]; then
            cat >> "$OUTPUT_FILE" <<DURATION
    <itunes:duration>${audio_duration}</itunes:duration>
DURATION
        fi
    fi

    # Fecha o item
    echo "  </item>" >> "$OUTPUT_FILE"
done

# Fecha as tags do RSS
cat >> "$OUTPUT_FILE" <<EOF
</channel>
</rss>
EOF

echo "Feed gerado em: ${OUTPUT_FILE}"
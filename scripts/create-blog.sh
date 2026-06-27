#!/bin/bash
set -e

# Obtém o diretório onde este script está localizado
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Assume que a raiz do projeto é um nível acima (scripts/ fica na raiz)
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Define os caminhos dos arquivos (relativos à raiz do projeto)
BOOK_DIR="${PROJECT_ROOT}/book"
INPUT_FILE="${BOOK_DIR}/print.html"
OUTPUT_FILE="${BOOK_DIR}/blog.html"

echo "📄 Criando blog.html a partir do print.html..."
cp "$INPUT_FILE" "$OUTPUT_FILE"

# Remove script de impressão automática (bloco <script>)
echo "🧹 Removendo scripts automáticos de impressão..."
sed -i '/<script>/,/<\/script>/ {
    /window\.print/d
    /window.addEventListener/d
    /window.setTimeout/d
}' "$OUTPUT_FILE"

# Remove um trecho específico com perl (caso o sed acima não tenha capturado tudo)
perl -i -0pe 's/<script>\s*window\.addEventListener\('"'"'load'"'"',\s*function\(\s*\)\s*\{\s*window\.setTimeout\(window\.print,\s*100\s*\);\s*\}\s*\);\s*<\/script>//gis' "$OUTPUT_FILE"

# Substitui </body> por um script que anula window.print
sed -i 's|</body>|<script>window.print = function() { return false; };</script></body>|' "$OUTPUT_FILE"

# REMOVER A SEÇÃO DO SUMÁRIO DO blog.html
echo "📖 Removendo a página de sumário do blog.html..."
sed -i '/<h1 id="sum[áa]rio">/,/<div style="break-before: page; page-break-before: always;"><\/div>/d' "$OUTPUT_FILE"
sed -i '/<h1>Sum[áa]rio<\/h1>/,/<div style="break-before: page; page-break-before: always;"><\/div>/d' "$OUTPUT_FILE"

echo "✅ Pronto! O arquivo foi gerado em ${OUTPUT_FILE}"
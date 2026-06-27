#!/bin/bash
set -e

echo "📄 Criando blog.html a partir do print.html..."

cp book/print.html book/blog.html

# Remove script de impressão automática
sed -i '/<script>/,/<\/script>/ {
    /window\.print/d
    /window.addEventListener/d
    /window.setTimeout/d
}' book/blog.html

perl -i -0pe 's/<script>\s*window\.addEventListener\('"'"'load'"'"',\s*function\(\s*\)\s*\{\s*window\.setTimeout\(window\.print,\s*100\s*\);\s*\}\s*\);\s*<\/script>//gis' book/blog.html

sed -i 's|</body>|<script>window.print = function() { return false; };</script></body>|' book/blog.html

# REMOVER A SEÇÃO DO SUMÁRIO DO blog.html
echo "📖 Removendo a página de sumário do blog.html..."
sed -i '/<h1 id="sum[áa]rio">/,/<div style="break-before: page; page-break-before: always;"><\/div>/d' book/blog.html
sed -i '/<h1>Sum[áa]rio<\/h1>/,/<div style="break-before: page; page-break-before: always;"><\/div>/d' book/blog.html

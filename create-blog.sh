#!/bin/bash
set -e

echo "📄 Criando blog.html a partir do print.html..."

if [ ! -f "book/print.html" ]; then
    echo "❌ book/print.html não encontrado. Execute 'mdbook build' primeiro."
    exit 1
fi

cp book/print.html book/blog.html

# Remove script de impressão automática
sed -i '/<script>/,/<\/script>/ {
    /window\.print/d
    /window.addEventListener/d
    /window.setTimeout/d
}' book/blog.html

perl -i -0pe 's/<script>\s*window\.addEventListener\('"'"'load'"'"',\s*function\(\s*\)\s*\{\s*window\.setTimeout\(window\.print,\s*100\s*\);\s*\}\s*\);\s*<\/script>//gis' book/blog.html

sed -i 's|</body>|<script>window.print = function() { return false; };</script></body>|' book/blog.html

# ============================================================
# REMOVER A SEÇÃO DO SUMÁRIO DO blog.html (método por linha)
# ============================================================
echo "📖 Removendo a página de sumário do blog.html..."

# Remove desde a linha que contém <h1 id="sumário"> até a linha que contém </div> da quebra de página
sed -i '/<h1 id="sum[áa]rio">/,/<div style="break-before: page; page-break-before: always;"><\/div>/d' book/blog.html

# Caso ainda reste algum resíduo (título solto), remove também um possível título sem id
sed -i '/<h1>Sum[áa]rio<\/h1>/,/<div style="break-before: page; page-break-before: always;"><\/div>/d' book/blog.html

echo "✅ Seção do sumário removida."

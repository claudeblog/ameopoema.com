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
# REMOVER TUDO ANTES DA PRIMEIRA QUEBRA DE PÁGINA (inclusive)
# Isso elimina sumário, capa, e qualquer conteúdo prévio.
# ============================================================
echo "📖 Removendo sumário e cabeçalho do blog.html..."

# Remove desde o início do arquivo até a primeira <div style="break-before: page; ..."></div>
perl -i -0pe 's/^.*?<div style="break-before: page; page-break-before: always;"><\/div>//s' book/blog.html

# (Opcional) Remove qualquer outra quebra de página que possa ter ficado no início
sed -i '/<div style="break-before: page; page-break-before: always;"><\/div>/d' book/blog.html

echo "✅ Sumário e cabeçalho removidos. O blog começa diretamente com o primeiro poema."

# ============================================================
# ADICIONAR BOTÃO "BLOG" EM TODAS AS PÁGINAS
# ============================================================
echo "🔘 Inserindo botão 'Blog' à esquerda do ícone de impressão..."

BLOG_BUTTON='<a href="blog.html" title="Ver todos os poemas em sequência" aria-label="Blog" style="margin-left: 8px; display: inline-flex; align-items: center; gap: 4px; color: gray; font-weight: bolder;">Blog</a>'

find book -maxdepth 1 -name "*.html" ! -name "print.html" ! -name "blog.html" -type f | while read -r page; do
    perl -i -0pe 's|<a href="blog\.html"[^>]*>.*?Blog<\/a>||gs' "$page"
    perl -i -0pe 's|(<div class="right-buttons">)(.*?)(<a href="print\.html")|\1'"$BLOG_BUTTON"'\2\3|s' "$page"
    echo "   ✅ Botão inserido em: $(basename "$page")"
done

echo "✅ Botão 'Blog' adicionado em todas as páginas."

# ============================================================
# TORNAR blog.html A PÁGINA PADRÃO
# ============================================================
echo "🔀 Tornando blog.html a página principal..."

if [ -f "book/blog.html" ]; then
    cp book/blog.html book/index.html
    echo "✅ index.html substituído pelo conteúdo do blog. A raiz agora exibe o blog diretamente."
else
    echo "❌ blog.html não encontrado para substituir index.html."
fi

echo "🎉 Tudo pronto! O blog agora é a página inicial do livro (index.html)."
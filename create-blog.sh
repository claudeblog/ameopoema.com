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

# ============================================================
# ADICIONAR BOTÃO "BLOG" EM TODAS AS PÁGINAS (à esquerda do ícone de impressão)
# ============================================================
echo "🔘 Inserindo botão 'Blog' à esquerda do ícone de impressão..."

BLOG_BUTTON='<a href="blog.html" title="Ver todos os poemas" aria-label="Blog" style="margin-left: 8px; display: inline-flex; align-items: center; gap: 4px; color: gray; font-weight: bolder;">Blog</a>'
RSS_BUTTON='<a href="feed.xml" title="Feed RSS" aria-label="RSS" style="margin-left: 8px; display: inline-flex; align-items: center; gap: 4px; color: gray; font-weight: bolder;">RSS</a>'

# Combina os dois botões (a ordem define qual aparece primeiro)
BOTH_BUTTONS="${BLOG_BUTTON}${RSS_BUTTON}"

# Processa todas as páginas HTML na raiz da pasta book (exceto print.html e blog.html)
find book -maxdepth 1 -name "*.html" ! -name "print.html" -type f | while read -r page; do
    # Remove qualquer botão Blog existente
    perl -i -0pe 's|<a href="blog\.html"[^>]*>.*?Blog<\/a>||gs' "$page"
    
    # Insere o botão dentro da div .right-buttons, antes do link de impressão
    perl -i -0pe 's|(<div class="right-buttons">)(.*?)(<a href="print\.html")|\1'"$BOTH_BUTTONS"'\2\3|s' "$page"
    
    echo "   ✅ Botão inserido em: $(basename "$page")"
done

echo "✅ Botão 'Blog' adicionado em todas as páginas (à esquerda do ícone de impressão)."
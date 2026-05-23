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

echo "✅ blog.html criado."

# ============================================================
# ADICIONAR BOTÃO "BLOG" NA BARRA SUPERIOR (à esquerda do ícone de impressão)
# ============================================================
echo "🔘 Inserindo botão 'Blog' à esquerda do ícone de impressão..."

# Usando apenas texto + emoji – sem SVG customizado
BLOG_BUTTON='<a href="blog.html" title="Ver todos os poemas em sequência" aria-label="Blog" style="margin-left: 8px; display: inline-flex; align-items: center; gap: 4px;">📖 Blog</a>'

# Processa todas as páginas HTML (exceto print.html e blog.html)
find book -maxdepth 1 -name "*.html" ! -name "print.html" ! -name "blog.html" -type f | while read -r page; do
    # Remove qualquer botão Blog existente
    perl -i -0pe 's|<a href="blog\.html"[^>]*>.*?Blog<\/a>||gs' "$page"
    
    # Insere o botão DENTRO de .right-buttons, ANTES do link de impressão
    perl -i -0pe 's|(<div class="right-buttons">)(.*?)(<a href="print\.html")|\1'"$BLOG_BUTTON"'\2\3|s' "$page"
    
    echo "   ✅ Botão inserido (antes do print) em: $(basename "$page")"
done

echo "✅ Botão 'Blog' adicionado à esquerda do ícone de impressão."
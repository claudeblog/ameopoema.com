#!/bin/bash
set -e

echo "📄 Criando blog.html a partir do print.html..."

# Verifica se o print.html foi gerado
if [ ! -f "book/print.html" ]; then
    echo "❌ book/print.html não encontrado. Execute 'mdbook build' primeiro."
    exit 1
fi

# Copia o print.html para blog.html
cp book/print.html book/blog.html

# Remove o script que chama window.print() – exatamente o bloco que você mostrou
sed -i '/<script>/,/<\/script>/ {
    /window\.print/d
    /window.addEventListener/d
    /window.setTimeout/d
}' book/blog.html

# Caso o bloco inteiro precise ser removido de forma mais agressiva (linhas consecutivas)
perl -i -0pe 's/<script>\s*window\.addEventListener\('"'"'load'"'"',\s*function\(\s*\)\s*\{\s*window\.setTimeout\(window\.print,\s*100\s*\);\s*\}\s*\);\s*<\/script>//gis' book/blog.html

# Adiciona um script de bloqueio como fallback (garantia total)
sed -i 's|</body>|<script>window.print = function() { return false; };</script></body>|' book/blog.html

echo "✅ blog.html criado com sucesso (prompt de impressão desativado)."

# ============================================================
# ADICIONAR BOTÃO "BLOG" NA BARRA SUPERIOR (ao lado do ícone de impressão)
# ============================================================
echo "🔘 Adicionando botão 'Blog' na barra superior de todas as páginas..."

# Ícone SVG de livro + texto "Blog". Você pode personalizar.
BLOG_BUTTON='<a href="blog.html" title="Ver todos os poemas em sequência" aria-label="Blog" style="margin-left: 8px; display: inline-flex; align-items: center; gap: 4px;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="18" height="18" fill="currentColor"><path d="M249.6 471.5c10.8 3.8 22.4-4.1 22.4-15.5V78.6c0-4.2-1.6-8.4-5-11C247.4 52 202.4 32 144 32C87.5 32 35.1 48.6 9 59.9c-5.6 2.4-9 8-9 14V454.1c0 11.9 12.8 20.2 24.1 16.5C55.6 460.1 105.5 448 144 448c33.9 0 79 14 105.6 23.5zm76.8 0C353 462 398.1 448 432 448c38.5 0 88.4 12.1 119.9 22.6c11.3 3.7 24.1-4.6 24.1-16.5V73.9c0-6-3.4-11.6-9-14C511.9 48.6 459.5 32 403 32c-58.4 0-103.4 20-125 32.6c-3.4 2.6-5 6.8-5 11V456c0 11.4 11.6 19.3 22.4 15.5z"/></svg> Blog</a>'

# Percorre todas as páginas HTML na raiz da pasta book (exceto print.html e blog.html)
find book -maxdepth 1 -name "*.html" ! -name "print.html" ! -name "blog.html" -type f | while read -r page; do
    # Verifica se a página contém a div .right-buttons (onde fica o ícone de impressão)
    if grep -q '<div class="right-buttons">' "$page"; then
        # Insere o botão ANTES do fechamento da div (ao lado do botão de impressão)
        sed -i "s|</div>|${BLOG_BUTTON}</div>|" "$page"
        echo "   ✅ Botão adicionado em: $(basename "$page")"
    else
        echo "   ⚠️ Estrutura 'right-buttons' não encontrada em: $(basename "$page")"
    fi
done

echo "✅ Botão 'Blog' adicionado em todas as páginas (ao lado do ícone de impressão)."
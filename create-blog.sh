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
# ADICIONAR PLAYER DE MÚSICA NO TOPO DO BLOG
# ============================================================
echo "🎵 Inserindo trilha sonora no topo da página do blog..."

AUDIO_PLAYER='<audio controls style="width: 100%; margin: 1rem 0;">
<source src="sigmamusicart-piano-music-504007.mp3" type="audio/mpeg">
Seu navegador não suporta o player de áudio.
</audio>'

# Insere o player logo após a tag <body>
perl -i -0pe 's/(<body[^>]*>)/\1\n'"$AUDIO_PLAYER"'\n/s' book/blog.html

echo "✅ Player de áudio adicionado ao blog.html."

# ============================================================
# ADICIONAR BOTÃO "BLOG" EM TODAS AS PÁGINAS (à esquerda do ícone de impressão)
# ============================================================
echo "🔘 Inserindo botão 'Blog' à esquerda do ícone de impressão..."

BLOG_BUTTON='<a href="blog.html" title="Ver todos os poemas em sequência" aria-label="Blog" style="margin-left: 8px; display: inline-flex; align-items: center; gap: 4px; color: gray; font-weight: bolder;">Blog</a>'

# Processa todas as páginas HTML na raiz da pasta book (exceto print.html e blog.html)
find book -maxdepth 1 -name "*.html" ! -name "print.html" ! -name "blog.html" -type f | while read -r page; do
    # Remove qualquer botão Blog existente
    perl -i -0pe 's|<a href="blog\.html"[^>]*>.*?Blog<\/a>||gs' "$page"
    
    # Insere o botão dentro da div .right-buttons, antes do link de impressão
    perl -i -0pe 's|(<div class="right-buttons">)(.*?)(<a href="print\.html")|\1'"$BLOG_BUTTON"'\2\3|s' "$page"
    
    echo "   ✅ Botão inserido em: $(basename "$page")"
done

echo "✅ Botão 'Blog' adicionado em todas as páginas (à esquerda do ícone de impressão)."

# ============================================================
# TORNAR blog.html A PÁGINA PADRÃO (index.html = blog.html)
# ============================================================
echo "🔀 Tornando blog.html a página principal..."

if [ -f "book/blog.html" ]; then
    cp book/blog.html book/index.html
    echo "✅ index.html substituído pelo conteúdo do blog (já com áudio). A raiz agora exibe o blog diretamente."
else
    echo "❌ blog.html não encontrado para substituir index.html."
fi

echo "🎉 Tudo pronto! O blog com trilha sonora é a página inicial do livro."
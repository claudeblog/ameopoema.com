#!/bin/bash
set -e

export PATH="$HOME/.cargo/bin:$PATH"

# Domain for GitHub Pages custom domain
DOMAIN="ameopoema.com.br"

# ------------------------------------------------------------
# Função: garantir que toda linha NÃO vazia termine com 2 espaços
# ------------------------------------------------------------
fix_line_breaks() {
    echo "🔧 Garantindo que todas as linhas não vazias terminem com 2 espaços..."
    find . -name "*.md" -not -path "./book/*" -not -path "./.git/*" -not -path "./node_modules/*" | while read -r file; do
        awk '
        {
            # Remove espaços/tabs no final, mas mantém o conteúdo
            gsub(/[[:space:]]+$/, "", $0)
            if (length($0) > 0) {
                # Linha não vazia: adiciona exatamente dois espaços
                print $0 "  "
            } else {
                # Linha vazia: imprime vazia (sem espaços)
                print ""
            }
        }' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
        echo "   ✔ $file"
    done
    echo "✅ Correção concluída: todas as linhas com conteúdo agora têm 2 espaços no final."
}

# ------------------------------------------------------------
echo "🔄 Atualizando SUMMARY.md..."
./update-summary.sh

# Corrige line breaks em todos os .md antes de commitar
fix_line_breaks

if [ -n "$(git status --porcelain)" ]; then
    echo "📝 Adicionando todas as alterações..."
    git add .
    commit_date=$(date '+%Y-%m-%d %H:%M:%S')
    changed_files=$(git diff --cached --name-only)
    git commit -m "Atualização automática em $commit_date
Arquivos alterados:
$changed_files"

    echo "📤 Enviando commit para o repositório remoto..."
    git push origin HEAD
else
    echo "ℹ️ Nenhuma alteração para commitar."
fi

echo "📚 Construindo o site com mdBook..."
mdbook build

# --- CRIAR E GARANTIR O ARQUIVO CNAME ---
echo "🌐 Configurando domínio personalizado: $DOMAIN"
echo "$DOMAIN" > book/CNAME
if [ ! -f "CNAME" ]; then
    echo "$DOMAIN" > CNAME
    echo "   (Arquivo CNAME criado na raiz do repositório)"
fi

echo "🚀 Publicando para gh-pages..."
TMP_DIR=$(mktemp -d -t gh-pages-deploy-XXXXXX)
cp -r book/* "$TMP_DIR/"
cd "$TMP_DIR"
git init
git checkout -b gh-pages
git add .
git commit -m "Deploy do site - $(date '+%Y-%m-%d %H:%M:%S')"
git remote add origin git@github.com:claudeblog/nefelibata.git
git push origin gh-pages --force
cd -
rm -rf "$TMP_DIR"

echo "✅ Publicação concluída! O domínio $DOMAIN foi persistido."
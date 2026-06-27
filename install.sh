#!/bin/bash
set -e

# ----------------------------------------------------------------------
# Verifica se o arquivo .env existe
# ----------------------------------------------------------------------
if [ ! -f .env ]; then
    echo "❌ Arquivo .env não encontrado. Crie um arquivo .env com as configurações necessárias."
    exit 1
fi

echo "📄 Carregando arquivo env..."
set -a
. .env
set +a

# ----------------------------------------------------------------------
# Gera o book.toml a partir das variáveis do .env
# ----------------------------------------------------------------------
echo "📝 Gerando book.toml..."
cat > book.toml <<EOF
[book]
title = "$BOOK_TITLE"
authors = ["$BOOK_AUTHORS"]
language = "$BOOK_LANGUAGE"

[output.html]
default-theme = "$OUTPUT_HTML_DEFAULT_THEME"
preferred-dark-theme = "$OUTPUT_HTML_PREFERRED_DARK_THEME"
EOF

echo "✅ book.toml criado com sucesso."

# ----------------------------------------------------------------------
# Instalação dos pré-requisitos
# ----------------------------------------------------------------------
echo "🔧 Instalando pré-requisitos para o projeto mdBook..."

# Detecta distribuição
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
else
    echo "⚠️ Não foi possível detectar a distribuição Linux."
    exit 1
fi

# Função para instalar pacotes base
install_packages() {
    case "$DISTRO" in
        ubuntu|debian)
            sudo apt update
            sudo apt install -y git curl build-essential ffmpeg
            ;;
        fedora)
            sudo dnf install -y git curl @development-tools ffmpeg
            ;;
        *)
            echo "⚠️ Distribuição não suportada: $DISTRO"
            exit 1
            ;;
    esac
}

install_packages

# Instala Rust se necessário
if ! command -v rustc &> /dev/null; then
    echo "🦀 Instalando Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

# Carrega Rust/Cargo no shell atual
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

export PATH="$HOME/.cargo/bin:$PATH"

# Instala mdBook
if ! command -v mdbook &> /dev/null; then
    echo "📚 Instalando mdBook..."
    cargo install mdbook
else
    echo "✅ mdBook já instalado."
fi

# Adiciona ~/.cargo/bin ao PATH permanentemente
if ! grep -q 'export PATH="$HOME/.cargo/bin:$PATH"' ~/.bashrc; then
    echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
    echo "➕ PATH atualizado no ~/.bashrc"
fi

# ----------------------------------------------------------------------
# Dar permissão de execução para todos os scripts .sh existentes
# ----------------------------------------------------------------------
echo "🔑 Dando permissão de execução para os scripts .sh..."

# Lista de scripts esperados (opcional – também pode usar find)
scripts=(
    "fix-dates.sh"
    "fix-line-breaks.sh"
    "publish.sh"
    "update-summary.sh"
    "template.sh"
    "rename-files.sh"
    "create-blog.sh"
    "generate-feed.sh"
    "git-push.sh"
)

for script in "${scripts[@]}"; do
    if [ -f "$script" ]; then
        chmod +x "$script"
        echo "   ✔ $script"
    else
        echo "   ⚠️ $script não encontrado – ignorado."
    fi
done

# ----------------------------------------------------------------------
# Verifica se o comando ffprobe está disponível
# ----------------------------------------------------------------------
if command -v ffprobe &> /dev/null; then
    echo "✅ ffprobe instalado – o feed RSS poderá incluir a duração dos áudios."
else
    echo "⚠️ ffprobe não encontrado. A duração dos áudios não será adicionada ao feed."
    echo "   Tente reiniciar o terminal ou instalar o ffmpeg manualmente."
fi

echo "🎉 Instalação concluída!"
echo "Use ./publish.sh para atualizar SUMMARY.md, corrigir quebras de linha, commitar alterações e publicar o site."
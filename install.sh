#!/bin/bash
set -e

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
            sudo apt install -y git curl build-essential
            ;;
        fedora)
            sudo dnf install -y git curl @development-tools
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

# ------------------------------------------------------------
# Dar permissão de execução para todos os scripts .sh existentes
# ------------------------------------------------------------
echo "🔑 Dando permissão de execução para os scripts .sh..."

# Lista de scripts esperados (opcional – também pode usar find)
scripts=(
    "fix-dates.sh"
    "fix-line-breaks.sh"
    "publish.sh"
    "rename_.sh"
    "update-summary.sh"
    "template.sh"
)

for script in "${scripts[@]}"; do
    if [ -f "$script" ]; then
        chmod +x "$script"
        echo "   ✔ $script"
    else
        echo "   ⚠️ $script não encontrado – ignorado."
    fi
done


echo "🎉 Instalação concluída!"
echo "Use ./publish.sh para atualizar SUMMARY.md, corrigir quebras de linha, commitar alterações e publicar o site."
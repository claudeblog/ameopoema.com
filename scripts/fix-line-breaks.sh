#!/bin/bash
set -e

# Obtém o diretório onde este script está localizado
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Assume que a raiz do projeto é um nível acima (scripts/ fica na raiz)
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "🔧 Limpando quebras de linha em arquivos .md na raiz do projeto: $PROJECT_ROOT"

# Navega para a raiz para que o find use caminhos relativos a partir de .
cd "$PROJECT_ROOT"

# Caractere invisível (zero-width space) usado para controle
INVISIBLE_CHAR=$(printf '\u200B')

# Diretórios a serem ignorados (listagem facilmente ajustável)
EXCLUDE_DIRS=(
    "./book"
    "./.git"
    "./node_modules"
)

# Monta os argumentos -not -path para o find
EXCLUDE_PATTERNS=()
for dir in "${EXCLUDE_DIRS[@]}"; do
    EXCLUDE_PATTERNS+=(-not -path "${dir}/*")
done

find . -name "*.md" "${EXCLUDE_PATTERNS[@]}" | while read -r file; do
    echo "   Processando: $file"

    # Usa um arquivo temporário seguro (mktemp) para evitar conflitos
    tmp_file=$(mktemp)
    
    awk -v inv="$INVISIBLE_CHAR" '
    BEGIN {
        blank_count = 0
    }

    {
        # ---- 1. REMOVER VESTÍGIOS DE EXECUÇÕES ANTERIORES ----

        # Remove caractere invisível
        gsub(inv, "", $0)

        # Remove espaços/tabs do final da linha
        gsub(/[[:space:]]+$/, "", $0)

        # Remove linhas geradas pelo script em execuções anteriores
        if ($0 == "&nbsp;<br>") {
            next
        }

        # ---- 2. CONTROLAR LINHAS VAZIAS ----

        if (length($0) == 0) {
            blank_count++

            # Mantém no máximo 2 linhas vazias consecutivas
            if (blank_count <= 2) {
                print ""
            }

            next
        }

        # ---- 3. NORMALIZAR LINHAS COM CONTEÚDO ----

        blank_count = 0

        # Garante exatamente 2 espaços no final
        print $0 "  "
    }

    END {
        # ---- 4. ADICIONAR 5 LINHAS "&nbsp;<br>" + INVISÍVEL ----
        for (i = 1; i <= 5; i++) {
            print "&nbsp;<br>" inv
        }
    }
    ' "$file" > "$tmp_file" && mv "$tmp_file" "$file"
    
    # Remove o temporário se algo der errado (não deve acontecer, mas por segurança)
    rm -f "$tmp_file" 2>/dev/null || true
done

echo "✅ Limpeza concluída!"
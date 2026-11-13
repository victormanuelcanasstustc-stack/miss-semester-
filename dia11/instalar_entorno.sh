#!/usr/bin/env bash
# Instalador reproducible para Missing Semester.
# Compatible con Git Bash en Windows y Bash en Ubuntu/Linux.

set -Eeuo pipefail

log() {
    printf '\n[%s] %s\n' "$(date '+%H:%M:%S')" "$1"
}

fail() {
    printf '\nERROR: %s\n' "$1" >&2
    exit 1
}

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

log "Detectando el sistema operativo..."
OS="$(uname -s)"
case "$OS" in
    MINGW*|MSYS*|CYGWIN*)
        PLATFORM="windows-git-bash"
        ;;
    Linux*)
        PLATFORM="linux"
        ;;
    *)
        fail "Sistema no compatible: $OS. Se requiere Git Bash o Linux."
        ;;
esac
printf 'Plataforma: %s\n' "$PLATFORM"

log "Comprobando e instalando herramientas necesarias..."

if [[ "$PLATFORM" == "linux" ]] && command -v apt-get >/dev/null 2>&1; then
    REQUIRED_PACKAGES=()

    command -v git >/dev/null 2>&1 || REQUIRED_PACKAGES+=(git)
    command -v node >/dev/null 2>&1 || REQUIRED_PACKAGES+=(nodejs)
    command -v npm >/dev/null 2>&1 || REQUIRED_PACKAGES+=(npm)
    command -v python3 >/dev/null 2>&1 || REQUIRED_PACKAGES+=(python3)
    python3 -m venv --help >/dev/null 2>&1 || REQUIRED_PACKAGES+=(python3-venv)
    python3 -m pip --version >/dev/null 2>&1 || REQUIRED_PACKAGES+=(python3-pip)

    if (( ${#REQUIRED_PACKAGES[@]} > 0 )); then
        log "Instalando paquetes del sistema: ${REQUIRED_PACKAGES[*]}"

        if [[ "$EUID" -eq 0 ]]; then
            apt-get update
            apt-get install -y "${REQUIRED_PACKAGES[@]}"
        elif command -v sudo >/dev/null 2>&1; then
            sudo apt-get update
            sudo apt-get install -y "${REQUIRED_PACKAGES[@]}"
        else
            fail "Se necesitan permisos de administrador para instalar: ${REQUIRED_PACKAGES[*]}"
        fi
    fi
fi

for tool in git node npm; do
    command -v "$tool" >/dev/null 2>&1 || fail "No se encontró $tool. En Windows Git Bash debes instalarlo previamente."
done

if command -v python >/dev/null 2>&1; then
    PYTHON_BIN="python"
elif command -v python3 >/dev/null 2>&1; then
    PYTHON_BIN="python3"
else
    fail "No se encontró Python 3.11 o superior."
fi

PYTHON_VERSION="$("$PYTHON_BIN" -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
if ! "$PYTHON_BIN" -c 'import sys; sys.exit(0 if sys.version_info >= (3, 11) else 1)'; then
    fail "Se requiere Python 3.11 o superior. Versión detectada: $PYTHON_VERSION"
fi

printf 'Git: %s\n' "$(git --version)"
printf 'Python: %s\n' "$("$PYTHON_BIN" --version)"
printf 'Node: %s\n' "$(node --version)"
printf 'npm: %s\n' "$(npm --version)"

log "Creando el entorno virtual del repositorio..."
VENV="$ROOT/.venv"
if [[ ! -d "$VENV" ]]; then
    "$PYTHON_BIN" -m venv "$VENV"
fi

if [[ "$PLATFORM" == "windows-git-bash" ]]; then
    # Git Bash utiliza Scripts en los entornos virtuales de Windows.
    # shellcheck disable=SC1091
    source "$VENV/Scripts/activate"
else
    # shellcheck disable=SC1091
    source "$VENV/bin/activate"
fi

log "Actualizando pip e instalando el proyecto y Ruff..."
python -m pip install --upgrade pip
python -m pip install -e "$ROOT/dia08" ruff

log "Comprobando Ruff..."
ruff --version

log "Configurando alias de Bash sin duplicarlos..."
BASHRC="$HOME/.bashrc"
touch "$BASHRC"

if ! grep -qF '# >>> missing-semester aliases >>>' "$BASHRC"; then
    {
        printf '\n# >>> missing-semester aliases >>>\n'
        printf "alias cproyecto='cd %q'\n" "$ROOT"

        cat <<'ALIASES'
alias ll='ls -lah'
alias gs='git status'
alias ultimos='git log -5 --oneline'
alias guardar='git add .'
alias subir='git push'
alias py='python'
alias buscarpy='find . -type f -name "*.py" -not -path "./.git/*" -not -path "./.venv/*"'
# <<< missing-semester aliases <<<
ALIASES
    } >> "$BASHRC"

    log "Alias agregados a $BASHRC"
else
    log "El bloque de alias ya existe; no se duplicó."
fi

log "Configurando SSH para GitHub si existe una llave..."
SSH_DIR="$HOME/.ssh"
SSH_KEY="$SSH_DIR/id_ed25519"
SSH_CONFIG="$SSH_DIR/config"

if [[ -f "$SSH_KEY" ]]; then
    mkdir -p "$SSH_DIR"
    touch "$SSH_CONFIG"
    if ! grep -qE '^[[:space:]]*Host[[:space:]]+github\.com([[:space:]]|$)' "$SSH_CONFIG"; then
        cat >> "$SSH_CONFIG" <<'SSHCFG'

Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
    IdentitiesOnly yes
SSHCFG
        log "Se agregó la configuración de GitHub. La llave privada no fue leída ni copiada."
    else
        log "Ya existe una configuración para github.com; se conservó."
    fi
else
    log "No se encontró id_ed25519. Se omitió la configuración SSH."
fi

log "Comprobando la configuración de VS Code..."
if command -v code >/dev/null 2>&1; then
    code --install-extension ms-python.python --force
    code --install-extension ms-python.vscode-pylance --force
    code --install-extension ms-python.black-formatter --force
    code --install-extension charliermarsh.ruff --force
    log "Extensiones de VS Code comprobadas/instaladas."
else
    log "VS Code no está disponible en este entorno. Se conservarán los ajustes del repositorio en .vscode."
fi

log "Verificando la instalación del proyecto..."
python -c "import numpy; print('NumPy:', numpy.__version__)"
python -m pip check

log "Instalación finalizada."
printf '\nEntorno: %s\n' "$VENV"
printf 'Repositorio: %s\n' "$ROOT"
printf 'Para cargar los alias en esta terminal, ejecuta: source ~/.bashrc\n'
printf 'Para activar el entorno virtual en otra terminal, ejecuta: source .venv/bin/activate (Linux) o source .venv/Scripts/activate (Git Bash en Windows).\n'

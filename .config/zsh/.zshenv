source $ZDOTDIR/path.zsh

# Setup temp dir
export TMPDIR="/tmp/${USER}"
if [[ ! -d "$TMPDIR" ]]; then
  mkdir -p "$TMPDIR"
fi
TMPPREFIX="${TMPDIR%/}/zsh"

#
# XDG Base Directory compliance hacks
#
: "${XDG_CONFIG_HOME:=$HOME/.config}"
: "${XDG_CACHE_HOME:=$HOME/.cache}"
: "${XDG_DATA_HOME:=$HOME/.local/share}"
: "${XDG_RUNTIME_DIR:=$TMPDIR}"

# asdf
export ASDF_CONFIG_FILE="${XDG_CONFIG_HOME}/asdf/asdfrc"
export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME="${XDG_CONFIG_HOME}/asdf/tool-versions"
export ASDF_DATA_DIR="${XDG_DATA_HOME}/asdf"
export ASDF_PYTHON_DEFAULT_PACKAGES_FILE="${XDG_CONFIG_HOME}/asdf/python-default-packages"

# android
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME}/android"

# docker
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"

# gradle
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"

# less
export LESSHISTFILE="${XDG_CACHE_HOME}/less/history"
export LESSKEY="${XDG_CONFIG_HOME}/less/lesskey"

# gnupg
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
mkdir -p -m700 "${GNUPGHOME}"

# python
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/startup.py"
export IPYTHONDIR="${XDG_CONFIG_HOME}/jupyter"
export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME}/jupyter"

# xinit and xauth
export XINITRC="${XDG_CONFIG_HOME}/X11/xinitrc"
export XSERVERRC="${XDG_CONFIG_HOME}/X11/xserverrc"
export XAUTHORITY="${XDG_RUNTIME_DIR}/Xauthority"

# gtk-2.0
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"

# awscli & boto
export AWS_CONFIG_FILE="${XDG_CONFIG_HOME}/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="${XDG_CONFIG_HOME}/aws/credentials"

# azure cli
export AZURE_CONFIG_DIR="${XDG_CONFIG_HOME}/azure"

# rust
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export MULTIRUST_HOME="${RUSTUP_HOME}"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"

# gimp
export GIMP2_DIRECTORY="${XDG_CONFIG_HOME}/gimp"

# node, npm, nvm
export NODE_REPL_HISTORY="${XDG_CACHE_HOME}/node/repl_history"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"
export NPM_CONFIG_TMP="${XDG_RUNTIME_DIR}/npm"

# httpie
export HTTPIE_CONFIG_DIR="${XDG_CONFIG_HOME}/httpie"

# leiningen
export LEIN_HOME="${XDG_DATA_HOME}/lein"

# postgres
mkdir -p "${XDG_CACHE_HOME}/postgresql"
export PSQL_HISTORY="${XDG_CACHE_HOME}/postgresql/psql_history"

# fucking go
export GOPATH="${HOME}/code/go"

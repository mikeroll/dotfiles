if [[ "$(uname -s)" == "Darwin" ]] && (( $+commands[asdf] )); then
    . "$HOMEBREW_PREFIX"/opt/asdf/asdf.sh
elif [[ "$(uname -s)" == "Linux" ]] && [[ -d /opt/asdf-vm ]]; then
     . /opt/asdf-vm/asdf.sh
fi

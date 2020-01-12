if (( $+commands[asdf] )) then
    if [[ "$(uname -s)" == "Darwin" ]]; then
        . "/usr/local/opt/asdf/asdf.sh"
    fi
fi

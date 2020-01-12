if (( $+commands[direnv] )); then
    _direnv_hook() { eval "$(direnv export zsh)"; }
    add-zsh-hook precmd _direnv_hook
fi

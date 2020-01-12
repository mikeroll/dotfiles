# Custom completion functions.
# Defintions here, compctl and such in the main .zshrc.

function _completions.pip {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}

function _completions.django {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             DJANGO_AUTO_COMPLETE=1 $words[1] ) )
}

(( $+commands[asdf] )) && . "/usr/local/etc/bash_completion.d/asdf.bash"

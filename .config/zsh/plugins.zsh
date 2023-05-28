if [[ ! -f $HOME/.local/share/zinit/zinit.zsh ]]; then
  git clone https://github.com/zdharma/zinit.git $HOME/.local/share/zinit
fi

zcompile $HOME/.local/share/zinit/zinit.zsh
source $HOME/.local/share/zinit/zinit.zsh

# export DIRENV_LOG_FORMAT=
zinit light _local/direnv

zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_USE_ASYNC=1

zinit light zdharma/fast-syntax-highlighting
FAST_HIGHLIGHT_STYLES[variable]="none"
zle_highlight+=(paste:none)

# zinit light hlissner/zsh-autopair

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
# zinit light _local/starship

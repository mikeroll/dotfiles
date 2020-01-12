# vim: foldmethod=marker
#
# Configuration for the interactive shell
#

#
# PATHs
#
# {{{
source $ZDOTDIR/path.zsh
# }}}

#
# ZPlugins
#
# {{{
if [[ ! -f $HOME/.local/share/zplugin/zplugin.zsh ]]; then
  git clone https://github.com/zdharma/zplugin.git $HOME/.local/share/zplugin
fi

zcompile $HOME/.local/share/zplugin/zplugin.zsh
source $HOME/.local/share/zplugin/zplugin.zsh

zplugin light _local/asdf

export DIRENV_LOG_FORMAT=
zplugin light _local/direnv

zplugin light zdharma/fast-syntax-highlighting
FAST_HIGHLIGHT_STYLES[variable]="none"
zle_highlight+=(paste:none)

zplugin light hlissner/zsh-autopair

zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure
# }}}

#
# Environment
#
# {{{
export EDITOR=nvim
export PAGER=less
# }}}

#
# Aliases & helper functions
#
# {{{
# everyday utils
alias ls='ls --color=auto'
alias ll='ls -sla'
alias mkdir='mkdir -p'
alias ssh='TERM=xterm ssh'

# Python
alias da='django-admin'

function mkcdir() { mkdir -p "$1"; cd "$1" }
# }}}

#
# Helpers, wrappers, "source this" scripts
#
# {{{
# }}}

#
# Key bindings
#
# {{{

typeset -A keys

keys=(
  'Home'      "$terminfo[khome]"
  'End'       "$terminfo[kend]"
  'Insert'    "$terminfo[kich1]"
  'Backspace' "$terminfo[kbs]"
  'Delete'    "$terminfo[kdch1]"
  'Up'        "$terminfo[kcuu1]"
  'Down'      "$terminfo[kcud1]"
  'Left'      "$terminfo[kcub1]"
  'Right'     "$terminfo[kcuf1]"
  'PageUp'    "$terminfo[kpp]"
  'PageDown'  "$terminfo[knp]"
  'ShiftTab'  "$terminfo[kcbt]"
)

# Use emacs-style keys
bindkey -e

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$keys[Home]"      ]] && bindkey -- "$keys[Home]"      beginning-of-line
[[ -n "$keys[End]"       ]] && bindkey -- "$keys[End]"       end-of-line
[[ -n "$keys[Insert]"    ]] && bindkey -- "$keys[Insert]"    overwrite-mode
[[ -n "$keys[Backspace]" ]] && bindkey -- "$keys[Backspace]" backward-delete-char
[[ -n "$keys[Delete]"    ]] && bindkey -- "$keys[Delete]"    delete-char
[[ -n "$keys[Left]"      ]] && bindkey -- "$keys[Left]"      backward-char
[[ -n "$keys[Right]"     ]] && bindkey -- "$keys[Right]"     forward-char
[[ -n "$keys[Up]"        ]] && bindkey -- "$keys[Up]"        up-line-or-beginning-search
[[ -n "$keys[Down]"      ]] && bindkey -- "$keys[Down]"      down-line-or-beginning-search
[[ -n "$keys[ShiftTab]"  ]] && bindkey -- "$keys[ShiftTab]"  reverse-menu-complete

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        echoti smkx
    }
    function zle-line-finish () {
        echoti rmkx
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

# }}}

#
# History configuration
#
# {{{

HISTFILE="$ZDOTDIR/.zhistory"
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

# Perform textual history expansion, csh-style, treating the character ‘!’ specially.
setopt BANG_HIST

# Save each command’s beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file.
# ‘: <beginning time>:<elapsed seconds>;<command>’.
setopt EXTENDED_HISTORY

# This options works like APPEND_HISTORY except that new history lines are added to the ${HISTFILE} incrementally
# (as soon as they are entered), rather than waiting until the shell exits.
setopt INC_APPEND_HISTORY

# Shares history across all sessions rather than waiting for a new shell invocation to read the history file.
setopt SHARE_HISTORY

# Shares history across all sessions rather than waiting for a new shell invocation to read the history file.
setopt SHARE_HISTORY

# Do not enter command lines into the history list if they are duplicates of the previous event.
setopt HIST_IGNORE_DUPS

# If a new command line being added to the history list duplicates an older one,
# the older command is removed from the list (even if it is not the previous event).
setopt HIST_IGNORE_ALL_DUPS

# Remove command lines from the history list when the first character on the line is a space,
# or when one of the expanded aliases contains a leading space.
setopt HIST_IGNORE_SPACE

# When writing out the history file, older commands that duplicate newer ones are omitted.
setopt HIST_SAVE_NO_DUPS

# Whenever the user enters a line with history expansion, don’t execute the line directly;
# instead, perform history expansion and reload the line into the editing buffer.
setopt HIST_VERIFY

# }}}

#
# Files and dirs and stuff
#
# {{{

setopt autocd              # Auto changes to a directory without typing cd.
setopt autopushd           # Push the old directory onto the stack on cd.
setopt pushdignoredups     # Do not store duplicates in the stack.
setopt pushdsilent         # Do not print the directory stack after pushd or popd.
setopt pushdtohome         # Push to home directory when no argument is given.
setopt cdablevars          # Change directory to a path stored in a variable.
setopt autonamedirs        # Auto add variable-stored paths to ~ list.
setopt multios             # Write to multiple descriptors.
setopt extendedglob        # Use extended globbing syntax.
unsetopt CLOBBER           # Do not overwrite existing files with > and >>.
                           # Use >! and >>! to bypass.

# }}}

#
# Completion
#
# {{{
# vim: foldmethod=marker
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

# Custom completion functions
source $ZDOTDIR/completions.zsh
compdef -d django-admin  # disable builtin completion
compctl -K _completions.pip pip{,2,3}
compctl -K _completions.django django-admin


setopt completeinword    # Complete from both ends of a word.
setopt alwaystoend       # Move cursor to the end of a completed word.
setopt pathdirs          # Perform path search even on command names with slashes.
setopt automenu          # Show completion menu on a successive tab press.
setopt autolist          # Automatically list choices on ambiguous completion.
setopt autoparamslash    # If completed parameter is a directory, add a trailing slash.
setopt extendedglob      # Needed for file modification glob modifiers with compinit

# Caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"

# Grouping
zstyle ':completion:*'              menu             select
zstyle ':completion:*'              verbose          yes
zstyle ':completion:*:matches'      group            'yes'
zstyle ':completion:*'              group-name       ''
zstyle ':completion:*:options'      description      'yes'
zstyle ':completion:*:options'      auto-description '%d'
zstyle ':completion:*:default'      list-prompt      '%S%M matches%s'
zstyle ':completion:*:corrections'  format           ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format           ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages'     format           ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings'     format           ' %F{red}-- no matches found --%f'
zstyle ':completion:*'              format           ' %F{yellow}-- %d --%f'

# Fuzzy matching
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directories
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Ignore multiple entries.
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# }}}

#
# Prompt & status
#
# {{{
case $TERM in
  xterm*)
    precmd() { print -Pn "\e]0;%~\a" }
    ;;
esac

# Trigger chpwd_functions manually 
cd $PWD
# }}}

source $ZDOTDIR/path.zsh
source $ZDOTDIR/plugins.zsh

# Run sway on tty1
if systemctl -q is-active graphical.target && [[ ! "$DISPLAY" && "$XDG_VTNR" -eq 1 ]]; then
    exec sway
fi

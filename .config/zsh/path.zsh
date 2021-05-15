#
# Normally, the path should be set in .zshenv,
# but /etc/profile is sourced after .zshenv, borking up my path.
#
# I'll source this in .zshenv, .zprofile and .zshrc to enable all kinds of shells.
#
typeset -U path

# common
path=(
    ~/bin
    ~/.local/bin
    
    $path
)

if [[ "$(uname -s)" == "Darwin" ]]; then
    path=(
        "$HOMEBREW_PREFIX"/bin
        
        # GNU utils
        "$HOMEBREW_PREFIX"/opt/coreutils/libexec/gnubin
        "$HOMEBREW_PREFIX"/opt/grep/libexec/gnubin
        "$HOMEBREW_PREFIX"/opt/findutils/libexec/gnubin
        
        # curl
        "$HOMEBREW_PREFIX"/opt/curl/bin
        
        # Rust
        /Users/mike/.local/share/cargo/bin
        
        $path
    )
elif [[ "$(uname -s)" == "Linux" ]]; then
    path=(
        $path
    )
fi

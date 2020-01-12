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
        /usr/local/bin
        
        # GNU utils
        /usr/local/opt/coreutils/libexec/gnubin
        /usr/local/opt/grep/libexec/gnubin
        /usr/local/opt/findutils/libexec/gnubin
        
        # curl
        /usr/local/opt/curl/bin
        
        # Rust
        /Users/mike/.local/share/cargo/bin
        
        $path
    )
elif [[ "$(uname -s)" == "Linux" ]]; then
    path=(
        $path
    )
fi

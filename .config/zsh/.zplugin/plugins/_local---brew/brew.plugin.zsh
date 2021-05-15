if [[ "$(uname -s)" == "Darwin" ]] && [[ "$(uname -p)" == "arm" ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi

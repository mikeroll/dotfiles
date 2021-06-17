#!/usr/bin/env zsh
set -euo pipefail

thisdir="$(dirname "$0:A")"
case "$(uname -s)" in
    Darwin)
        confdirs=(
            "$HOME/Library/Application Support/Code/User"
        )
        ;;
    Linux)
        confdirs=(
            "$HOME/.config/Code - OSS/User"
            "$HOME/.config/Code/User"
        )
        ;;
esac


for confdir in "${confdirs[@]}"; do
    mkdir -p "$confdir"

    for t in settings.json keybindings.json snippets; do
        ln -sfn "${thisdir}/${t}" "${confdir}/${t}"
    done
done

comm -13 \
    <(code --list-extensions | sort -u) \
    <(grep -E -v "^(#|$)" "${thisdir}/extensions.txt" | sort -u) \
| while read -r extid; do
    code --install-extension "${extid}" --force
done

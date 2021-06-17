#!/bin/bash
set -euo pipefail

user=mike
remote='https://github.com/mikeroll/dotfiles.git'
localdir="${HOME}/dotfiles"
hostname="$1"

if [[ "$USER" == 'root' ]]; then
    # Set the hostname
    echo "${hostname}" >| /etc/hostname

    # Install the essentials
    pacman -Sy --noconfirm zsh git sudo

    # Create me a user
    if ! grep -q "$user" /etc/group; then 
        groupadd "$user"
    fi 

    if ! grep -q "$user" /etc/passwd; then
        useradd -m -g "$user" -s "$(command -v zsh)" "$user"
        echo "Set password for user $user"
        passwd "$user"
    fi
    echo "$user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/"$user"

    # Set zsh "entrypoint"
    echo 'export ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh' > /etc/zsh/zshenv
    
    # Set zsh as default shell
    chsh -s /usr/bin/zsh "$user"

    # Continue as myself
    exec sudo -u "$user" bash "$0" "$@"

elif [[ "$USER" == "$user" ]]; then
    # Clone dotfiles
    if ! ([[ -d "${localdir}" ]] && cd "${localdir}" && git rev-parse --is-inside-work-tree >/dev/null); then
        git clone "${remote}" "${localdir}"
    fi

    # Install yay
    if ! command -v yay >/dev/null; then
        curl -sSL https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=yay-bin > yay.PKGBUILD
        makepkg -si --noconfirm -p yay.PKGBUILD
        rm -f yay.PKGBUILD
    fi

    # Install dotfiles
    for dir in .config .icons bin; do
        [[ -d ~/"$dir" ]] || ln -sfn dotfiles/"$dir" ~/"$dir"
    done
    
    # Apply aconfmgr state
    if ! command -v aconfmgr; then 
        yay -Sy --noconfirm aconfmgr-git
    fi
    aconfmgr apply --paranoid
fi

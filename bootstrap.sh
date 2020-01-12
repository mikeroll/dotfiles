#!/bin/bash
set -euo pipefail

user=mike
remote='https://github.com/mikeroll/dotfiles.git'
localdir="${HOME}/dotfiles"
branch='master'

if [[ "$USER" == 'root' ]]; then
    # Install the essentials
    pacman -Sy --noconfirm zsh git sudo

    # Create me a user
    if ! grep -q "$user" /etc/group || ! grep -q "$user" /etc/passwd; then
        groupadd "$user"
        useradd -m -g "$user" -s $(which zsh) "$user"
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
    # Install yay
    if ! command -v yay >/dev/null; then
        curl -sSL https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=yay-bin > yay.PKGBUILD
        makepkg -si --noconfirm -p yay.PKGBUILD
        rm -f yay.PKGBUILD
    fi

    # Clone dotfiles
    if ! ([[ -d "${localdir}" ]] && cd "${localdir}" && git rev-parse --is-inside-work-tree >/dev/null); then
        git clone --single-branch -b "${branch}" "${remote}" "${localdir}"
    fi

    # Install dotfiles
    for dir in .config bin; do
        [[ -d ~/"$dir" ]] || ln -s dotfiles/"$dir" ~/"$dir"
    done
    
    # Apply aconfmgr state
    if ! command -v aconfmgr; then 
        yay -Sy --noconfirm aconfmgr-git
    fi
    aconfmgr apply
fi

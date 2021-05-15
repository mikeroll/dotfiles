#!/bin/bash
set -euo pipefail
thisdir="$(cd "$(dirname "$0")"; pwd -P)"

# Enable sudo via Touch ID
pam_tid="auth       sufficient     pam_tid.so"
if ! grep -q "${pam_tid}" /etc/pam.d/sudo; then
    sudo /usr/bin/sed -i '' -e '/^auth       sufficient     pam_smartcard.so$/i\
    '"${pam_tid}"'' /etc/pam.d/sudo
fi

#
# Install homebrew and Brewfile packages
#
if ! brew -v >/dev/null 2>&1; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
brew bundle

#
# Setup macOS defaults
#
. ./defaults.sh

# Setup macOS LaunchAgents
mkdir -p ~/Library/LaunchAgents/
cp -f "${thisdir}"/launchagents/*.plist ~/Library/LaunchAgents/

# Configure shell
[ "$SHELL" = "$HOMEBREW_PREFIX"/bin/zsh ] || sudo chsh -s "$HOMEBREW_PREFIX"/bin/zsh mike

# shellcheck disable=SC2016
echo 'ZDOTDIR="$HOME/.config/zsh"' | sudo tee /etc/zshenv >/dev/null
touch ~/.hushlogin

# Link .config
ln -sfn "${thisdir}"/.config ~/.config

#
# Configure apps
#

# vscode
~/.config/vscode/configure.sh

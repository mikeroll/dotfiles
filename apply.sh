#!/bin/bash
set -euo pipefail
thisdir="$(readlink -f "$(dirname "$0")")"

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
fi
brew bundle

#
# Setup macOS defaults
#
# Keyboard repeat rate
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
defaults write -g ApplePressAndHoldEnabled -bool false

# Non-retarded Fn keys
defaults write com.apple.keyboard fnState -bool true

# Disable DS_Store files
defaults write com.apple.desktopservices DSDontWriteNetworkStores -string "true"
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Stupid quotes and dashes
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false

# Finder
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.Finder ShowPathbar -bool true
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write -g AppleShowAllFiles -bool true
defaults write com.apple.Finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.Finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# iTerm2
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/.config/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Setup macOS LaunchAgents
mkdir -p ~/Library/LaunchAgents/
cp -f "${thisdir}"/launchagents/*.plist ~/Library/LaunchAgents/

# Configure shell
[ "$SHELL" = /usr/local/bin/zsh ] || sudo chsh -s /usr/local/bin/zsh mike

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

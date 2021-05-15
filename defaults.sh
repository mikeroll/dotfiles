#
# Configure macOS defaults.
#

#
# Keyboard
#

# Repeat rate
defaults write -g "InitialKeyRepeat" -int 10
defaults write -g "KeyRepeat" -int 1
defaults write -g "ApplePressAndHoldEnabled" -bool false

# Non-retarded Fn keys
defaults write com.apple.keyboard "fnState" -bool true

# Disable stupid quotes and dashes
defaults write -g "NSAutomaticQuoteSubstitutionEnabled" -bool false
defaults write -g "NSAutomaticDashSubstitutionEnabled" -bool false

#
# Trackpad
#

# Enable tap to click
defaults write com.apple.AppleMultitouchTrackpad "Clicking" -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "Clicking" -bool true

# Enable "tap-and-a-half" to drag
defaults write com.apple.AppleMultitouchTrackpad "Dragging" -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "Dragging" -int 1

# Three-finger drag
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadThreeFingerDrag" -bool true

#
# Dock
#

# Autohide
defaults write com.apple.dock "autohide" -bool true

# Non-cheesy minimize animation
defaults write com.apple.dock "mineffect" -string "scale"

# Disable DS_Store files
defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -string true
defaults write com.apple.desktopservices "DSDontWriteUSBStores" -bool true

#
# Finder
#

# Allow quitting
defaults write com.apple.finder "QuitMenuItem" -bool true

# Show extensions, disable extension change warning
defaults write -g "AppleShowAllExtensions" -bool true
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool false

# Show hidden files
defaults write com.apple.Finder "AppleShowAllFiles" -bool true
defaults write -g "AppleShowAllFiles" -bool true

# Show full path in title
defaults write com.apple.finder "_FXShowPosixPathInTitle" -bool true

# View options
defaults write com.apple.Finder "FXPreferredViewStyle" -string "Nlsv"
defaults write com.apple.finder "_FXSortFoldersFirst" -bool true

#
# iTerm2
#
defaults write com.googlecode.iterm2.plist "PrefsCustomFolder" -string "${XDG_CONFIG_HOME:-"$HOME/.config"}/iterm2"
defaults write com.googlecode.iterm2.plist "LoadPrefsFromCustomFolder" -bool true

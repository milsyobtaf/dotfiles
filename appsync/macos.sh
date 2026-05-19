#!/usr/bin/env bash
set -euo pipefail

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

# SYSTEM {{{

echo "Requiring password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# }}}
# GENERAL {{{

echo 'Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)'
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo 'Increase window resize speed for Cocoa applications'
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo "Use scroll gesture with the Ctrl (^) modifier key to zoom"
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

echo "Saving screenshots to ~/Downloads"
defaults write com.apple.screencapture location ~/Downloads

# }}}
# DOCK {{{

echo 'Speed up Mission Control animations'
defaults write com.apple.dock expose-animation-duration -float 0.1

echo 'Set size and magnification of Dock icons'
defaults write com.apple.dock tilesize -int 36 && killall Dock
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 128 && killall Dock

echo "Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

echo 'Hot corners'
echo 'Bottm left / Bottom right screen corner → Lock Screen'
defaults write com.apple.dock wvous-bl-corner -int 13
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 13
defaults write com.apple.dock wvous-br-modifier -int 0

# }}}
# DIALOGS {{{

echo 'Expand save and print panel by default'
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# }}}
# FINDER {{{

echo "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Set Default Finder location to Home"
defaults write com.apple.finder NewWindowTarget -string "PfLo" &&
  defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

echo "Show the ~/Library folder"
chflags nohidden ~/Library

echo "Show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo "Expand the following File Info panes:"
echo "  “General”, “Open with”, and “Sharing & Permissions”"
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

echo "Showing status bar in Finder by default"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Showing path bar in Finder by default"
defaults write com.apple.finder ShowPathbar -bool true

echo 'Finder: show all filename extensions'
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo 'Disable the warning when changing a file extension'
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo 'Avoid creating .DS_Store files on network volumes'
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# }}}

# APPS {{{

echo "TextEdit: Use plain text mode for new documents"
defaults write com.apple.TextEdit RichText -int 0

echo "TextEdit: Open and save files as UTF-8"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

echo "TextEdit: Start with empty doc"
defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false

# }}}

echo "Disable font smoothing"
defaults -currentHost write -g AppleFontSmoothing -int 0

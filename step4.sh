#!/bin/bash

source variables.sh

printf "\n%s==================== macOS System Configuration and Optimization Script starts ====================%s\n\n" "${tty_yellow}" "${tty_reset}"

printf "%sConfiguring MacOS...%s\n" "${tty_green}" "${tty_reset}"

# Turn on Firewall and block all incoming connections
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setblockall on

# Disable remote management
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate

# Enable tap to click
sudo defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Enable hiding and showing dock
sudo defaults write com.apple.dock autohide -bool true

# Change key repeat speed and motion
sudo defaults write NSGlobalDomain KeyRepeat -int 2
sudo defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Enable automatic macOS updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -boolean TRUE
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -boolean TRUE
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -boolean TRUE
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -boolean TRUE
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticallyInstallMacOSUpdates -boolean TRUE

# Enable automatic application updates from the App Store
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdate -boolean TRUE

# Disable Siri
sudo defaults write com.apple.assistant.support "Assistant Enabled" -bool false
sudo defaults write com.apple.Siri "Siri Data Sharing Opt-In Status" -int 2
sudo defaults write com.apple.Siri "Siri Enabled" -bool false
sudo defaults write com.apple.SetupAssistant "DidSeeSiriSetup" -bool True
sudo defaults write com.apple.Siri "UserHasDeclinedEnable" -bool True
sudo defaults write com.apple.systemuiserver "NSStatusItem Visible Siri" -bool false
sudo defaults write com.apple.systemuiserver "menuExtras" -array-remove "/System/Library/CoreServices/Menu Extras/Siri.menu"

# Restart affected services
killall SystemUIServer

# Enable Reduce Motion
defaults write com.apple.universalaccess reduceMotion -bool true

# Restart affected services to apply changes
killall Dock

# Dock speed
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g NSScrollAnimationEnabled -bool false
defaults write -g NSWindowResizeTime -float 0.001
defaults write -g QLPanelAnimationDuration -float 0
defaults write -g NSScrollViewRubberbanding -bool false
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false
defaults write -g NSToolbarFullScreenAnimationDuration -float 0
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock expose-animation-duration -float 0
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0
defaults write com.apple.dock springboard-page-duration -float 0
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.Mail DisableSendAnimations -bool true
defaults write com.apple.Mail DisableReplyAnimations -bool true

cd macos_hardening/
./puppy.sh -H

cd ~/Documents/mpi/
./privacy-script.sh

printf "%sNOTE: Some configurations will be enabled after restart%s\n" "${tty_green}" "${tty_reset}"

printf "\n%s==================== macOS System Configuration and Optimization Script ends ====================%s\n\n" "${tty_yellow}" "${tty_reset}"

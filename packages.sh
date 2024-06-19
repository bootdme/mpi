#!/bin/bash

source variables.sh

set -euo pipefail

printf "\n%s====================Script starts====================%s\n\n" "${tty_yellow}" "${tty_reset}"

printf "%sInstalling other packages...%s\n" "${tty_green}" "${tty_reset}"

# Add fish to /etc/shells if not already present
sudo sh -c 'if ! grep -q "/opt/homebrew/bin/fish" "/etc/shells"; then echo "/opt/homebrew/bin/fish" >> /etc/shells; fi'

# Add nu to /etc/shells if not already present
sudo sh -c 'if ! grep -q "$HOME/.cargo/bin/nu" "/etc/shells"; then echo "$HOME/.cargo/bin/nu" >> /etc/shells; fi'

# Turn on Firewall and block all incoming connections
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setblockall on

# Disable remote management
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate

# Enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Enable hiding and showing dock
defaults write com.apple.dock autohide -bool true

defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

printf "%sRun ./gpg.sh%s\n" "${tty_green}" "${tty_reset}"

printf "\n%s====================Script ends====================%s\n\n" "${tty_yellow}" "${tty_reset}"

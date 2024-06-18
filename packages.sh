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

printf "%sRun ./gpg.sh%s\n" "${tty_green}" "${tty_reset}"

printf "\n%s====================Script ends====================%s\n\n" "${tty_yellow}" "${tty_reset}"

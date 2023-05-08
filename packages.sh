#!/bin/bash

set -euo pipefail

# Add fish to /etc/shells
if [[ $(tail -n 1 "/etc/shells") != "/opt/homebrew/bin/fish" ]]; then
	echo "/opt/homebrew/bin/fish" >> /etc/shells
fi
chsh -s $(/opt/homebrew/bin/fish)

# AWS CLI
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

$(brew --prefix)/opt/fzf/install

echo "Run gpg.sh"

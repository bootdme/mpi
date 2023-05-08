#!/bin/bash

set -euo pipefail

# Add fish to /etc/shells
sudo sh -c 'if [[ $(tail -n 1 "/etc/shells") != "/opt/homebrew/bin/fish" ]]; then echo "/opt/homebrew/bin/fish" >> /etc/shells; fi'

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

$(brew --prefix)/opt/fzf/install

echo "Run gpg.sh"

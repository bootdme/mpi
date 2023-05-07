#!/bin/bash

set -euo pipefail

# Xcode
xcode-select --install

# Rosetta
softwareupdate --install-rosetta --agree-to-license

# Download dotfiles
git clone https://github.com/bootdme/dotfiles.git
cd dotfiles && ./install

chsh -s $(/opt/homebrew/bin/fish)

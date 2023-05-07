#!/bin/bash

set -euo pipefail

# Rosetta
softwareupdate --install-rosetta --agree-to-license

# Download dotfiles
git clone https://github.com/bootdme/dotfiles.git
cd dotfiles && ./install

chsh -s $(/opt/homebrew/bin/fish)

#!/bin/bash

set -euo pipefail

source variables.sh

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

printf "\n%s====================Script starts====================%s\n\n" "${tty_yellow}" "${tty_reset}"

printf "%sInstalling brew packages...%s\n" "${tty_green}" "${tty_reset}"

xcode-select --install

brew list fish || brew install fish

brew list go || brew install go

brew list postgresql || brew install postgresql

brew list neovim || brew install neovim

brew list gnupg || brew instal gnupg
brew list pinentry-mac || brew install pinentry-mac

brew list google-chrome || brew install google-chrome

brew list bash || brew install bash

brew list exa || brew install exa
brew list fzf || brew install fzf
$(brew --prefix)/opt/fzf/install
brew list bat || brew install bat
brew list wget || brew install wget
brew list fd || brew install fd
brew list ripgrep || brew install ripgrep

brew list bitwarden || brew install --cask bitwarden
brew list spotify || brew install --cask spotify

softwareupdate --install-rosetta --agree-to-license

printf "\n%s====================Script ends====================%s\n\n" "${tty_yellow}" "${tty_reset}"

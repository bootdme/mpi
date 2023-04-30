#!/bin/bash

set -euo pipefail

source variables.sh

printf "\n%s====================Script starts====================%s\n\n" "${tty_yellow}" "${tty_reset}"

printf "%sInstalling brew packages...%s\n" "${tty_green}" "${tty_reset}"

brew list fish || brew install fish
brew list bash || brew install bash
brew list kitty || brew install kitty
brew list neovim || brew install neovim

brew list go || brew install go

brew list postgresql || brew install postgresql

brew list gnupg || brew instal gnupg
brew list pinentry-mac || brew install pinentry-mac

brew list exa || brew install exa
brew list fzf || brew install fzf
$(brew --prefix)/opt/fzf/install
brew list bat || brew install bat
brew list wget || brew install wget
brew list fd || brew install fd
brew list ripgrep || brew install ripgrep

brew list google-chrome || brew install google-chrome
brew list bitwarden || brew install --cask bitwarden
brew list spotify || brew install --cask spotify
brew list discord || brew install --cask discord

brew list postman || brew install --cask postman

brew tap homebrew/cask-fonts
brew list font-jetbrains-mono-nerd-font || brew install --cask font-jetbrains-mono-nerd-font

softwareupdate --install-rosetta --agree-to-license

printf "\n%s====================Script ends====================%s\n\n" "${tty_yellow}" "${tty_reset}"

#!/bin/bash

set -euo pipefail

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# String formatters
if [[ -t 1 ]]; then
	tty_escape() { printf "\033[%sm" "$1"; }
else
	tty_escape() { :; }
fi

tty_mkbold() { tty_escape "1;$1"; }
tty_yellow="$(tty_escape "0;33")"
tty_green="$(tty_mkbold 32)"
tty_reset="$(tty_escape 0)"

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

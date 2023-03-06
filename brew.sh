#!/bin/bash

set -e
set -o pipefail

# string formatters
if [[ -t 1 ]]; then
	tty_escape() { printf "\033[%sm" "$1"; }
else
	tty_escape() { :; }
fi

tty_mkbold() { tty_escape "1;$1"; }
tty_yellow="$(tty_escape "0;33")"
tty_green="$(tty_mkbold 32)"
tty_reset="$(tty_escape 0)"

printf "\n${tty_yellow}====================Script starts====================${tty_reset}\n\n"

printf "${tty_green}Installing brew packages...${tty_reset}\n"

brew list fish || brew install fish

brew list go || brew install go
brew list rust || brew install rust

brew list neovim || brew install neovim
brew list selene || brew install selene
brew list shellcheck || brew install shellcheck

brew list gnupg || brew instal gnupg
brew list pinentry-mac || brew install pinentry-mac

brew list exa || brew install exa

brew list bitwarden || brew install --cask bitwarden
brew list spotify || brew install --cask spotify

printf "\n${tty_yellow}====================Script ends====================${tty_reset}\n\n"

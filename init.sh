#!/bin/bash

source variables.sh

set -euo pipefail

printf "\n%s====================Script starts====================%s\n\n" "${tty_yellow}" "${tty_reset}"

xcode-select

# Rosetta
softwareupdate --install-rosetta --agree-to-license

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(
	echo
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
) >>/Users/bootdme/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
source ~/.zprofile

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

printf "%s Completely quit the terminal with Command + Q and run ./ssh%s\n\n" "${tty_green}" "${tty_reset}"

printf "\n%s====================Script ends====================%s\n\n" "${tty_yellow}" "${tty_reset}"

#!/bin/bash

source variables.sh

set -euo pipefail

printf "\n%s====================Script starts====================%s\n\n" "${tty_yellow}" "${tty_reset}"

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

printf "%s Completely quit the terminal with Command + Q and run ./ssh%s\n\n" "${tty_green}" "${tty_reset}"

printf "\n%s====================Script ends====================%s\n\n" "${tty_yellow}" "${tty_reset}"

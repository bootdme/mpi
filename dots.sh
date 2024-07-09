#!/bin/bash

set -euo pipefail

source variables.sh

printf "\n%s====================Script starts====================%s\n\n" "${tty_yellow}" "${tty_reset}"

printf "%sInstalling dots and dependencies...%s\n" "${tty_green}" "${tty_reset}"

/Library/Developer/CommandLineTools/usr/bin/python3 -m pip install --upgrade pip

# Install distro for dotbot
pip3 install distro

# Download dotfiles
git clone https://github.com/bootdme/dotfiles.git ~/dotfiles

# Nushell error fix for symlink
if [ ! -d "$HOME/Library/Application Support/nushell" ]; then
	mkdir -p "$HOME/Library/Application Support/nushell"
fi

printf "%sGo into ~/dotfiles and ./install%s\n" "${tty_green}" "${tty_reset}"
printf "%sOnce complete, proceed to packages.sh%s\n" "${tty_green}" "${tty_reset}"

printf "\n%s====================Script ends====================%s\n\n" "${tty_yellow}" "${tty_reset}"

#!/bin/bash

set -euo pipefail

source variables.sh

printf "\n%s====================Script starts====================%s\n\n" "${tty_yellow}" "${tty_reset}"

printf "%sInstalling packages...%s\n" "${tty_green}" "${tty_reset}"

/Library/Developer/CommandLineTools/usr/bin/python3 -m pip install --upgrade pip

# Install distro for dotbot
pip3 install distro

# Download dotfiles
git clone https://github.com/bootdme/dotfiles.git ~/dotfiles

echo "Go into ~/dotfiles and ./install"
echo "Once complete, proceed to packages.sh"


printf "\n%s====================Script ends====================%s\n\n" "${tty_yellow}" "${tty_reset}"

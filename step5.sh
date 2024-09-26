#!/bin/bash

set -euo pipefail

source variables.sh

printf "\n%s====================Script starts====================%s\n\n" "${tty_yellow}" "${tty_reset}"

printf "%sInstalling dots and dependencies...%s\n" "${tty_green}" "${tty_reset}"

# Download dotfiles
git clone https://github.com/bootdme/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install
./install

printf "\n%s====================Script ends====================%s\n\n" "${tty_yellow}" "${tty_reset}"

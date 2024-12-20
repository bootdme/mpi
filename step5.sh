#!/bin/bash

source variables.sh

printf "\n%s==================== Dotfiles installation script starts ====================%s\n\n" "${tty_yellow}" "${tty_reset}"

git clone https://github.com/bootdme/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install
./install

printf "\n%s==================== Dotfiles installation script ends ====================%s\n\n" "${tty_yellow}" "${tty_reset}"

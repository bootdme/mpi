#!/bin/bash

source variables.sh

printf "\n%s==================== Install dotfiles script starts ====================%s\n\n" "${tty_yellow}" "${tty_reset}"

git clone https://github.com/bootdme/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install
./install

printf "\n%s==================== Install dotfiles script ends ====================%s\n\n" "${tty_yellow}" "${tty_reset}"

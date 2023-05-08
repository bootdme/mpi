#!/bin/bash

set -euo pipefail

source variables.sh

printf "\n%s====================Script starts====================%s\n\n" "${tty_yellow}" "${tty_reset}"

printf "%sInstalling packages...%s\n" "${tty_green}" "${tty_reset}"

/Library/Developer/CommandLineTools/usr/bin/python3 -m pip install --upgrade pip

# Install distro for dotbot
pip3 install distro

# Download dotfiles
git clone https://github.com/bootdme/dotfiles.git
cd dotfiles/ && ./install

chsh -s $(/opt/homebrew/bin/fish)

# AWS CLI
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

$(brew --prefix)/opt/fzf/install

printf "\n%s====================Script ends====================%s\n\n" "${tty_yellow}" "${tty_reset}"
#!/bin/bash

source variables.sh

set -euo pipefail

printf "\n%s====================Script starts====================%s\n\n" "${tty_yellow}" "${tty_reset}"

printf "%sInstalling other packages...%s\n" "${tty_green}" "${tty_reset}"

# Add fish to /etc/shells
sudo sh -c 'if [[ $(tail -n 1 "/etc/shells") != "/opt/homebrew/bin/fish" ]]; then echo "/opt/homebrew/bin/fish" >> /etc/shells; fi'

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install wasm-pack
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

cargo install cargo-generate

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

$(brew --prefix)/opt/fzf/install

printf "%sClose terminal and execute nvm install node. Once done, run ./gpg.sh%s\n" "${tty_green}" "${tty_reset}"

printf "\n%s====================Script ends====================%s\n\n" "${tty_yellow}" "${tty_reset}"

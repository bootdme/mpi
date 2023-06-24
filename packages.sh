#!/bin/bash

source variables.sh

set -euo pipefail

printf "\n%s====================Script starts====================%s\n\n" "${tty_yellow}" "${tty_reset}"

printf "%sInstalling other packages...%s\n" "${tty_green}" "${tty_reset}"

# Add fish to /etc/shells
sudo sh -c 'if [[ $(tail -n 1 "/etc/shells") != "/opt/homebrew/bin/fish" ]]; then echo "/opt/homebrew/bin/fish" >> /etc/shells; fi'

# Add nu to /etc/shells
sudo sh -c 'if [[ $(tail -n 1 "/etc/shells") != "$HOME/.cargo/bin/nu" ]]; then echo "$HOME/.cargo/bin/nu" >> /etc/shells; fi'

$(brew --prefix)/opt/fzf/install

wget https://raw.githubusercontent.com/arkenfox/user.js/master/user.js

printf "%sRun ./gpg.sh%s\n" "${tty_green}" "${tty_reset}"

printf "\n%s====================Script ends====================%s\n\n" "${tty_yellow}" "${tty_reset}"

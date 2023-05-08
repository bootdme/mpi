#!/bin/bash

set -euo pipefail

# Rosetta
softwareupdate --install-rosetta --agree-to-license

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/bootdme/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
source ~/.zprofile

# https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54
if [ ! -d ~/.ssh ] || [ ! -f ~/.ssh/id_ed25519 ]; then
	printf "%sCreating SSH key pair for GitHub...%s\n\n" "${tty_green}" "${tty_reset}"

	read -rp "${tty_green}Please enter the email you use for GitHub: ${tty_reset}" EMAIL

	ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "$EMAIL"
	eval "$(ssh-agent -s)"

	cat <<EOT >>~/.ssh/config
Host *
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_ed25519
EOT

	ssh-add --apple-use-keychain ~/.ssh/id_ed25519
fi

echo "Please enter your Github Personal token: "
read GITHUB_TOKEN

curl -H "Authorization: token $GITHUB_TOKEN" -X POST -d "{\"title\":\"MacKey\",\"key\":\"$(cat ~/.ssh/id_ed25519.pub)\"}" https://api.github.com/user/keys

# Install distro for dotbot
pip3 install distro

# Download dotfiles
git clone https://github.com/bootdme/dotfiles.git
cd ~/dotfiles && ./install

chsh -s $(/opt/homebrew/bin/fish)

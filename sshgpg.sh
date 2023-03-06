#!/bin/bash

set -e
set -o pipefail

# String formatters
if [[ -t 1 ]]; then
	tty_escape() { printf "\033[%sm" "$1"; }
else
	tty_escape() { :; }
fi

tty_mkbold() { tty_escape "1;$1"; }
tty_yellow="$(tty_escape "0;33")"
tty_green="$(tty_mkbold 32)"
tty_red="$(tty_mkbold 31)"
tty_reset="$(tty_escape 0)"

printf "\n${tty_yellow}====================Script starts====================${tty_reset}\n\n"

if [ ! -d ~/.ssh ] || [ ! -d ~/.gnupg ]; then
	# https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54
	if [ ! -d ~/.ssh ]; then
		printf "${tty_green}Creating SSH key pair for GitHub...${tty_reset}\n\n"

		read -p "${tty_green}Please enter the email you use for GitHub: ${tty_reset}" EMAIL

		ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C $EMAIL
		eval "$(ssh-agent -s)"

		cat <<EOT >>~/.ssh/config
Host *
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_ed25519
EOT

		ssh-add --apple-use-keychain ~/.ssh/id_ed25519
	fi

	if [ ! -d ~/.gnupg ]; then
		printf "${tty_green}Creating GPG key pair for GitHub...${tty_reset}\n"

		gpg --full-generate-key

		if [ ! -f ~/.gnupg/gpg-agent.conf ]; then
			# https://stackoverflow.com/questions/41502146/git-gpg-onto-mac-osx-error-gpg-failed-to-sign-the-data
			echo "pinentry-program $(which pinentry-mac)" >>~/.gnupg/gpg-agent.conf

			gpgconf --kill gpg-agent
		fi
	fi
fi

printf "${tty_green}Keys have been added to your system. Make sure to add them to GitHub${tty_reset}\n"

printf "\n${tty_yellow}====================Script ends====================${tty_reset}\n\n"

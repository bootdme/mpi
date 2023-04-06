#!/bin/bash

set -euo pipefail

source variables.sh

printf "\n%s====================Script starts====================%s\n\n" "${tty_yellow}" "${tty_reset}"

if [ ! -d ~/.ssh ] || [ ! -d ~/.gnupg ]; then
	# https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54
	if [ ! -d ~/.ssh ]; then
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

	if [ ! -d ~/.gnupg ]; then
		printf "%sCreating GPG key pair for GitHub...%s\n" "${tty_green}" "${tty_reset}"

		gpg --full-generate-key

		if [ ! -f ~/.gnupg/gpg-agent.conf ]; then
			# https://stackoverflow.com/questions/41502146/git-gpg-onto-mac-osx-error-gpg-failed-to-sign-the-data
			echo "pinentry-program $(which pinentry-mac)" >>~/.gnupg/gpg-agent.conf

			gpgconf --kill gpg-agent
		fi
	fi
fi

printf "%sKeys have been added to your system. Make sure to add them to GitHub%s\n" "${tty_green}" "${tty_reset}"

printf "\n%s====================Script ends====================%s\n\n" "${tty_yellow}" "${tty_reset}"

#!/bin/bash

set -euo pipefail

source variables.sh

printf "\n%s====================Script starts====================%s\n\n" "${tty_yellow}" "${tty_reset}"

if [ ! -d ~/.ssh ] || [ ! -d ~/.gnupg ]; then
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

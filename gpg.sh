#!/bin/bash

set -euo pipefail

source variables.sh

printf "\n%s====================Script starts====================%s\n\n" "${tty_yellow}" "${tty_reset}"

read -rp "${tty_green}Enter your email for Github: ${tty_reset}" EMAIL
read -rp "${tty_green}Enter your Github personal token: ${tty_reset}" GITHUB_TOKEN

if [ ! -d ~/.gnupg ]; then
	printf "%sCreating GPG key pair for GitHub...%s\n" "${tty_green}" "${tty_reset}"

	gpg --full-generate-key

	if [ ! -f ~/.gnupg/gpg-agent.conf ]; then
		# https://stackoverflow.com/questions/41502146/git-gpg-onto-mac-osx-error-gpg-failed-to-sign-the-data
		echo "pinentry-program $(which pinentry-mac)" >>~/.gnupg/gpg-agent.conf

		gpgconf --kill gpg-agent
	fi

	gpg --armor --export "$EMAIL" | curl -H "Authorization: token $GITHUB_TOKEN" -X POST -d "{\"armored_public_key\":\"$(awk '{printf "%s\\n", $0}' ORS='')\"}" https://api.github.com/user/gpg_keys
fi

printf "%sKeys have been added to GitHub%s\n" "${tty_green}" "${tty_reset}"
printf "%sExecute chsh -s $(which fish), close and re-open terminal and then run ./cleanup.sh%s\n" "${tty_green}" "${tty_reset}"

printf "\n%s====================Script ends====================%s\n\n" "${tty_yellow}" "${tty_reset}"

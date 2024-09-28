#!/bin/bash

source variables.sh

set -euo pipefail

printf "\n%s==================== SSH Import Keys Script starts ====================%s\n\n" "${tty_yellow}" "${tty_reset}"

create_ssh_key() {
	local email=$1
	local service=$2
	local name=$3
	local key_file=~/.ssh/id_ed25519_${service}_${name}

	if [ -f "$key_file" ]; then
		printf "%sSSH key pair for %s (%s) already exists as %s.%s\n\n" \
			"${tty_yellow}" "$service" "$email" "$name" "${tty_reset}"
		return 1 # Indicate that the key already exists
	else
		printf "%sCreating SSH key pair for %s (%s) named %s...%s\n\n" \
			"${tty_green}" "$service" "$email" "$name" "${tty_reset}"

		ssh-keygen -t ed25519 -f "$key_file" -C "$email"
		eval "$(ssh-agent -s)"

		cat <<EOT >>~/.ssh/config
Host $name
    HostName $service.com
    User git
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile $key_file
EOT

		ssh-add --apple-use-keychain "$key_file"
		return 0 # Indicate success
	fi
}

upload_ssh_key() {
	local service=$1
	local email=$2
	local name=$3
	local token=$4
	local key_file=~/.ssh/id_ed25519_${service}_${name}
	local upload_url

	case $service in
	github)
		upload_url="https://api.github.com/user/keys"
		curl -H "Authorization: token $token" -X POST -d "{\"title\":\"MacKey_${name}\",\"key\":\"$(cat $key_file.pub)\"}" "$upload_url"
		;;
	gitlab)
		upload_url="https://gitlab.com/api/v4/user/keys"
		curl --silent --header "PRIVATE-TOKEN: $token" -X POST -d "title=MacKey_${name}&key=$(cat $key_file.pub)" "$upload_url"
		;;
	esac

	printf "%s\nSSH key was successfully added to %s%s\n" "${tty_green}" "$service" "${tty_reset}"
}

setup_service() {
	local service=$1
	local key_exists=1
	local email_var service_name_var token_var

	case $service in
	github)
		service_name_var="GitHub"
		email_var="GITHUB_EMAIL"
		token_var="GITHUB_TOKEN"
		;;
	gitlab)
		service_name_var="GitLab"
		email_var="GITLAB_EMAIL"
		token_var="GITLAB_TOKEN"
		;;
	esac

	while [ $key_exists -ne 0 ]; do
		read -rp "${tty_green}Please enter the email you use for $service_name_var: ${tty_reset}" email
		read -rp "${tty_green}Please enter a name for this $service_name_var key (e.g., work, personal): ${tty_reset}" name
		create_ssh_key "$email" "$service" "$name"
		key_exists=$?
	done

	read -rp "${tty_green}Please enter your $service_name_var Personal Access token: ${tty_reset}" token
	upload_ssh_key "$service" "$email" "$name" "$token"
}

while true; do
	printf "%sWhere would you like to upload your SSH key?%s\n" "${tty_green}" "${tty_reset}"
	printf "1) GitHub\n"
	printf "2) GitLab\n"
	printf "3) Exit\n"
	read -rp "${tty_green}Please enter the number corresponding to your choice: ${tty_reset}" CHOICE

	case $CHOICE in
	1)
		setup_service "github"
		;;
	2)
		setup_service "gitlab"
		;;
	3)
		printf "%sExiting...%s\n" "${tty_yellow}" "${tty_reset}"
		break
		;;
	*)
		printf "%sInvalid option selected. Please choose 1, 2, or 3.%s\n\n" "${tty_red}" "${tty_reset}"
		;;
	esac
done

printf "\n%s==================== SSH Import Keys Script ends ====================%s\n\n" "${tty_yellow}" "${tty_reset}"

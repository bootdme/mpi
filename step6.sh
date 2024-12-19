#!/bin/bash

set -euo pipefail

source variables.sh

# Function to remove a file or directory
remove_file_or_directory() {
	local file_or_directory="$1"
	if [ -e "$file_or_directory" ]; then
		if [ -f "$file_or_directory" ]; then
			rm "$file_or_directory"
			printf "%sFile %s has been removed.%s\n" "${tty_green}" "$file_or_directory" "${tty_reset}"
		elif [ -d "$file_or_directory" ]; then
			rm -r "$file_or_directory"
			printf "%sDirectory %s has been removed.%s\n" "${tty_green}" "${file_or_directory}" "${tty_reset}"
		else
			printf "%sError: %s is not a valid file or directory.%s\n" "${tty_red}" "${file_or_directory}" "${tty_reset}"
		fi
	else
		printf "%sWarning: %s does not exist.%s\n" "${tty_red}" "${file_or_directory}" "${tty_reset}"
	fi
}

printf "\n%s==================== Cleanup script starts ====================%s\n\n" "${tty_yellow}" "${tty_reset}"

remove_file_or_directory "$HOME/.zprofile"
remove_file_or_directory "$HOME/.zsh_history"
remove_file_or_directory "$HOME/.zshenv"
remove_file_or_directory "$HOME/.zshrc"
remove_file_or_directory "$HOME/.zsh_sessions"
remove_file_or_directory "$HOME/.zcompdump"

remove_file_or_directory "$HOME/.viminfo"
remove_file_or_directory "$HOME/.vim"

remove_file_or_directory "$HOME/.bash_history"

remove_file_or_directory "$HOME/.fzf.bash"
remove_file_or_directory "$HOME/.fzf.zsh"

remove_file_or_directory "$HOME/.wget-hsts"

remove_file_or_directory "$HOME/Documents/.localized"

printf "\n%s==================== Cleanup script ends ====================%s\n\n" "${tty_yellow}" "${tty_reset}"

#!/bin/bash

source variables.sh

set -euo pipefail

# Rosetta
softwareupdate --install-rosetta --agree-to-license

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/bootdme/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
source ~/.zprofile

#!/bin/bash

set -euo pipefail

# Xcode
xcode-select --install

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# macOS Post-Installation Setup for M1 MacBook Air (2020)

A step-by-step guide to setting up a fresh installation of macOS Sequoia 15.3 on a 2020 M1 MacBook Air (16GB RAM).

> **NOTE**: Follow these steps sequentially for a smooth setup experience.

## Prerequisites

Before you begin, make sure you have:

-   **macOS 15.3 or later** installed.
-   Your **personal access token** ready for GitHub/GitLab (for steps 2 and 3).

Place the `mpi` directory in `~/Documents` before starting.

## Steps

### 1. **Set Up macOS Environment**

Run: `./step1.sh` 

Installs and configures essential tools:

-   **Xcode Command Line Tools**
-   **Rosetta 2** (for Intel-based apps)
-   **Homebrew** (package manager)
-   **Rustup** (Rust environment)
-   Adds **Nu Shell** to `/etc/shells`
-   Upgrades **pip** and installs the **distro** package for dotbot

> **NOTE**: Close and reopen your terminal after running this script.

### 2. **Upload SSH Keys to GitHub/GitLab**

Run: `./step2.sh` 

Generates SSH keys and uploads them to GitHub or GitLab. Have your **personal access token** ready for authentication.

### 3. **Upload GPG Key to GitHub**

> **NOTE**: This script is a work in progress. *Trying to figure out how to automatically upload keys to Gitlab*.

Run: `./step3.sh` 

Installs GPG tools and uploads your GPG key to GitHub.

Tools installed:
-   **GnuPG** (`gnupg`)
-   **Pinentry-mac** (`pinentry-mac`)

### 4. **Adjust macOS Settings and Security**

Run: `./step4.sh` 

Configures macOS for better security and developer experience. It also applies security enhancements using [macos_hardening](https://github.com/ataumo/macos_hardening).

### 5. **Install Dotfiles and Tools**

Run: `./step5.sh` 

Clones my [dotfiles](https://github.com/bootdme/dotfiles) and sets up configurations and tools. Here's what it sets up:

1.  **Submodules**:  
    Updates any git submodules required for the dotfiles.
    
2.  **Symlinks**:  
	Links configuration files for the following tools:
    -   **Neovim** (`~/.config/nvim`)
    -   **Kitty Terminal** (`~/.config/kitty`)
    -   **Git** (`~/.config/git/config.base`)
    -   **Nu Shell** ( `~/Library/Application Support/nushell`)
    
3.  **Homebrew Packages**:
    Installs the following Homebrew packages:
    -   **Development Tools**: `cmake`, `go`, `neovim`, `postgresql@17`, `rsteube/tap/carapace`, `wget`
    -   **Taps**: `homebrew/services`, `rsteube/homebrew-tap`

4.  **Homebrew Applications**:
    Installs the following Homebrew applications:
    -   **Productivity**: `anki`, `microsoft-outlook`, `postman`, `visual-studio-code`
    -   **Browsers**: `brave-browser`, `mullvad-browser`
    -   **Utilities**: `appcleaner`, `bitwarden`, `kitty`, `spotify`, `wireshark`
    -   **Communication**: `discord`
    
5.  **Cargo Tools**:  
    Installs Rust-based utilities via `cargo`:
    -   **cargo-update** (updates installed Cargo packages)
    -   **fnm** (Fast Node Manager)
    -   **zoxide** (smarter `cd` command)
    -   **nushell** (A `nu` type of shell)

### 6. **Clean Up Unused Files**

Run: `./step6.sh` 

This script removes temporary files and unnecessary directories.

## Final Notes

-   Your macOS is now configured for development.
-   Customize further to match your workflow.
-   Run `fnm install --lts` for nvim packages.
-   For issues or suggestions, open a PR or issue on the [GitHub repository](https://github.com/bootdme/mpi).

Happy coding! 🚀

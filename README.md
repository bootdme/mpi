# MacOS Post Installation Scripts
> Installation scripts for my fresh M1 Macbook Air.


Make sure to have your developer platform's personal token available. You will need it to upload SSH & GPG keys.
## Steps
1. `./init.sh`
    - Installs Rosetta, homebrew, and rustup.
2. `./ssh.sh`
    - Uploads SSH key to either Github or Gitlab.
3. `./dots.sh`
    - Clones [dotfiles](https://github.com/bootdme/dotfiles) to `~/`.
    - Installs brew packages and links nvim, kitty, nushell, and git.
4. `./packages.sh`
    - Adjusts Macbook settings.
5. `./gpg.sh`
    - Uploads GPG key to either Github or Gitlab.
6. `./cleanup.sh`
    - Cleans up any unused directories and files.

# MacOS Post Installation Scripts

Installation scripts for a fresh M1 macOS

## Steps

1. `./init.sh`
    - Installs Rosetta & homebrew.
2. `./ssh.sh`
    - Uploads SSH key to Github.
    - Have your Github personal token & email ready for use.
3. `./dots.sh`
    - Clones [dotfiles](https://github.com/bootdme/dotfiles) to `~/`.
    - Go into `~/dotfiles` and `./install`.
    - NOTE: Installation will fail first try. Run `./install` again.
    - Installs brew packages and links nvim, fish, kitty, and git configs.
4. `./packages.sh`
    - Installs rustup and nvm.
5. `./gpg.sh`
    - Uploads GPG key to Github.
    - Have your Github personal token & email ready for use.
6. `./cleanup.sh`
    - Cleans up any unused directories and files.

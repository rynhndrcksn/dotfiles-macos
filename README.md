# rynhndrcksn's dotfiles
My dotfiles that I use for MacOS. Most of the content of this repo is in thanks to [Patrick McDonald](https://www.udemy.com/course/dotfiles-from-start-to-finish-ish/). This dotfiles were designed to run on M1 Macs and won't work with Intel ones (different Homebrew installation paths) unless you manually change stuff in the files.

**Important note**: these dotfiles will change all shell commands to run through ZSH as it was designed for MacOS. If using Linux/WSL you might have to do some extra configurations/problem solving. Use these at your own risks!

## Installation
1. Install Xcode Command Line Tools: `xcode-select --install`.
2. Install [Brew](https://brew.sh/).
3. Generate ssh key: `ssh-keygen -t ed25519` Note: If you are using a legacy system that doesn't support the Ed25519 algorithm, use: `$ ssh-keygen -t rsa -b 4096`.
4. Run `eval "$(ssh-agent -s)"` followed by `ssh-add ~/.ssh/id_ed25519` or `ssh-add ~/.ssh/id_rsa` and enter your passphrase when prompted.
    - Note: MacOS may run into an issue if the .ssh/config is empty. Look [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent) for fix.
5. Install ssh public key on GitLab/GitHub.
6. Clone repo to local .dotfiles: `git clone git@gitlab.com:rynhndrcksn/dotfiles.git ~/.dotfiles`.
7. Navigate to .dotfiles: `cd .dotfiles`.
8. Run: `./install`.

## Updating Brewfile
1. Install any software through `brew` that's needed.
2. Run `bbd`, an alias for `brew bundle dump --force --describe`, to dump any brew installs to the `Brewfile`.
3. Commit the changes and push them 🥳

## License
Copyright (c) 2022 Ryan Hendrickson. Released under the MIT License. See [LICENSE](LICENSE) for details.
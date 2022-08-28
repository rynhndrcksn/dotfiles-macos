# rynhndrcksn's dotfiles
My dotfiles that I use for Linux and MacOS. Nothing wild, just wanted to keep a backup of them.

## Installation:
1. Install Xcode Command Line Tools: `xcode-select --install`.
2. Install [Brew](https://brew.sh/).
3. Generate ssh key: `ssh-keygen -t ed25519` Note: If you are using a legacy system that doesn't support the Ed25519 algorithm, use: `$ ssh-keygen -t rsa -b 4096`.
4. Run `eval "$(ssh-agent -s)"` followed by `ssh-add ~/.ssh/id_ed25519` or `ssh-add ~/.ssh/id_rsa` and enter your passphrase when prompted.
    - Note: MacOS may run into an issue if the .ssh/config is empty. Look [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent) for fix.
5. Install ssh public key on GitLab/GitHub.
6. Clone repo to local .dotfiles: `git clone git@gitlab.com:rynhndrcksn/dotfiles.git ~/.dotfiles`.
7. Navigate to .dotfiles: `cd .dotfiles`.
8. Run: `./install`.

## License
Copyright (c) 2022 Ryan Hendrickson. Released under the MIT License. See LICENSE.md for details.
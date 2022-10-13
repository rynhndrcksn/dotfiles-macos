# MacOS Dotfiles
My dotfiles that I use for MacOS. Most of the content of this repo is in thanks to [Patrick McDonald](https://www.udemy.com/course/dotfiles-from-start-to-finish-ish/). This dotfiles were designed to run on M1 Macs and won't work with Intel ones (different Homebrew installation paths) unless you manually change stuff in the files.

**Important note**: these dotfiles will change all shell commands to run through ZSH as it was designed for MacOS. If using Linux/WSL you might have to do some extra configurations/problem solving. Use these at your own risks!

## Installation
1. Install Xcode Command Line Tools: `xcode-select --install`.
2. Generate ssh key: `ssh-keygen -t ed25519`.
3. Run `eval "$(ssh-agent -s)"`.
4. MacOS wants the following in `~/.ssh/config`:
```bash
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```
5. Run `ssh-add --apple-use-keychain ~/.ssh/id_ed25519` and enter your passphrase when prompted.
    - Note: MacOS may run into an issue if ~/.ssh/config is misconfigured. Look [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent) for help.
6. Install SSH public key on GitHub.
   1. Use `pbcopy < ~/.ssh/id_ed25519.pub` to easily copy the public key.
7. Test connection with `ssh -T git@github.com`.
8. Clone repo to local ~/.dotfiles: `git clone git@github.com:rynhndrcksn/dotfiles-macos.git ~/.dotfiles`.
   1. Note: If cloned with HTTPS instead of SSH, run `git remote set-url origin git@github.com:rynhndrcksn/dotfiles-macos.git` after setting up SSH keys.
   2. Note 2: Setup [commit signature verification](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification)
9.  Navigate to .dotfiles: `cd ~/.dotfiles`.
10. Run: `./install`.

## Updating Brewfile
1. Install any software through `brew` that's needed.
2. Run `bbd`, an alias for `brew bundle dump --force --describe`, to dump any brew installs to the `Brewfile`.
3. Commit the changes and push them 🥳

## License
Copyright (c) 2022 Ryan Hendrickson. Released under the MIT License. See [LICENSE](LICENSE) for details.
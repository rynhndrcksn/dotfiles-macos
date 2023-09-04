# MacOS Dotfiles
My dotfiles that I use for MacOS. Eventually I might make this an OS agnostic `.dotfiles` repo, but I only use a Macbook atm, so 🤷🏻‍♂️. These dotfiles were designed to run on Apple Silicon Macs and won't work with Intel ones (different Homebrew installation paths) unless you manually change stuff in the files.

**Important note**: these dotfiles will change all shell commands to run through ZSH as it was designed for MacOS. If using Linux/WSL you might have to do some extra configurations/problem solving. Use these at your own risks!

## Installation
1. Install Xcode Command Line Tools: `xcode-select --install`.
2. Test connection with `ssh -T git@github.com`.
3. Clone repo to local ~/.dotfiles directory: `git clone git@github.com:TahomaTech/dotfiles-macos.git ~/.dotfiles`.
4. Navigate to .dotfiles: `cd ~/.dotfiles`.
5. Run: `./install`.

## Updating Brewfile
1. Modify software through `brew` as needed.
2. Run `bbd`, an alias for `brew bundle dump --force --describe`, to dump any `brew` changes to the `Brewfile`.
   1. There's an `ENV` variable set in `shell/zshrc` that makes it so `bbd` can be ran from any directory and will update this repos `Brewfile`.
3. Commit the changes and push them 🥳

## License
Copyright (c) 2022 Ryan Hendrickson. Released under the MIT License. See [LICENSE](LICENSE) for details.
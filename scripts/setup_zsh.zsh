#!/usr/bin/env zsh
# Author: Ryan H.
# Filename: setup_zsh.zsh
# Configures system to use Homebrew's updated ZSH vs MacOS's default ZSH..

echo "\n<<< Starting ZSH setup >>>\n"

echo "Enter superuser (sudo) password to add Homebrew's ZSH to /etc/shells"
echo "This makes Homebrew's ZSH program an approved shell for MacOS to use."
echo '/usr/local/bin/zsh' | sudo tee -a '/etc/shells'

chsh -s '/usr/local/bin/zsh'
echo "Success! Logout and back in for changes to take effect."
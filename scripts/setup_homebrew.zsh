#!/usr/bin/env zsh
# Author: Ryan H.
# Filename: setup_homebrew.zsh
# Installs Homebrew and installs wanted software.

echo "\n<<< Homebrew installation starting >>>\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle --verbose

echo "\n<<< Homebrew installation finished >>>\n"
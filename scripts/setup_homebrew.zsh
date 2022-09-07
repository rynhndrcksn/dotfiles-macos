#!/usr/bin/env zsh
# Author: Ryan H.
# Filename: setup_homebrew.zsh
# Installs Homebrew and installs wanted software.

if exists brew; then
    echo "\n<<< Homebrew installed already, skipping installation >>>\n"
else
    echo "\n<<< Homebrew installation starting >>>\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "\n<<< Homebrew installation finished >>>\n"
fi

brew bundle --verbose
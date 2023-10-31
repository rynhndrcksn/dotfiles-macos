#!/usr/bin/env sh
# Author: Ryan H.
# Filename: setup_homebrew.sh
# Installs Homebrew and installs wanted software.

if /usr/bin/pgrep oahd >/dev/null 2>&1; then
    printf '\n<<< Rosetta 2 installed already, skipping installation >>>\n'
else
    printf '\n<<< Rosetta 2 installation starting >>>\n'
    sudo softwareupdate --install-rosetta
fi

printf '\n<<< Starting Homebrew setup >>>\n'

if exists brew; then
    printf '\n<<< Homebrew installed already, skipping installation >>>\n'
else
    printf '\n<<< Homebrew installation starting >>>\n'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    printf '\n<<< Homebrew installation finished >>>\n'
fi

printf '\n<<< Brewfile installation starting >>>\n'
brew bundle --verbose

# Rebuild 'bat' cache so it finds custom themes
bat cache --build


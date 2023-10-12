#!/usr/bin/env sh
# Author: Ryan H.
# Filename: setup_homebrew.sh
# Installs Homebrew and installs wanted software.

printf '\n<<< Ask for sudo password up-front >>>\n'
sudo -v

# Change laptop hostname to 
printf 'What would you like the hostname to be? '
read -r hostname
sudo "scutil --set HostName $hostname"

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

# printf '\n<<< Installing VS Code Extensions >>>\n'
# cmd < ./config/vscode_extensions | while read -r extension || [[ -n $extension ]];
# do
#   "codium --install-extension $extension --force"
# done

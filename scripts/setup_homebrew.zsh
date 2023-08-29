#!/usr/bin/env zsh
# Author: Ryan H.
# Filename: setup_homebrew.zsh
# Installs Homebrew and installs wanted software.

echo "\n<<< Ask for sudo password up-front >>>\n"
sudo -v

# Change laptop hostname to 
vared -p 'What would you like the hostname to be? ' -c hostName
sudo scutil --set HostName $hostName

if /usr/bin/pgrep oahd >/dev/null 2>&1; then
    echo "\n<<< Rosetta 2 installed already, skipping installation >>>\n"
else
    echo "\n<<< Rosetta 2 installation starting >>>\n"
    sudo softwareupdate --install-rosetta
fi

echo "\n<<< Starting Homebrew setup >>>\n"

if exists brew; then
    echo "\n<<< Homebrew installed already, skipping installation >>>\n"
else
    echo "\n<<< Homebrew installation starting >>>\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "\n<<< Homebrew installation finished >>>\n"
fi

echo "\n<<< Brewfile installation starting >>>\n"
brew bundle --verbose

# Rebuild 'bat' cache so it finds custom themes
bat cache --build

echo "\n<<< Installing VS Code Extensions >>>\n"
cat ./config/vscode_extensions | while read extension || [[ -n $extension ]];
do
  codium --install-extension $extension --force
done
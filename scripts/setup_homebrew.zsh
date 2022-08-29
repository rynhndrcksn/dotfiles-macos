#!/usr/bin/env zsh
# Author: Ryan H.
# Filename: setup_homebrew.zsh
# Installs Homebrew and installs wanted software/applications.

echo "\n<<< Homebrew installation starting >>>\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# CLI tools/software
brew install ansible
brew install bat
brew install docker
brew install docker-compose
brew install go
brew install htop
brew install php@7.4
brew install tldr

# Applications
brew install --cask --no-quarantine alfred
#brew install --cask --no-quarantine firefox
brew install --cask --no-quarantine lando
brew install --cask --no-quarantine vscodium
brew install --cask --no-quarantine vagrant

echo "\n<<< Homebrew installation finished >>>\n"
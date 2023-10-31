#!/usr/bin/env sh
# Author: Ryan H.
# Filename: entry_point.sh
# Entry point for setting up script files.

printf '\n<<< Ask for sudo password up-front >>>\n'
sudo -v

./setup_homebrew.zsh;
./setup_macos.zsh;
./setup_node.zsh;
./setup_zsh.zsh;

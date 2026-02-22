#!/usr/bin/env sh
# Author: Ryan H.
# Filename: install.sh
# Displays options for the installer to execute.

while true; do
    printf '\nThese are the available options:\n'
    printf '\t0) Execute every command\n'
    printf '\t1) Setup symlinks\n'
    printf '\t2) Install packages\n'
    printf '\t3) Setup n, a node version manager\n'
    printf '\t4) Setup Symfony CLI with curl\n'
    printf '\t5) Install Rust viw curl\n'
    printf '\tQ) Exit the installer\n'
    printf '\nPlease enter your selection: '
    read -r opt
    case $opt in
        [0]* ) sh "$HOME/.dotfiles/scripts/everything.sh"; continue;;
        [1]* ) sh "$HOME/.dotfiles/scripts/setup_symlinks.sh"; continue;;
        [2]* ) sh "$HOME/.dotfiles/scripts/install_packages.sh"; continue;;
        [3]* ) sh "$HOME/.dotfiles/scripts/setup_n.sh"; continue;;
        [4]* ) curl -sS https://get.symfony.com/cli/installer | bash; continue;;
        [5]* ) curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;;
        [Qq]* ) printf '\nA terminal restart may be necessary for changes to take affect\n'; exit;;
        * ) printf '\n\nPlease enter a valid option\n';;
    esac
done

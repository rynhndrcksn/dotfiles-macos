#!/usr/bin/env sh
# Author: Ryan H.
# Filename: install.sh
# Setup the symbolic links for the files 🎉
# Then ask if user wants to do 'first time setup'
# which triggers scripts/entry_point.sh

printf "\n<<< Setting up symbolic links for \$DOTFILES... >>>\n"

DOTFILES_DIR="$HOME/.dotfiles"
CONFIG_DIR="$HOME/.config"

####################
# config directory #
####################

# bat
rm -rf "$CONFIG_DIR/bat"
ln -s "$DOTFILES_DIR/config/bat" "$CONFIG_DIR/bat"

# btop
rm -rf "$CONFIG_DIR/btop"
ln -s "$DOTFILES_DIR/config/btop" "$CONFIG_DIR/btop"

# kitty
rm -rf "$CONFIG_DIR/kitty"
ln -s "$DOTFILES_DIR/config/kitty" "$CONFIG_DIR/kitty"

# nvim
rm -rf "$CONFIG_DIR/nvim"
ln -s "$DOTFILES_DIR/config/nvim" "$CONFIG_DIR/nvim"

# skhd
rm -rf "$CONFIG_DIR/skhd"
ln -s "$DOTFILES_DIR/config/skhd" "$CONFIG_DIR/skhd"

# spaceship
rm -rf "$CONFIG_DIR/spaceship"
ln -s "$DOTFILES_DIR/config/spaceship" "$CONFIG_DIR/spaceship"

# yabai
rm -rf "$CONFIG_DIR/yabai"
ln -s "$DOTFILES_DIR/config/yabai" "$CONFIG_DIR/yabai"

#################
# git directory #
#################

# gitconfig
rm -rf "$HOME/.gitconfig"
ln -s "$DOTFILES_DIR/git/gitconfig_global" "$HOME/.gitconfig"

# gittemplate
rm -rf "$HOME/.gittemplate"
ln -s "$DOTFILES_DIR/git/gittemplate" "$HOME/.gittemplate"

###################
# shell directory #
###################

# shell stuff
rm -rf "$HOME/.shell"
mkdir -p "$HOME/.shell"
ln -s "$DOTFILES_DIR/shell/aliases" "$HOME/.shell/aliases"
ln -s "$DOTFILES_DIR/shell/functions" "$HOME/.shell/functions"
ln -s "$DOTFILES_DIR/shell/symfony_autocompletion.sh" "$HOME/.shell/symfony_autocompletion.sh"

# .zshenv
rm -rf "$HOME/.zshenv"
ln -s "$DOTFILES_DIR/shell/zshenv" "$HOME/.zshenv"

# .zshrc
rm -rf "$HOME/.zshrc"
ln -s "$DOTFILES_DIR/shell/zshrc" "$HOME/.zshrc"

printf "\n<<< Done setting up symbolic links for \$DOTFILES >>>\n"

########
# misc #
########

# ensure some useful local directories exist and send stderr to /dev/null
mkdir -p "$HOME/.local/bin" 2>/dev/null
mkdir -p "$HOME/projects" 2>/dev/null
mkdir -p "$HOME/.tmp" 2>/dev/null

# see if we need to run entry_point.sh
while true; do
    printf 'Run entry_point.sh? '
    read -r yn
    # read -r 'Run entry_point.sh? ' yn
    case $yn in
        [Yy]* ) sh scripts/entry_point.sh; break;;
        [Nn]* ) exit;;
        * ) printf "\nPlease answer yes or no.\n";;
    esac
done

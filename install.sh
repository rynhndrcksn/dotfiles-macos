#!/usr/bin/env sh
# Author: Ryan H.
# Filename: install.sh
# Setup the symbolic links for the files 🎉
# Then ask if user wants to do 'first time setup'
# which triggers scripts/entry_point.sh

printf "\n<<< Setting up symbolic links for \$DOTFILES... >>>\n"

CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/.dotfiles"
USER_DIR="$HOME/.local/user"

# ensure some useful local directories exist and send stderr to /dev/null
mkdir -p "$HOME/.local/bin" 2>/dev/null
mkdir -p "$USER_DIR" 2>/dev/null
mkdir -p "$HOME/projects" 2>/dev/null
mkdir -p "$HOME/.tmp" 2>/dev/null

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
rm "$HOME/.gitconfig"
ln -s "$DOTFILES_DIR/git/gitconfig_global" "$HOME/.gitconfig"

# gittemplate
rm "$USER_DIR/gittemplate"
ln -s "$DOTFILES_DIR/git/gittemplate" "$USER_DIR/gittemplate"

###################
# shell directory #
###################

# shell stuff
rm "$USER_DIR/aliases"
ln -s "$DOTFILES_DIR/shell/aliases" "$USER_DIR/aliases"

rm "$USER_DIR/functions"
ln -s "$DOTFILES_DIR/shell/functions" "$USER_DIR/functions"

rm "$USER_DIR/symfony_autocompletion.sh"
ln -s "$DOTFILES_DIR/shell/symfony_autocompletion.sh" "$USER_DIR/symfony_autocompletion.sh"

# .zshenv
rm -rf "$HOME/.zshenv"
ln -s "$DOTFILES_DIR/shell/zshenv" "$HOME/.zshenv"

# .zshrc
rm -rf "$HOME/.zshrc"
ln -s "$DOTFILES_DIR/shell/zshrc" "$HOME/.zshrc"

printf "\n<<< Done setting up symbolic links for \$DOTFILES >>>\n\n"

########
# misc #
########

# see if we need to run entry_point.sh
while true; do
    printf 'Run entry_point.sh? '
    read -r yn
    case $yn in
        [Yy]* ) sh scripts/entry_point.sh; break;;
        [Nn]* ) exit;;
        * ) printf "\nPlease answer yes or no.\n";;
    esac
done

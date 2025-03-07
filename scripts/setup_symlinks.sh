#!/usr/bin/env sh
# Author: Ryan H.
# Filename: install.sh
# Setup symbolic links for various files/directories.

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
if [ -d "$CONFIG_DIR/bat" ]; then
    rm -rf "$CONFIG_DIR/bat"
fi
ln -s "$DOTFILES_DIR/config/bat" "$CONFIG_DIR/bat"

# btop
if [ -d "$CONFIG_DIR/btop" ]; then
    rm -rf "$CONFIG_DIR/btop"
fi
ln -s "$DOTFILES_DIR/config/btop" "$CONFIG_DIR/btop"

# ideavim
if [ -f "$HOME/.ideavimrc" ]; then
    rm -rf "$HOME/.ideavimrc"
fi
ln -s "$DOTFILES_DIR/config/ideavim/.ideavimrc" "$HOME/.ideavimrc"

# nvim
if [ -d "$CONFIG_DIR/nvim" ]; then
    rm -rf "$CONFIG_DIR/nvim"
fi
ln -s "$DOTFILES_DIR/config/nvim" "$CONFIG_DIR/nvim"

# spaceship
if [ -d "$CONFIG_DIR/spaceship" ]; then
    rm -rf "$CONFIG_DIR/spaceship"
fi
ln -s "$DOTFILES_DIR/config/spaceship" "$CONFIG_DIR/spaceship"

# wezterm
if [ -d "$CONFIG_DIR/wezterm" ]; then
    rm -rf "$CONFIG_DIR/wezterm"
fi
ln -s "$DOTFILES_DIR/config/wezterm" "$CONFIG_DIR/wezterm"

#################
# git directory #
#################

# gitconfig
if [ -d "$HOME/.gitconfig" ]; then
    rm "$HOME/.gitconfig"
fi
ln -s "$DOTFILES_DIR/git/gitconfig_global" "$HOME/.gitconfig"

# gittemplate
if [ -d "$USER_DIR/gittemplate" ]; then
    rm "$USER_DIR/gittemplate"
fi
ln -s "$DOTFILES_DIR/git/gittemplate" "$USER_DIR/gittemplate"

###################
# shell directory #
###################

# shell stuff
if [ -d "$USER_DIR/aliases" ]; then
    rm "$USER_DIR/aliases"
fi
ln -s "$DOTFILES_DIR/shell/aliases" "$USER_DIR/aliases"

if [ -d "$USER_DIR/functions" ]; then
    rm "$USER_DIR/functions"
fi
ln -s "$DOTFILES_DIR/shell/functions" "$USER_DIR/functions"

# .zshenv
if [ -d "$HOME/.zshenv" ]; then
    rm -rf "$HOME/.zshenv"
fi
ln -s "$DOTFILES_DIR/shell/zshenv" "$HOME/.zshenv"

# .zshrc
if [ -d "$HOME/.zshrc" ]; then
    rm -rf "$HOME/.zshrc"
fi
ln -s "$DOTFILES_DIR/shell/zshrc" "$HOME/.zshrc"

printf "\n<<< Done setting up symbolic links for \$DOTFILES >>>\n\n"


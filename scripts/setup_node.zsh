#!/usr/bin/env zsh
# Author: Ryan H.
# Filename: setup_node.zsh
# Installs 'n' and Node.

echo "\n<<< Starting Node setup >>>\n"

if exists $N_PREFIX/bin/node; then
  echo "\n<<< Node $($N_PREFIX/bin/node --version) & NPM $($N_PREFIX/bin/npm --version) already installed with n >>>\n"
else
  echo "\n<<< Installing Node & NPM with n... >>>\n"
  n latest
fi

echo "\n<<< Global NPM installs starting >>>\n"
# Global NPM installs
npm i -g typescript

echo "\n<<< Global NPM installs finished >>>\n"
npm list --global --depth=0 

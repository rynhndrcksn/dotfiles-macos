#!/usr/bin/env sh
# Author: Ryan H.
# Filename: setup_node.sh
# Installs 'n' and Node LTS.

echo "\n<<< Starting Node setup >>>\n"

if exists $N_PREFIX/bin/node; then
  echo "\n<<< Node $($N_PREFIX/bin/node --version) & NPM $($N_PREFIX/bin/npm --version) already installed with n >>>\n"
else
  echo "\n<<< Installing Node & NPM with n... >>>\n"
  n lts
fi

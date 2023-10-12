#!/usr/bin/env sh
# Author: Ryan H.
# Filename: setup_node.sh
# Installs 'n' and Node LTS.

printf '\n<<< Starting Node setup >>>\n'

if exists "$N_PREFIX/bin/node"; then
  printf '\n<<< Node %n & NPM %p already installed with n' "$("$N_PREFIX/bin/node --version")" "$("$N_PREFIX/bin/npm --version")"
else
  printf '\n<<< Installing Node & NPM with n... >>>\n'
  n lts
fi

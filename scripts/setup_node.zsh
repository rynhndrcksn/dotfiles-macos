#!/usr/bin/env zsh
# Author: Ryan H.
# Filename: setup_node.zsh
# Installs 'n' and Node.

echo "\n<<< Starting Node setup >>>\n"

if exists node; then
    echo "\n<<< Node $(node --version) and NPM $(npm --version) already exists. >>>\n"
else
    echo "\n<<< Node LTS and NPM installation with n starting >>>\n"
    n lts
    echo "\n<<< Node LTS and NPM installation with n finished >>>\n"
fi

echo "\n<<< Global NPM installs starting >>>\n"
# Global NPM installs
npm i -g typescript

echo "\n<<< Global NPM installs finished >>>\n"
npm list --global --depth=0 

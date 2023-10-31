#!/usr/bin/env sh
# Author: Ryan H.
# Filename: setup_zsh.sh
# Configures system to use Homebrew's updated ZSH vs MacOS's default ZSH.

printf '\n<<< Starting ZSH setup >>>\n'

# Add /opt/homebrew/bin/zsh to /etc/shells
if grep -Fxq '/opt/homebrew/bin/zsh' '/etc/shells'; then
    printf '/opt/homebrew/bin/zsh already exists in /etc/shells'
else
    printf "Enter superuser (sudo) password to edit /etc/shells"
    printf '/opt/homebrew/bin/zsh' | sudo tee -a '/etc/shells' >/dev/null
fi

# Change default shell from /bin/zsh to /opt/homebrew/bin/zsh
if [ "$SHELL" = '/opt/homebrew/bin/zsh' ]; then
    printf '%s is already /opt/homebrew/bin/zsh' "$SHELL"
else
    printf "Enter user password to change login shell"
    chsh -s '/opt/homebrew/bin/zsh'
    printf "Success! Logout and back in for changes to take effect."
fi

# Change sh to be aliased to MacOS's ZSH install rather than BASH.
# Note: Using Homebrew's ZSH doesn't work, so we have to use MacOS's ZSH.
if sh --version | grep -q dash; then
    printf '/private/var/select/sh already linked to /bin/dash'
else
    printf 'Enter superuser (sudo) password to symlink sh to dash '
    sudo ln -sfv /bin/dash /private/var/select/sh
fi

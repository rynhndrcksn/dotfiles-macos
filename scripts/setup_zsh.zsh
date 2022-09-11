#!/usr/bin/env zsh
# Author: Ryan H.
# Filename: setup_zsh.zsh
# Configures system to use Homebrew's updated ZSH vs MacOS's default ZSH..

echo "\n<<< Starting ZSH setup >>>\n"

# Add /opt/homebrew/bin/zsh to /etc/shells
if grep -Fxq '/opt/homebrew/bin/zsh' '/etc/shells'; then
    echo '/opt/homebrew/bin/zsh already exists in /etc/shells'
else
    echo "Enter superuser (sudo) password to edit /etc/shells"
    echo '/opt/homebrew/bin/zsh' | sudo tee -a '/etc/shells' >/dev/null
fi

# Change default shell from /bin/zsh to /opt/homebrew/bin/zsh
if [ "$SHELL" = '/opt/homebrew/bin/zsh' ]; then
    echo '$SHELL is already /opt/homebrew/bin/zsh'
else
    echo "Enter user password to change login shell"
    chsh -s '/opt/homebrew/bin/zsh'
    echo "Success! Logout and back in for changes to take effect."

fi

# Change sh to be aliased to MacOS's ZSH install rather than BASH.
# Note: Using Homebrew's ZSH doesn't work, so we have to use MacOS's ZSH.
if sh --version | grep -q zsh; then
    echo '/private/var/select/sh already linked to /bin/zsh'
else
    echo "Enter superuser (sudo) password to symlink sh to zsh"
    sudo ln -sfv /bin/zsh /private/var/select/sh
fi
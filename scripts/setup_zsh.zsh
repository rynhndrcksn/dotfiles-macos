#!/usr/bin/env zsh
# Author: Ryan H.
# Filename: setup_zsh.zsh
# Configures system to use Homebrew's updated ZSH vs MacOS's default ZSH..

echo "\n<<< Starting ZSH setup >>>\n"

# Add /usr/local/bin/zsh to /etc/shells
if grep -Fxq '/usr/local/bin/zsh' '/etc/shells'; then
    echo '/usr/local/bin/zsh already exists in /etc/shells'
else
    echo "Enter superuser (sudo) password to edit /etc/shells"
    echo '/usr/local/bin/zsh' | sudo tee -a '/etc/shells' >/dev/null
fi

# Change default shell from /bin/zsh to /usr/local/bin/zsh
if [ "$SHELL" = '/usr/local/bin/zsh' ]; then
    echo '$SHELL is already /usr/local/bin/zsh'
else
    echo "Enter user password to change login shell"
    chsh -s '/usr/local/bin/zsh'
    echo "Success! Logout and back in for changes to take effect."

fi

# Change sh to be aliased to MacOS's ZSH install rather than BASH.
# Note: Using /usr/local/bin/zsh doesn't work well, so we have to use MacOS's ZSH.
if sh --version | grep -q zsh; then
    echo '/private/var/select/sh already linked to /bin/zsh'
else
    echo "Enter superuser (sudo) password to symlink sh to zsh"
    # sudo ln -sfv /bin/zsh /private/var/select/sh
fi
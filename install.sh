#!/usr/bin/env bash

if [ -z "$USER" ]; then
    USER=$(id -un)
fi

echo ' ls : '  $ls
echo $pwd
# cd $HOME
# cd "/workspaces/.codespaces/.persistedshare"

echo 'location : ' "$pwd"
mkdir dotfiles
echo ' ls : '  $ls
chmod 777 dotfiles

mv /workspaces/.codespaces/.persistedshare/dotfiles /workspaces/dotfiles/.dotfiles/bash
mv /workspaces/.codespaces/.persistedshare/dotfiles /workspaces/dotfiles/.dotfiles/github
mv /workspaces/.codespaces/.persistedshare/dotfiles /workspaces/dotfiles/.dotfiles/markdown
mv /workspaces/.codespaces/.persistedshare/dotfiles /workspaces/dotfiles/.dotfiles/vscode




create_symlinks() {
    # Get the directory in which this script lives.
    script_dir=$(dirname "$(readlink -f "$0")")
    echo $script_dir


    # Get a list of all files in this directory that start with a dot.
    files=$(find -maxdepth 4 -type f -name ".*") 
    echo $files
    # Create a symbolic link to each file in the home directory.
    for file in $files; do
        name=$(basename $file)
        echo "Creating symlink to $name in home directory."
        rm -rf ~/$name
        ln -s $script_dir/$name ~/$name
    done
}

create_symlinks


echo "Initializing conda for zsh."
# conda init zsh

# echo "Installing fonts."
# FONT_DIR="$HOME/.fonts"
# git clone https://github.com/powerline/fonts.git $FONT_DIR --depth=1
# cd $FONT_DIR
# ./install.sh

# echo "Setting up the Spaceship theme."
# ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
# git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"


# Make passwordless sudo work 
export SUDO_ASKPASS=/bin/true

#update package 
# sudo apt-get update
# sudo apt-get -y install --no-install-recommends apt-utils dialog 2>$1

# Cleanup
# sudo apt-get autoremove -y
# sudo apt-get autoremove -y
# sudo rm -rf /var/lib/apt/lists/*





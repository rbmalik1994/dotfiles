#!/bin/sh

if [ -z "$USER" ]; then
    USER=$(id -un)
fi

mv /workspaces/.codespaces/.persistedshare/dotfiles $HOME/.dotfiles/bash
mv /workspaces/.codespaces/.persistedshare/dotfiles $HOME/.dotfiles/github
mv /workspaces/.codespaces/.persistedshare/dotfiles $HOME/.dotfiles/markdown
mv /workspaces/.codespaces/.persistedshare/dotfiles $HOME/.dotfiles/vscode

cd $HOME


# Make passwordless sudo work 
export SUDO_ASKPASS=/bin/true

#update package 
sudo apt-get update
sudo apt-get -y install --no-install-recommends apt-utils dialog 2>$1

# Cleanup
sudo apt-get autoremove -y
sudo apt-get autoremove -y
sudo rm -rf /var/lib/apt/lists/*





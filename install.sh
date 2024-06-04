#!/bin/sh

if [ -z "$USER" ]; then
    USER=$(id -un)
fi
mkdir /workspaces/.codespaces/.persistedshare/dotfiles
mv /workspaces/.codespaces/.persistedshare/dotfiles /workspaces/dotfiles/.dotfiles/bash
mv /workspaces/.codespaces/.persistedshare/dotfiles /workspaces/dotfiles/.dotfiles/github
mv /workspaces/.codespaces/.persistedshare/dotfiles /workspaces/dotfiles/.dotfiles/markdown
mv /workspaces/.codespaces/.persistedshare/dotfiles /workspaces/dotfiles/.dotfiles/vscode

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





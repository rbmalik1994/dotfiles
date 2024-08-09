#!/bin/sh
sudo apt install fzf
sudo apt-get install fonts-powerline


zshrc() {
    echo "==========================================================="
    echo "             cloning zsh-autosuggestions                   "
    echo "-----------------------------------------------------------"                    
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo "==========================================================="
    echo "                 cloning zsh-zsh-nvm                       "
    echo "-----------------------------------------------------------"                 
    git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
    echo "==========================================================="
    echo "                  Import zshrc                             "
    echo "-----------------------------------------------------------"
    cat .zshrc > $HOME/.zshrc
    cat .zshrc > $HOME/.zshrc
}

zshrc 
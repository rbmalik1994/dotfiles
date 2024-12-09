#!/bin/sh
sudo apt install fzf
sudo apt-get install fonts-powerline
sudo 


font(){

    echo "Installing fonts."
    FONT_DIR="$HOME/.fonts"
    git clone https://github.com/powerline/fonts.git $FONT_DIR --depth=1
    cd $FONT_DIR
    ./install.sh
}


update(){
    echo "update package "
    sudo apt-get update
    sudo apt-get -y install --no-install-recommends apt-utils dialog 2>$1
    sudo apt-get updgrade
    sudo apt-get install shellcheck
    echo " Cleanup "
    sudo apt-get autoremove -y
    sudo rm -rf /var/lib/apt/lists/*. 

}

zshrc() {
    echo "==========================================================="
    echo "             cloning zsh-autosuggestions                   "
    echo "-----------------------------------------------------------"                    
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo "==========================================================="
    echo "                   cloning zsh-nvm                         "
    echo "-----------------------------------------------------------"                 
    git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
    echo "==========================================================="
    echo "           cloning zsh-zsh-Syntax Highlight                "
    echo "-----------------------------------------------------------"                 
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "==========================================================="
    echo "                  Import zshrc                             "
    echo "-----------------------------------------------------------"
    echo 
    cat .zshrc > $HOME/.zshrc
}

#calling 

zshrc 
update
font 
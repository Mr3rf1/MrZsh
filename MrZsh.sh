#!/bin/bash

ZSH_CUSTOM=~/.oh-my-zsh

# Detect package manager
if [ -x "$(command -v apt-get)" ]; then
    PM="apt-get"
    IC="install"
    UC="update"
elif [ -x "$(command -v yum)" ]; then
    PM="yum"
    IC="install"
    UC="update"
elif [ -x "$(command -v dnf)" ]; then
    PM="dnf"
    IC="install"
    UC="update"
elif [ -x "$(command -v pkg)" ]; then
    PM="pkg"
    IC="install"
    UC="update"
elif [ -x "$(command -v pacman)" ]; then
    PM="pacman"
    IC="-S"
    UC="-Syy"
else
    echo -e "\u001b[33m[\u001b[31m!\u001b[33m]\u001b[31m Package mananger not found.\033[0m" >&2
    exit 1
fi


# Update repos
sudo $PM $UC

# Install curl
if ! [ -x "$(command -v curl)" ]; then
    sudo $PM $IC -y curl
fi

# Install git
if ! [ -x "$(command -v git)" ]; then
    sudo $PM $IC -y git
fi

# Install Zsh
if ! [ -x "$(command -v zsh)" ]; then
    sudo $PM $IC -y zsh
else
    echo -e "\u001b[33m[\u001b[31m!\u001b[33m]\u001b[31m Zsh is already installed.\033[0m"
fi


# Install neofech
if ! [ -x "$(command -v neofetch)" ]; then
    sudo $PM $IC -y neofetch
else
    echo -e "\u001b[33m[\u001b[31m!\u001b[33m]\u001b[31m neofetch is already installed.\033[0m"
fi


# Install Oh-my-zsh
if ! [ -e ~/.oh-my-zsh ]; then
    echo exit | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # echo out=$($ZSH_CUSTOM) && echo $out && exit | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # out=$(echo echo '$ZSH_CUSTOM' | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)")
else
    echo -e "\u001b[33m[\u001b[31m!\u001b[33m]\u001b[31m Oh-my-zsh is already installed.\033[0m"
fi


# Install zsh-autosuggestions
if ! [ -e $ZSH_CUSTOM/plugins/zsh-autosuggestions ]; then
    sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
else
    echo -e "\u001b[33m[\u001b[31m!\u001b[33m]\u001b[31m Zsh-autosuggestions is already installed.\033[0m"
fi

# Install zsh-syntax-highlighting
if ! [ -e $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ]; then
    sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
else
    echo -e "\u001b[33m[\u001b[31m!\u001b[33m]\u001b[31m Zsh-syntax-highlighting is already installed.\033[0m"
fi


# Update .zshrc file
if [ -e ~/.zshrc ]; then
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="bira"/g' ~/.zshrc
    if ! grep -Fxq "neofetch" ~/.zshrc;then
        echo "neofetch" >> ~/.zshrc
    fi
    echo -e "\u001b[33m[\u001b[32m!\u001b[33m]\u001b[32m Plugins configed in .zshrc\033[0m"
else
    echo 'ZSH_THEME="bira"\nplugins=(git zsh-autosuggestions zsh-syntax-highlighting)\nneofetch' > ~/.zshrc
    echo -e "\u001b[33m[\u001b[32m!\u001b[33m]\u001b[32m A new .zshrc created.\033[0m"
fi

# Set Zsh as default shell
sudo chsh -s $(which zsh)

# Go to zsh :)
zsh

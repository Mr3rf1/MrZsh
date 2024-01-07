#!/bin/bash

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
elif [ -x "$(command -v pacman)" ]; then
    PM="pacman"
    IC="-S"
    UC="-Syy"
else
    echo -e "\u001b[33m[\u001b[31m!\u001b[33m]\u001b[31m Package mananger not found." >&2
    exit 1
fi

# Install Zsh
sudo $PM $UC
if ! [ -x "$(command -v zsh)" ]; then
    sudo $PM $IC -y zsh
else
    echo -e "\u001b[33m[\u001b[31m!\u001b[33m]\u001b[31m Zsh is already installed."
fi


# Install Oh-my-zsh
if ! [ -d ~/.oh-my-zsh ]; then
    echo exit | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo -e "\u001b[33m[\u001b[31m!\u001b[33m]\u001b[31m Oh-my-zsh is already installed."
fi


# Install zsh-autosuggestions
if ! [ -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]; then
    sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
else
    echo -e "\u001b[33m[\u001b[31m!\u001b[33m]\u001b[31m Zsh-autosuggestions is already installed."
fi

# Install zsh-syntax-highlighting
if ! [ -d $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ]; then
    sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
else
    echo -e "\u001b[33m[\u001b[31m!\u001b[33m]\u001b[31m Zsh-syntax-highlighting is already installed."
fi

# Update .zshrc file
if [ -f ~/.zshrc ]; then
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="bira"/g' ~/.zshrc
    echo -e "\u001b[33m[\u001b[32m!\u001b[33m]\u001b[32m Plugins configed in .zshrc"
else
    echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' > ~/.zshrc
fi

# Set Zsh as default shell
sudo chsh -s $(which zsh)

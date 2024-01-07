#!/bin/bash

# Detect package manager
if [ -x "$(command -v apt-get)" ]; then
    PM="apt-get"
    IC="install"
elif [ -x "$(command -v yum)" ]; then
    PM="yum"
    IC="install"
elif [ -x "$(command -v dnf)" ]; then
    PM="dnf"
    IC="install"
elif [ -x "$(command -v pacman)" ]; then
    PM="pacman"
    IC="-S"
else
    echo "Error: Package manager not found." >&2
    exit 1
fi

# Install Zsh
sudo $PM update
if [ ! -x "$(command -v zsh)" ]; then
    sudo $PM $IC -y zsh
fi

# Install Oh-my-zsh
if [ ! -d "~/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi



# Install zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Install zsh-syntax-highlighting
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Update .zshrc file
if [ -f "~/.zshrc" ]; then
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
    sed -i 's/ZSH_THEME="rubbyrussell/ZSH_THEME="bira"/g' ~/.zshrc
else
    echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' > ~/.zshrc
fi

# Set Zsh as default shell
chsh -s $(which zsh)

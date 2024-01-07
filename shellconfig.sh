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
if [ -x "$(command -v zsh)" ]; then
    sudo $PM $IC -y zsh
fi

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ -f "~/.zshrc" ]; then
    touch ~/.zshrc
fi

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Update .zshrc file
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

# Set Zsh as default shell
chsh -s $(which zsh)

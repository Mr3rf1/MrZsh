#!/bin/bash

# Detect package manager
if [ -x "$(command -v apt-get)" ]; then
    PM="apt-get"
elif [ -x "$(command -v yum)" ]; then
    PM="yum"
elif [ -x "$(command -v dnf)" ]; then
    PM="dnf"
else
    echo "Error: Package manager not found." >&2
    exit 1
fi

# Install Zsh
sudo $PM update
sudo $PM install -y zsh

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Update .zshrc file
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

# Set Zsh as default shell
chsh -s $(which zsh)

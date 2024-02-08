#!/bin/bash

# Prompt user for confirmation
read -p "Do you want to proceed with the setup? [Y/n]: " choice
choice=${choice:-Y}

if [[ $choice =~ ^[Yy]$ ]]; then
    # Update and upgrade packages
    apt update
    apt upgrade -y
    
    # Install necessary packages
    apt install -y neovim wget openssh nodejs-lts python3 ripgrep clang zsh

    # Set up git configuration
    git config --global user.name "Haroon Saifi"
    git config --global user.email "haroonsaifi2001@gmail.com"

    # Install Oh My Zsh
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    # Install Powerlevel10k theme for Oh My Zsh
    cd ~/.oh-my-zsh/custom/themes/
    git clone https://github.com/romkatv/powerlevel10k

    # Generate SSH key
    ssh-keygen -t rsa -b 4096 -C "haroonsaifi2001@gmail.com" -N "" -f ~/.ssh/id_rsa

    # Start SSH agent and add SSH key
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa

    # Copy configuration files
    cd ~/repo/MyDotFiles || exit
    cp -r .config ~
    cp -r .termux ~
    cp -r .zshenv ~
    cp -r .zsh_history ~
    cp -r .zshrc ~
    cp -r .p10k.zsh ~

    # Set up Zsh plugins
    cd ~ || exit
    mkdir -p ~/.zsh
    cd ~/.zsh || exit
    git clone https://github.com/zsh-users/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-history-substring-search

    # Display SSH public key
    cat ~/.ssh/id_rsa.pub
else
    echo "Setup aborted."
fi

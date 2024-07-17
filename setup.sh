#!/bin/bash

# Packages and NPM packages
PACKAGES="tmux neovim zsh curl wget unzip openssh ripgrep nodejs clang python rust tree file git"
NPM_PACKAGES="eslint prettier typescript diagnostic-languageserver eslint_d angular-language-server @angular/cli vscode-langservers-extracted"
ZSH_PLUGINS="zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search"
current_dir=$(pwd)


# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install packages on various Linux distributions
install_packages_linux() {
    if command_exists apt; then
        sudo apt update && sudo apt upgrade -y
        sudo apt install -y $PACKAGES
    elif command_exists pacman; then
        sudo pacman -Syu --noconfirm
        sudo pacman -S --noconfirm --needed $PACKAGES
    elif command_exists dnf; then
        sudo dnf update && sudo dnf upgrade -y
        sudo dnf install -y $PACKAGES
    elif command_exists yum; then
        sudo yum update && sudo yum upgrade -y
        sudo yum install -y $PACKAGES
    elif command_exists zypper; then
        sudo zypper update && sudo zypper upgrade -y
        sudo zypper install -y $PACKAGES
    elif command_exists apk; then
        sudo apk update && sudo apk upgrade -y
        sudo apk add $PACKAGES
    else
        echo "Unknown package manager."
        exit 1
    fi
    sudo npm install -g $NPM_PACKAGES
    if [ "$(basename $(pwd))" == "MyDotFiles" ]; then
        git pull
    else
        git clone https://github.com/HaroonSaifi17/MyDotFiles.git
    fi
}

# Function to install packages on Termux (Android)
install_packages_termux() {
    pkg update && pkg upgrade -y
    pkg install -y $PACKAGES root-repo
    npm install -g $NPM_PACKAGES

    if [ "$(basename $(pwd))" == "MyDotFiles"]; then
        git pull
    elif [ -d "$HOME/MyDotFiles" ]; then
        cd "$HOME/MyDotFiles"
        git pull
        $current_dir = "$HOME/MyDotFiles"
    else
        git clone https://github.com/HaroonSaifi17/MyDotFiles.git ~/MyDotFiles
        $current_dir = "$HOME/MyDotFiles"
    fi
}

# Function to configure Git
configure_git() {
    read -p "Enter your name: " UserName
    git config --global user.name "$UserName"
    read -p "Enter your email: " UserEmail
    git config --global user.email "$UserEmail"
}

# Function to set up ZSH and plugins
setup_zsh() {
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
    mkdir -p ~/.zsh
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
}

# Function to set up SSH keys
setup_ssh() {
    ssh-keygen -t rsa -b 4096 -C "$UserEmail" -N "" -f ~/.ssh/id_rsa
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    echo "Your SSH public key is:"
    cat ~/.ssh/id_rsa.pub
}

# Function to set up symbolic links
setup_symlinks() {
    ln -sf "$current_dir/.zshrc" ~/.zshrc
    ln -sf "$current_dir/.p10k.zsh" ~/.p10k.zsh
    ln -sf "$current_dir/.zshenv" ~/.zshenv
    ln -sf "$current_dir/.zsh_history" ~/.zsh_history
    ln -sf "$current_dir/.tmux.conf" ~/.tmux.conf
    ln -sf "$current_dir/knownhosts" ~/.ssh/known_hosts
    mkdir -p ~/.config
    ln -sf "$current_dir/nvim" ~/.config/nvim
    if [ "$1" == "termux" ]; then
        rm -rf ~/.termux
        ln -sf "$current_dir/.termux" ~/.termux
        chmod 777 "$current_dir/termux-exec_2.0.0_aarch64.deb"
        pkg install -y "$current_dir/termux-exec_2.0.0_aarch64.deb"
    fi
}

# Main script execution
read -p "Do you want to proceed with the setup? (y/n): " choice
choice=${choice:-y}

if [[ $choice == [Yy]* ]]; then
    echo "Which device are you using?"
    echo "1. Android (Termux)"
    echo "2. Linux"
    read -p "Enter the number of your choice: " device_choice

    case "$device_choice" in
        1)
            echo "Setting up for Termux (Android)..."
            install_packages_termux
            ;;
        2)
            echo "Setting up for Linux..."
            install_packages_linux
            echo "require 'linux'" > "$current_dir/.config/nvim/init.lua" 
            echo "PATH=/home/haroon/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/win32yank-x64" > "$current_dir/.zshenv"
            ;;
        *)
            echo "Unknown choice."
            exit 1
            ;;
    esac

    configure_git
    setup_zsh
    setup_symlinks "${device_choice == 1 ? 'termux' : 'linux'}"
    setup_ssh
    
    git remote set-url origin git@github.com:HaroonSaifi17/MyDotFiles.git

    echo "Setup complete! Please restart your terminal. Copy the SSH public key above and add it to your GitHub account."
else
    echo "Exiting..."
fi


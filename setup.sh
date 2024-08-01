#!/bin/bash

PACKAGES="tmux neovim zsh curl wget unzip openssh ripgrep nodejs-lts clang python rust tree file git fastfetch rust-analyzer golang lua-language-server htop gh"
NPM_PACKAGES="eslint prettier typescript-language-server typescript eslint_d emmet-ls @angular/language-server @angular/cli vscode-langservers-extracted"
ZSH_PLUGINS="zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search"
current_dir=$(pwd)

install_packages_termux() {
    pkg update && pkg upgrade -y
    pkg install -y $PACKAGES
    npm install -g $NPM_PACKAGES

    if [ "$(basename $(pwd))" == "MyDotFiles" ]; then
        git pull
    elif [ -d "$HOME/MyDotFiles" ]; then
        cd "$HOME/MyDotFiles"
        git pull
        current_dir="$HOME/MyDotFiles"
    else
        git clone https://github.com/HaroonSaifi17/MyDotFiles.git ~/MyDotFiles
        current_dir="$HOME/MyDotFiles"
    fi

    chmod +x "$current_dir/termux-exec_2.0.0_aarch64.deb"
    pkg install -y "$current_dir/termux-exec_2.0.0_aarch64.deb"
}

configure_git() {
    read -p "Enter your name: " name
    git config --global user.name "$name"
    read -p "Enter your email: " UserEmail
    git config --global user.email "$UserEmail"
}

setup_zsh() {
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
    mkdir -p ~/.zsh
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
    chsh -s zsh
}

setup_ssh() {
    ssh-keygen -t rsa -b 4096 -C "$UserEmail" -N "" -f ~/.ssh/id_rsa
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    echo "Your SSH public key is:"
    cat ~/.ssh/id_rsa.pub
}

setup_symlinks() {
    ln -sf "$current_dir/.zshrc" ~/.zshrc
    ln -sf "$current_dir/.p10k.zsh" ~/.p10k.zsh
    ln -sf "$current_dir/.zsh_history" ~/.zsh_history
    ln -sf "$current_dir/.tmux.conf" ~/.tmux.conf
    ln -sf "$current_dir/known_hosts" ~/.ssh/known_hosts
    mkdir -p ~/.config
    rm -rf ~/.config/nvim
    ln -sf "$current_dir/nvim" ~/.config/nvim
    rm -rf ~/.termux
    ln -sf "$current_dir/.termux" ~/.termux
}

read -p "Do you want to proceed with the setup? (y/n): " choice
choice=${choice:-y}

if [[ $choice == [Yy]* ]]; then
    read -p "Would you like to install packages? (y/n): " choice
    choice=${choice:-y}
    if [[ $choice == [Yy]* ]]; then
        install_packages_termux
    fi
    read -p "Would you like to configure git? (y/n): " choice
    choice=${choice:-y}
    if [[ $choice == [Yy]* ]]; then
        configure_git
    fi
    read -p "Would you like to setup zsh? (y/n): " choice
    choice=${choice:-y}
    if [[ $choice == [Yy]* ]]; then
        setup_zsh
    fi
    read -p "Would you like to setup symlinks? (y/n): " choice
    choice=${choice:-y}
    if [[ $choice == [Yy]* ]]; then
        setup_symlinks
    fi
    read -p "Would you like to setup ssh? (y/n): " choice
    choice=${choice:-y}
    if [[ $choice == [Yy]* ]]; then
        setup_ssh
    fi

    git remote set-url origin git@github.com:HaroonSaifi17/MyDotFiles.git

    echo "Setup complete! Please restart your terminal. Copy the SSH public key above and add it to your GitHub account."
else
    echo "Exiting..."
fi


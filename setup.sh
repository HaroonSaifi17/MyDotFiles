#!/bin/bash

read -p "Do you want to proceed with the setup? (y/n): " choice
choice=${choice:-y}

if [[ $choice == [Yy]* ]]; then
    echo "Setting up the environment..."

    pkg update
    pkg upgrade -y 
    pkg install -y tmux neovim zsh curl wget unzip openssh ripgrep nodejs clang python rust tree file root-repo

    npm install -g eslint prettier typescript diagnostic-languageserver eslint_d angular-language-server @angular/cli vscode-langservers-extracted

    echo "Git configuration..."
    read -p "Enter your name: " UserName
    git config --global user.name "$UserName"

    read -p "Enter your email: " UserEmail
    git config --global user.email "$UserEmail"

    echo "Setting up zsh..."
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    echo "Setting up powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

    echo "Setting up zsh-autosuggestions..."
    mkdir -p ~/.zsh
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

    echo "Setting up zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

    echo "Setting up zsh-history-substring-search..."
    git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search

    echo "Setting up SSH keys..."
    ssh-keygen -t rsa -b 4096 -C "$UserEmail" -N "" -f ~/.ssh/id_rsa
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa

    echo "Setting up symbolic links..."
    current_dir=$(pwd)
    ln -sf "$current_dir/.zshrc" ~/.zshrc
    ln -sf "$current_dir/.p10k.zsh" ~/.p10k.zsh
    ln -sf "$current_dir/.zshenv" ~/.zshenv
    ln -sf "$current_dir/.zsh_history" ~/.zsh_history
    ln -sf "$current_dir/.tmux.conf" ~/.tmux.conf
    mkdir -p ~/.config
    ln -sf "$current_dir/nvim" ~/.config/nvim
    rm -rf ~/.termux 
    ln -sf "$current_dir/.termux" ~/.termux

    chmod 777 "$current_dir/termux-exec_2.0.0_aarch64.deb"
    pkg install -y "$current_dir/termux-exec_2.0.0_aarch64.deb"

    git remote set-url origin git@github.com:HaroonSaifi17/MyDotFiles.git

    echo "Setup complete! Please restart your terminal."

    echo "Your SSH public key is:"
    cat ~/.ssh/id_rsa.pub
else
    echo "Exiting..."
fi

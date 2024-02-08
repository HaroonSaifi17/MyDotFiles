cd ~/
apt update
apt upgrade
apt install wget neovim openssh nodejs-lts python3 ripgrep clang zsh
git config --global user.name "Haroon Saifi"
git config --global user.email "haroonsaifi2001@gmail.com"
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
cd ~/.oh-my-zsh/custom/themes/ 
git clone https://github.com/romkatv/powerlevel10k
ssh-keygen -t rsa -b 4096 -C "haroonsaifi2001@gmail.com"
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
cd ~/repo/MyDotFiles
cp -r .config ~
cp -r .termux ~
cp -r .zshenv ~
cp -r .zsh_history ~
cp -r .zshrc ~ 
cp -r .p10k.zsh ~
cd ~/
mkdir ~/.zsh
cd ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search
cat ~/.ssh/id_rsa.pub

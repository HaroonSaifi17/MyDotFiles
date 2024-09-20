ssh-keygen -t rsa -b 4096 -C "haroonsaifi2001@gmail.com" -N "" -f ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
echo "Your SSH public key is:"
cat ~/.ssh/id_rsa.pub

#!/bin/bash

set -xe

apt update && apt install -y apt-transport-https ca-certificates git vim neovim curl
apt upgrade #ca-certificates
git config --global http.sslVerify "false"
update-ca-certificates
curl -k https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
echo insecure >> ~/.curlrc
source ~/.bashrc
export NVM_DIR="$HOME/.nvm"
source $NVM_DIR/nvm.sh
nvm install --lts
NVM_NODEJS_ORG_MIRROR=http://nodejs.org/dist
source ~/.bashrc

mkdir -p ~/.vim/autoload
mkdir -p ~/.config/nvim

wget --no-check-certificate -P ~/.vim/autoload https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp init.vim ~/.config/nvim
cp .vimrc ~

vim +'PlugInstall --sync' +qa



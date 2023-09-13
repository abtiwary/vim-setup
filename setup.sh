#!/bin/bash

set -xe

home_dir="~"
if [ -n "$1" ]
then
    home_dir=$1
    echo "home dir is ${home_dir}"
else
    echo "please pass in the path to the home directory as the first argument"
    exit
fi

sudo apt update && sudo apt install -y apt-transport-https ca-certificates git vim neovim curl
sudo apt upgrade #ca-certificates
git config --global http.sslVerify "false"
sudo update-ca-certificates

echo insecure >> ${home_dir}/.curlrc
curl -k https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ${home_dir}/.bashrc
export NVM_DIR="$HOME/.nvm"
source $NVM_DIR/nvm.sh
nvm install --lts
NVM_NODEJS_ORG_MIRROR=http://nodejs.org/dist
source ${home_dir}/.bashrc

mkdir -p ${home_dir}/.vim/autoload
mkdir -p ${home_dir}/.config/nvim

wget --no-check-certificate -P ${home_dir}/.vim/autoload https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp init.vim ${home_dir}/.config/nvim
cp .vimrc ${home_dir}

vim +'PlugInstall --sync' +qa

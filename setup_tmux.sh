#!/bin/bash

set -xe

home_dir="~"
if [ -n "$1" ]
then
    home_dir=$1
    echo "home dir is ${home_dir}"
else
    echo "using ${home_dir} (default) as the home directory"
fi

sudo apt update && sudo apt install -y apt-transport-https ca-certificates tmux

mkdir -p ${home_dir}/.config/tmux

cp ./base16-* ${home_dir}/.config/tmux/ 
cp .tmux.conf ${home_dir}/ 


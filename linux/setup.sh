#!/bin/bash

# this script is a bash-script to setup a linux system (current arch)
. ./data/a_pkg_ws.sh
. ./data/apm_pkg.sh

distro=$(cat /etc/os-release | grep ID | cut -d= -f2);


# update system
sudo pacman -Syyu
sudo pacman -S ${apkgws[*]}

#configuration
echo "connecting to remote server via ssh";
echo "Enter your ssh username:";
read username;
echo "enter server:";
read remoteServer;

connectionString="$username@$remoteServer";

mkdir /tmp/remoteData
scp -r $connectionString/priv/* /tmp/remoteData/;

cp /tmp/remoteData/ssh/{config,id_rsa,id_rsa.pub} ~/.ssh/
cp /tmp/remoteData/zsh/zshrc ~/.zshrc
chsh -s $(which zsh)
sudo cp /tmp/remoteData/linux/hosts /etc/hosts

if [ ! -d ~/.config/i3 ]
then
    mkdir -p ~/.config/i3
    cp /tmp/remoteData/i3/config.new ~/.config/i3/config
fi

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

for pack in ${apmpkg[*]}; do
  apm install $pack;
done

# Symbolic links
sudo ln -s /usr/bin/xdg-open /usr/locl/bin/op

if [ -d /tmp/remoteData/ ]
then
  sudo rm -rf /tmp/remoteData
fi

reboot

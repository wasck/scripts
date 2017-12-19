#!/bin/bash
echo "you are using debian..."

syspkg=(sudo htop zip unzip sshfs zsh tree vim wget curl git build-essential
        openjdk-9-jdk
      );

# update system
sudo apt update && sudo apt upgrade -y
sudo apt install ${syspkg[*]}

addgroup --system sshusers
adduser wschik
addgroup wschik sshusers
addgroup wschik sudo

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

echo "connecting to remote server via ssh";
echo "Enter your ssh username:";
read username;
echo "enter server name/ip:";
read remoteServer;

connectionString="$username@$remoteServer";

mkdir /tmp/remoteData
scp -r $connectionString/priv/* /tmp/remoteData/;

cp /tmp/remoteData/zsh/zshrc ~/.zshrc
chsh -s $(which zsh)
sudo cp /tmp/remoteData/linux/hosts /etc/hosts

su wschik

cp /tmp/remoteData/ssh/* ~/.ssh/
cp /tmp/remoteData/zsh/zshrc ~/.zshrc
chsh -s $(which zsh)
sudo cp /tmp/remoteData/linux/hosts /etc/hosts

exit

#!/bin/bash

# this script is a bash-script to setup a linux system (current arch)
#. ./data/a_pkg_ws.sh
#. ./data/apm_pkg.sh
. ./os/client_manjaro.sh

distro=$(cat /etc/os-release | grep ID | cut -d= -f2);

if [ $distro == "manjaro" ]
then
  echo "You are using manjaro..."
  setupManjaroClient
elif [ $distro == "ubuntu"]
then
  echo "you are using ubuntu"
  setupUbuntuClient()
elif [ $distro == "debian" ]
then
  echo "you are using debian..."
  setupDebianServer()
fi

#configuration
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

cp /tmp/remoteData/ssh/* ~/.ssh/
cp /tmp/remoteData/zsh/zshrc ~/.zshrc
chsh -s $(which zsh)
sudo cp /tmp/remoteData/linux/hosts /etc/hosts


# Symbolic links
sudo ln -s /usr/bin/xdg-open /usr/local/bin/op

if [ -d /tmp/remoteData/ ]
then
  sudo rm -rf /tmp/remoteData
fi


echo "Do you want to reboot (y/n)?"
read rbt

if [ $rbt == "y" ]
then
  echo "done. Rebooting..."
  reboot
else
  echo "done."
fi

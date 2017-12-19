#!/bin/bash

echo "You are using manjaro..."

syspkg=(htop sshfs zsh tree vim wget curl atom git i3 dmenu feh base-devel
        devtools jdk8-openjdk jdk9-openjdk
);

apmpkg=(emmet linter linter-eslint linter-scss-lint highlight-selected
  minimap-highlight-selected file-icons pigments minimap autocomplete-paths
  autoclose-html simple-drag-drop-text atom-latex pdf-view ide-java
);


# update system
sudo pacman -Syyu
sudo pacman -S ${syspkg[*]}

if [ ! -d ~/.config/i3 ]
then
    mkdir -p ~/.config/i3
    cp /tmp/remoteData/i3/config.new ~/.config/i3/config
fi

for pack in ${apmpkg[*]}; do
  apm install $pack;
done

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

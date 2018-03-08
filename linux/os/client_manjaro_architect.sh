#!/bin/bash

syspkg=(
        htop sshfs zsh tree vim
        wget curl atom keepassxc thunderbird
        firefox docker docker-compose docker-machine
        ranger
);

apmpkg=(
  emmet linter linter-eslint linter-scss-lint highlight-selected
  minimap-highlight-selected file-icons pigments minimap autocomplete-paths
  autoclose-html simple-drag-drop-text atom-latex pdf-view
  docker language-docker
);

sudo sed s/'^#Color'/Color/ /etc/pacman.conf -i
sudo sed s/'^#TotalDownload'/TotalDownload/ /etc/pacman.conf -i
sudo sed '40aILoveCandy' /etc/pacman.conf -i

sudo sed s/'interval = 5'/"interval = 1"/ /etc/i3status.conf -i

sudo pacman -Syyu
sudo pacman -S ${syspkg[*]}

for pack in ${apmpkg[*]}; do
  apm install $pack;
done

#configuration
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Symbolic links
sudo ln -s /usr/bin/xdg-open /usr/local/bin/op

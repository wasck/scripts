#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install packages
sudo apt install vim zsh htop git wget curl

# Prepare zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;

cp zshrc ~/.zshrc;

echo "done!";
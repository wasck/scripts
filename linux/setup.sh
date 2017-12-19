#!/bin/bash

# this script is a bash-script to setup a linux system (current arch)

distro=$(cat /etc/os-release | grep "^ID" | cut -d= -f2);

if [ $distro == "manjaro" ]; then
  ./os/client_manjaro.sh

elif [ $distro == "debian" ]; then
  ./os/server_debian.sh

fi

if [ -d /tmp/remoteData/ ]
then
  sudo rm -rf /tmp/remoteData
fi


echo "Do you want to reboot (y/n)?"
read rbt

if [ $rbt == "y" ] || [ $rbt == "j" ]; then
  echo "done. Rebooting..."
  reboot
else
  echo "done."
fi

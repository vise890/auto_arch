#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> creating default user ($DEFAULT_USER)"
useradd -m -G wheel -s /bin/bash $DEFAULT_USER
echo "$DEFAULT_USER:$DEFAULT_PASSWORD" | chpasswd

echo "==> setting up default user for ssh access"
DEFAULT_HOME="/home/$DEFAULT_USER"
mkdir -p $DEFAULT_HOME/.ssh
cp /auto_arch/authorized_keys $DEFAULT_HOME/.ssh/authorized_keys

chown -R $DEFAULT_USER: $DEFAULT_HOME/.ssh
chmod -R 700 $DEFAULT_HOME/.ssh
chmod 600 $DEFAULT_HOME/.ssh/*

echo "==> giving $DEFAULT_USER some pimpin dotfiles"
cd $DEFAULT_HOME
sudo -u $DEFAULT_USER git clone https://github.com/vise890/dotfiles
cd ./dotfiles
sudo -u $DEFAULT_USER ./install.sh
cd

echo "==> changing ${DEFAULT_USER}'s shell to zsh"
chsh -s /bin/zsh $DEFAULT_USER

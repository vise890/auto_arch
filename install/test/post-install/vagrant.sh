#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> creating vagrant user"
useradd -m vagrant
echo "vagrant:vagrant" | chpasswd
echo "vagrant ALL = (ALL)  NOPASSWD:SETENV: ALL" > /etc/sudoers.d/vagrant
chmod 440 /etc/sudoers.d/vagrant

echo "==> configure network so that vagrant doesn't choke"
# mask udev's rule file for the default policy
# i.e., disable predictable naming rules
# i.e., use old, unpredictable kernel names
# http://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/
# https://wiki.archlinux.org/index.php/Network#Device_names
# FIXME: make vagrant use the predictable name instead (is it even possible?)
ln -fs /dev/null /etc/udev/rules.d/80-net-setup-link.rules
systemctl reenable dhcpcd

echo "==> setup vagrant user for ssh access"
VAGRANT_HOME="/home/vagrant"
mkdir -p $VAGRANT_HOME/.ssh
VAGRANT_INSECURE_KEY_URL="https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub"
curl --output $VAGRANT_HOME/.ssh/authorized_keys --location $VAGRANT_INSECURE_KEY_URL

chown -R vagrant: $VAGRANT_HOME/.ssh
chmod -R 700 $VAGRANT_HOME/.ssh
chmod 600 $VAGRANT_HOME/.ssh/*


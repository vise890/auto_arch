#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# FIXME: is there a way to pass some env to the chroot instead?
source '/auto_arch/0_variables.sh'


echo "==> setting locale to $LOCALE"
LOCALE_GEN="${LOCALE} UTF-8"
sed -i "s/#${LOCALE_GEN}/${LOCALE_GEN}/" /etc/locale.gen
locale-gen
echo "LANG=\"$LOCALE\"" > /etc/locale.conf


echo "==> setting up time (localtime = $LOCALTIME)"
hwclock --systohc --utc
ln -s "/usr/share/zoneinfo/$LOCALTIME" /etc/localtime

echo "==> Sync time with NTP"
timedatectl set-ntp true


echo "==> installing bootloader"
bootctl install

echo "
title    Arch Linux
linux    /vmlinuz-linux
initrd   /initramfs-linux.img
options  root=$ROOT_PARTITION rw
" > "/boot/loader/entries/arch.conf"

echo "
default    arch
timeout    3
" > "/boot/loader/loader.conf"


echo "==> setting up network"
# TODO: this needs to be able to do wifi
systemctl enable dhcpcd


echo "==> setting hostname to $NEW_HOSTNAME"
echo "$NEW_HOSTNAME" > /etc/hostname
echo "127.0.1.1	${NEW_HOSTNAME}.localdomain	$NEW_HOSTNAME" >> /etc/hosts


echo '==> setting root password to the value of $DEFAULT_PASSWORD'
echo "root:$DEFAULT_PASSWORD" | chpasswd

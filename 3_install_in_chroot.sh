#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# FIXME: is there a way to pass some env to the chroot instead?
source '/auto_arch/variables.sh'

echo "==> setting hostname to $NEW_HOSTNAME"
echo "$NEW_HOSTNAME" > /etc/hostname
HOSTS_LINE='127.0.0.1 localhost.localdomain localhost'
sed -i "s/${HOSTS_LINE}/${HOSTS_LINE}    ${NEW_HOSTNAME}/" /etc/hosts

echo "==> setting up time (localtime = $LOCALTIME)"
hwclock --systohc --utc
ln -s "/usr/share/zoneinfo/$LOCALTIME" /etc/localtime

echo "==> installing ntp for keeping the system clock in sync"
pacman -S --noconfirm --needed ntp
systemctl enable ntpd

echo "==> setting locale to $LOCALE"
LOCALE_GEN="${LOCALE} UTF-8"
sed -i "s/#${LOCALE_GEN}/${LOCALE_GEN}/" /etc/locale.gen
locale-gen
echo "LANG=\"$LOCALE\"" > /etc/locale.conf

echo "==> setting root password to $DEFAULT_PASSWORD"
echo "root:$DEFAULT_PASSWORD" | chpasswd

echo "==> allow all members of wheel to be sudoers"
pacman -S --noconfirm sudo
sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers
visudo -c # abort if /etc/sudoers became corrupted

echo "==> setting up network"
systemctl enable dhcpcd

echo "==> installing bootloader"
pacman -S --noconfirm dosfstools efibootmgr gummiboot

gummiboot --path=/boot install

echo "
title    Arch Linux
linux    /vmlinuz-linux
initrd   /initramfs-linux.img
options  root=$ROOT_PARTITION rw
" > "/boot/loader/entries/arch.conf"

echo "
default    arch
timeout    5
" > "/boot/loader/loader.conf"


#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source './variables.sh'

echo '==> preparing the disk'
# TODO: add partition labels
sgdisk --zap-all "$DISK"
sgdisk --clear "$DISK"

sgdisk --new=1:0:+512MM "$DISK" --typecode=1:ef00 # 512MB efi system partition -> /boot
sgdisk --new=2:0:+20GB "$DISK" # 20GB root -> /
sgdisk --new=3:0:0 "$DISK" # (rest) home -> /home

mkfs.fat -F32 "${DISK}1"
mkfs.ext4 "${DISK}2"
mkfs.ext4 "${DISK}3"

echo "==> mounting partitions.. on $ROOT_MOUNTPOINT"

mount "${DISK}2" "$ROOT_MOUNTPOINT"
mkdir -p "${ROOT_MOUNTPOINT}/boot" "${ROOT_MOUNTPOINT}/home"

mount "${DISK}1" "${ROOT_MOUNTPOINT}/boot"
mount "${DISK}3" "${ROOT_MOUNTPOINT}/home"



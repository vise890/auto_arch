#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source './variables.sh'

echo '==> preparing the disk'
umount -R "$MAIN_MOUNTPOINT" || true
swapoff "$SWAP_PARTITION" || true

sgdisk --zap-all "$DISK"

sgdisk --new=1:0:+"${ROOT_SIZE}M" "$DISK"

sgdisk --new=2:0:+"${SWAP_SIZE}M" "$DISK"

sgdisk --new=3:0:0 "$DISK"

echo "==> PARTITION TREE CREATED"

echo "==> Initializing partitions..."

mkfs.ext4 "$ROOT_PARTITION"

mkswap "$SWAP_PARTITION"
echo "==> turning on swap" 
swapon "$SWAP_PARTITION"

mkfs.ext4 "$HOME_PARTITION"

echo "==> mounting $ROOT_PARTITION on $MAIN_MOUNTPOINT"
mount "$ROOT_PARTITION" "$MAIN_MOUNTPOINT"

echo "==> mounting $HOME_PARTITION on $HOME_MOUNTPOINT"
mkdir "$HOME_MOUNTPOINT"
mount "$HOME_PARTITION" "$HOME_MOUNTPOINT"

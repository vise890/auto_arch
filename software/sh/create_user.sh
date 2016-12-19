#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

default_user=$1
default_password=$2

echo "==> creating default user ($default_user)"
sudo useradd -m -G wheel -s /bin/bash "$default_user"
echo "$default_user:$default_password" | sudo chpasswd


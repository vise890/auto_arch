#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> creating default user ($DEFAULT_USER)"
sudo useradd -m -G wheel -s /bin/bash "$DEFAULT_USER"
echo "$DEFAULT_USER:$DEFAULT_PASSWORD" | sudo chpasswd


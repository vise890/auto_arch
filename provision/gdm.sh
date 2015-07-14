set -euo pipefail
IFS=$'\n\t'

echo '==> Installing and enabling GDM'
pacman -S --noconfirm --needed gdm
systemctl enable gdm


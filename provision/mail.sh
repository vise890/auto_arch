#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo '==> Installing email tools'
sudo pacman -S --noconfirm --needed \
    isync notmuch \
    mutt notmuch-mutt

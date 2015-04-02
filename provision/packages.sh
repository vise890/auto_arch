#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing software i like"
pacman -S --noconfirm --needed \
    tree ranger autojump stow wget \
    openssh \
    git the_silver_searcher \

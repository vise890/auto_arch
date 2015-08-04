#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing software i like"
pacman -S --noconfirm --needed \
    tree ranger autojump cloc \
    htop glances python-bottle hddtemp python-matplotlib \
    stow \
    wget weechat lynx \
    pass \
    openssh \
    git the_silver_searcher \

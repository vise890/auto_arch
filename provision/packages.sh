#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing software i like"
pacman -S --noconfirm --needed \
    tree ranger autojump cloc \
    vim vim-spell-en neovim \
    libqalculate \
    htop glances python-bottle hddtemp python-matplotlib \
    git tig \
    the_silver_searcher \
    httpie \
    aria2 rtorrent \
    stow \
    wget weechat lynx \
    pass \
    openssh

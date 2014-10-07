#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing software i like"
pacman -S --noconfirm --needed zsh \
    tree autojump lesspipe stow wget \
    weechat tmux ranger \
    gnupg openssh \
    git colordiff the_silver_searcher ctags \
    ruby python lua go\

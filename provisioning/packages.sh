#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing ntp for keeping the system clock in sync"
pacman -S --noconfirm --needed ntp
systemctl enable ntpd

echo "==> installing software i like"
pacman -S --noconfirm --needed zsh \
    tree autojump stow wget \
    weechat tmux ranger \
    gnupg openssh pass \
    git colordiff the_silver_searcher ctags \
    python lua \

# TODO: install packer => install leiningen ; pacman -S clojure

#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing software i like"
sudo pacman -S --noconfirm --needed \
    zsh zsh-syntax-highlighting \
    autojump tree ranger \
    the_silver_searcher ripgrep \
    vim vim-spell-en neovim python-neovim python2-neovim \
    git tig \
    pygmentize cloc \
    httpie jq \
    aria2 wget lynx \
    rsync \
    pass openssh \
    bpython \
    shellcheck \
    htop glances \
    stow \
    mutt isync msmtp msmtp-mta \
    asciinema \
    alsa-utils


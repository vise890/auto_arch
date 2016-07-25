#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing software i like"
sudo pacman -S --noconfirm --needed \
    zsh zsh-syntax-highlighting \
    autojump \
    tree ranger rsync \
    bpython \
    vim vim-spell-en neovim python-neovim python2-neovim \
    mutt isync msmtp msmtp-mta \
    shellcheck \
    htop \
    git tig \
    the_silver_searcher \
    pygmentize cloc \
    httpie jq \
    stow \
    aria2 \
    wget lynx \
    pass \
    openssh \
    alsa-utils

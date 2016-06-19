#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing software i like"
sudo pacman -S --noconfirm --needed \
    zsh autojump \
    tree ranger rsync \
    bpython \
    vim vim-spell-en neovim python-neovim \
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

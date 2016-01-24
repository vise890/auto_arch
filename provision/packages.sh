#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==> installing software i like"
pacman -S --noconfirm --needed \
    zsh autojump thefuck \
    tree ranger \
    libqalculate \

    vim vim-spell-en neovim python-neovim \
    shellcheck \

    htop glances python-bottle hddtemp python-matplotlib \

    git tig \
    the_silver_searcher \
    pygmentize cloc \

    httpie jq \

    stow \

    aria2 rtorrent \
    wget weechat lynx \

    pass \
    openssh

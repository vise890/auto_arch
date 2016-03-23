#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source './0_variables.sh'

# dry run of dirmngr to be able to import keys
dirmngr < /dev/null

./provision/optimize_pacman_mirrorlist.sh
./provision/upgrade-system.sh

./provision/cli_packages.sh
./provision/ruby.sh
./provision/ntp.sh
#./provision/haskell.sh
./provision/vim.sh
./provision/aur.sh

#./provision/infinality.sh
#./provision/powerline_fonts.sh

./provision/gtk.sh
#./provision/gui_packages.sh

#./provision/networkmanager.sh
#./provision/gnome.sh
#./provision/gdm.sh

./provision/lightdm.sh
./provision/i3.sh
./provision/thunar.sh

./provision/sudo.sh # install sudo and allow users in group 'wheel' to be sudoers

# FIXME: all this default user stuff could be implemented with e.g. sudo -u $DEFAULT_USER ./provision/zsh-shell.sh
./provision/default-user-create.sh # NOTE: it will be a sudoer

./provision/default-user-dotfiles.sh
./provision/default-user-zsh-shell.sh

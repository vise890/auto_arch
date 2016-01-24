#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

source './0_variables.sh'

# dry run of dirmngr to be able to import keys
dirmngr < /dev/null

./provision/optimize_pacman_mirrorlist.sh
./provision/upgrade-system.sh
./provision/packages.sh
./provision/ruby.sh
./provision/ntp.sh
#./provision/haskell.sh
./provision/vim.sh
./provision/aur.sh

#./provision/infinality.sh
#./provision/powerline_fonts.sh

./provision/gtk.sh

#./provision/gnome.sh
#./provision/gdm.sh

./provision/lightdm.sh
./provision/i3.sh
./provision/thunar.sh

./provision/sudo.sh # install sudo and allow users in group 'wheel' to be sudoers
./provision/create-default-user.sh # NOTE: it will be a sudoer
#./provision/ssh-for-default-user.sh # ssh access for default user, needs authorized keys to be present

./provision/dotfiles.sh
./provision/zsh-as-default.sh

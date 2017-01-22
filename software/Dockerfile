FROM pritunl/archlinux:latest

ADD . /tmp/auto_arch

WORKDIR /tmp/auto_arch

# Scripts
RUN ./sh/sudo.sh
RUN ./sh/optimize_pacman_mirrorlist.sh
RUN ./sh/upgrade_system.sh

# Packages
RUN pacman -S --noconfirm --needed $(cat ./pkgs/*)

CMD ["uname", "-a"]

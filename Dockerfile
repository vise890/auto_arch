FROM pritunl/archlinux:latest

ADD . /tmp/auto_arch

WORKDIR /tmp/auto_arch

RUN ./4_provision.sh

CMD ["uname", "-a"]

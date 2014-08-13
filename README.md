# Auto Arch
A somewhat automated installation of Arch Linux

Split out from [renegade arch](https://github.com/vise890/renegade_arch)

## Usage
```bash
# ... after booting into the live arch cd..
$ pacman -S --no-confirm git
$ git clone https://github.com/vise890/auto_arch /auto_arch
$ cd /auto_arch
$ vim authorized_keys                                         # add yours. or empty the file
$ curl -O authorized_keys www.public-key.org/you/id_rsa.pub   # whatever
$ ./install.sh
$ ./provision.sh
```
Sort of. This thing may still explode. I've only tested this with packer.

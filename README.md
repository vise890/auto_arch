# Auto Arch

A reasonably automated installation of Arch Linux.

Auto Arch is the trusty companion of [renegade
arch](https://github.com/vise890/renegade_arch). It contains all the scripts that
allow the magic over there to happen. If you are looking to just get a provisioned arch
linux VM, you should check `renegade_arch` out.

On the other hand, if you just want to install a fresh copy of Arch Linux, Auto
Arch provides more flexibility.


## Disclaimer

This is mainly to help the development of `renegade_arch`. I also use this for
new Arch Linux installs. But you should kind of know what you're doing or at
least read the scripts.


## Usage

### 1 - Boot and get Auto Arch

1. Boot into a live Arch Linux instance (from CD/USB/.iso/etc.);

2. Get Auto Arch

   ```bash
   $ pacman -S --no-confirm git
   $ git clone https://github.com/vise890/auto_arch /auto_arch
   $ cd /auto_arch
   ```
3. Check/modify `./variables.sh`;


### 2 - Prepare the disk

There are two ways to prepare the disk:

1. Through the script: `./prepare-disk.sh`
2. Manually (however you like). But, you must mount your root partition onto
   the `$MAIN_MOUNTPOINT` specified in `./variables.sh`.

   You could do this with parted/gparted from another OS, whatever.

   But, for example, for a 2 partition setup:
   ```bash
   # zap partition table
   sgdisk --zap-all /dev/sda

   # Partition the disk
   # sgdisk --new=<partition_number>:<start>:<end>
   # <start>, <end> can be 0 for first/last available block
   sgdisk --new=1:0:+15G /dev/sda  # /dev/sda1: 15G partition (root)
   sgdisk --new=2:0:0 /dev/sda     # /dev/sda2: take up the rest (home)

   # Make the file systems
   mkfs.btrfs -L root /dev/sda1
   mkfs.btrfs -L home /dev/sda2

   # Mount the partitions
   # NB: assuming that you left $MAIN_MOUNTPOINT set to `/mnt`
   mkdir -p /mnt/home
   mount /dev/sda1 /mnt
   mount /dev/sda2 /mnt/home
   ```

The choice is yours.


### 2 - Install the base system

1. Install the base system by running `./install.sh`.
   - When this is done, the system will go to reboot.
2. Login with `root:$DEFAULT_PASSWORD`


### 3 - Provision

1. edit `./provision.sh`: add remove steps you want
   - **NOTE** The `provisioning/create-default-user.sh` needs you to add your
     public GPG key to `./authorized_keys`; (**FIXME**: this needs to go)
2. run it: `./provision.sh`


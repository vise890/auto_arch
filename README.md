# Auto Arch

A reasonably automated installation of Arch Linux.

## Usage

### 1 - Boot and get Auto Arch

1. Boot into a live Arch Linux instance (from CD/USB);

2. Get Auto Arch:

   ```bash
   $ pacman -S --no-confirm git
   $ git clone https://github.com/vise890/auto_arch /auto_arch
   $ cd /auto_arch
   ```
3. **Check/modify `./variables.sh`.**


### 2 - Prepare the disk

By running the script: `./prepare_disk.sh`

**OR**

Manually, see [Appendix A](#appendix-a).

The choice is yours.


### 3 - Install the base system

1. Install the base system by running `./install.sh`;
   - When this is done, the system will go for reboot;
2. Login with `root:$DEFAULT_PASSWORD`.


### 4 - Provision

1. edit `./provision.sh`: add remove steps you want;
   - **NOTE** `./provisioning/ssh-for-default-user.sh` needs you to put your
     public GPG key to `./authorized_keys` (or at least to remove mine from
     it...);
2. run it: `./provision.sh`.


## Appendix A

If you want control about the disk set up, you can do it manually, but, you
must mount your root partition onto the `$MAIN_MOUNTPOINT` specified in
`./variables.sh`.

You could partition the disk with parted/gparted from another OS, a Live CD or
whatever.

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

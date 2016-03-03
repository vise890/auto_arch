# Auto Arch

A reasonably automated installation of Arch Linux.

## Usage

### 0 - Boot and get Auto Arch

1. Boot into a live Arch Linux instance (from CD/USB);

2. Get Auto Arch:

   ```bash
   $ wget https://github.com/vise890/auto_arch/archive/master.tar.gz
   $ tar xzf master.tar.gz
   $ cd master-auto_arch
   ```
3. **Check/modify `./0_variables.sh`.**


### 1 - Prepare the disk

By running the script: `./1_prepare_disk.sh`

**OR**

Manually, see [Appendix A](#appendix-a).

The choice is yours.


### 3 - Install the base system

1. Install the base system by running `./2_bootstrap.sh`;
   - When this is done, the system will go for reboot;
2. Login with `root:$DEFAULT_PASSWORD`.


### 4 - Provision

1. edit `./4_provision.sh`: add/remove steps you want;
   - **NOTE** `./provisioning/ssh-for-default-user.sh` needs you to put your
     public GPG key to `./authorized_keys` (or at least to remove mine from
     it...);
2. run it: `./4_provision.sh`.


## Appendix A

If you want control about the disk set up, you can do it manually, but, you
must mount your root partition onto the `$ROOT_MOUNTPOINT` defined in
`./0_variables.sh`.

You could partition the disk with parted/gparted from another OS, a Live CD or
whatever.

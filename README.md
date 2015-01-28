# Auto Arch

A pretty automated installation of Arch Linux.

Split out from [renegade arch](https://github.com/vise890/renegade_arch)


## Usage

1. Boot into the live Arch cd;

2. install `git`, clone repo and `cd` into it:

   ```bash
   $ pacman -S --no-confirm git
   $ git clone https://github.com/vise890/auto_arch /auto_arch
   $ cd /auto_arch
   ```

3. Add your public GPG key to `./authorized_keys` or empty it; (**FIXME**: this
   needs to go)

4. Check/modify `./variables.sh`;

5. Prepare the disk:
   - through the script: `./prepare-disk.sh`
   - **OR** manually, **BUT** mount your root partition (and eventual others
     after that) on the `$MAIN_MOUNTPOINT` specified in `./variables.sh`

6. Install the base system by running `./install.sh`

7. Provision with basics: `./provision.sh`

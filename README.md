# Tips for an Archlinux installation

> Here are some brief notes about a basic `archlinux` installation. These notes
> are to be read together with the installation guide, and they reflect my
> *personal* preferences.

## Partitions

I create 4 partitions: 

-  root partition (about 25G), 
-  boot partition (200M), 
-  swap partition (about twice the ram), and 
-  home partition (rest of memory).  

> **Caution!** Use `primary` partition for 4th partition, not `extended` which
> is default in `fdisc`. 

After that, `format` and `mount` the partitions:

``` bash
mkswap /dev/sda3
swapon /dev/sda3
mkfs.ext4 /dev/sda1 
mkfs.ext4 /dev/sda2 
mkfs.ext4 /dev/sda4 
mount /dev/sda1 /mnt
mkdir /mnt/home
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot
mount /dev/sda4 /mnt/home
```

Choose a couple close mirrors and `pacstrap` only `base` to save time.
After change root, install `reflector`, generate `mirrorlist` by 

``` bash
reflector --verbose --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

and install `base-devel`, `vim`, `git`, `networkmanager`, `grub`.

Change `kernel` to `lts` (keep the linux `kernel` as a backup) and install headers: 

``` bash
pacman -S linux-headers linux-lts linux-lts-headers 
grub-mkconfig -o /boot/grub/grub.cfg
reboot
```


## Network manager

To avoid manually configurating networks after reboot, install `networkmanager`:

``` bash
pacman -S networkmanager
```

and enable it:

``` bash
systemctl enable NetworkManager
```

After reboot internet works out of the box. 


## User add

Add a new user 

``` bash
useradd -m -g wheel myname
```

and give him root privileges by running `visudo` and uncommenting wheel group
(optionally pass the `NOPASSWD` option).


## Prettify console

Install `terminus` fonts:

``` bash
pacman -S terminus-font
```

To use `terminus` fonts in console do:

``` bash
echo "FONT=ter-114n" >> /etc/vconsole.conf
```


## Changing default shell

`zsh` is a much more powerful shell than bash. To list all installed shells,
run:

``` bash
$ chsh -l
```

and to set one as default for your user do:

``` bash
$ chsh -s full-path-to-shell
```

where `full-path-to-shell` is the full path as given by `chsh -l`.

If you now log out and log in again, you will be greeted by the new shell. 


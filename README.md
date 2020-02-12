# Tips for an `archlinux` installation

> Here are some brief notes about a basic `archlinux` installation and the
> semi-automatised procedure I use after that to set up my system. These notes
> are to be read *together* with the [installation
> guide](https://wiki.archlinux.org/index.php/Installation_guide) , and they
> reflect my *personal* preferences.


## Partitions

For this notes I assume that we deal with an UEFI system.

I create 4 partitions: 

1.  EFI partition (512M),  
2.  root partition (about 30G),  
3.  swap partition (about the same size as RAM),  
4.  home partition (rest of memory).

Remember to change the partition type of the EFI partition to "EFI". After
that, `format` and `mount` the partitions:

``` bash
mkswap /dev/sda3
swapon /dev/sda3
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda4
mount /dev/sda2 /mnt
mkdir /mnt/{home,efi}
mount /dev/sda1 /mnt/efi
mount /dev/sda4 /mnt/home
```


## Installation

Choose a couple close mirrors and `pacstrap`:

``` bash
pacstrap /mnt base linux linux-firmware base-devel gvim git zsh networkmanager grub efibootmgr intel-ucode
```

I pass `grub` and related packages in `pacstrap` step to avoid extra `pacman`
commands latter.

While chrooted remember to enable `networkmanager`:

``` bash
systemctl enable NetworkManager
```

Follow the rest of the installation guide.


# Post Installation

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

You may also wish to change `kernel` to `lts` (keep the linux `kernel` as
a backup) and install headers: 

``` bash
pacman -S linux-headers linux-lts linux-lts-headers 
grub-mkconfig -o /boot/grub/grub.cfg
reboot
```


# Next steps

After the above, download the arch-install repository from github, run the
script and have fun!

Remember to add trim support if you have a SSD drive!


# Extra tips

## Connecting Android devices

After having installed the packages `android-file-transfer` and `android-udev`,
uncomment `user_allow_other` in `/etc/fuse.conf` and mount your android device
with

```
$ mkdir ~/my-device
$ sudo aft-mtp-mount -o allow_other ~/my-device
```

Unmount the device with

```
$ sudo fusermount -u ~/my-device
```

## Default browser

To make qutebrowser your default GUI browser, run in a terminal

```
$ xdg-mime default org.qutebrowser.qutebrowser.desktop x-scheme-handler/{https,http}
```


<!-- Compile to html using `pandoc -f markdown -t html5 --template=GitHub.html5
README.md -s -o README.html`, using the template from
https://github.com/tajmone/pandoc-goodies/blob/master/templates/html5/github/GitHub.html5
-->

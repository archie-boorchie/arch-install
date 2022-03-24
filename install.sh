#!/bin/bash

######################################################
#                                                    #
#   This is a script that can be used to create      #
#   a user's environment, after a basic arch linux   #
#   installation and the creation of a sudo user.    #
#   Check README files for more details.             #
#                                                    #
#   Created by:                                      #
#   Lampros Trifyllis [archie-boorchie @ GitHub]     #
#                                                    #
######################################################

# We start by creating a list of the packages we want to install.
# base and base-devel are assumed to be installed during basic installation.

# For packages that can be found in the official repositories, only the name is
# provided. If the package is to be installed from the AUR repository, we use
# the nomenclature [AUR]package-name, to distinguish the package and later
# install it correctly. 


# Create a log file
log=~/logfile-install.txt
touch $log
printf "Log file for the script install.sh -- " > $log
date >> $log


packages=(
#
### Base packages and kernels
base # Minimal package set to define a basic Arch Linux installation
base-devel # Group with basic developer packages
linux # The Linux kernel and modules
linux-headers #	Header files and scripts for building modules for Linux kernel
linux-lts # The Linux-lts kernel and modules
linux-lts-headers # Header files and scripts for building modules for Linux-lts kernel
#
### X.org 
xorg # Install the X package group
xorg-xinit # X.Org initialisation program
xorg-xinput # Small commandline tool to configure devices
xf86-input-libinput # Generic input driver for the X.Org server based on libinput
xdotool # Command-line X11 automation tool
# also install a driver for intel processor (change for other processor)
xf86-video-intel # X.org Intel i810/i830/i915/945G/G965+ video drivers
#
### CPU governor
cpupower # Linux kernel tool to examine and tune power saving related features of your processor
#
### Keyboard
xcape # Configure modifier keys to act as other keys when pressed and released on their own	
#
### Hide cursor
unclutter # A small program for hiding the mouse cursor
#
### Clipboard utilities
xclip # A lightweight, command-line based interface to the clipboard
clipmenu # Clipboard management using dmenu
clipnotify # Polling-free clipboard notifier
#
### Secure shell 
openssh # Premier connectivity tool for remote login with the SSH protocol
#
### Screen utils
xorg-xrandr # Primitive command line interface to RandR extension
arandr # Provide a simple visual front end for XRandR 1.2.
xorg-xbacklight # RandR-based backlight control application
#
### Sound management
alsa-utils # An alternative implementation of Linux sound support
pulseaudio # A featureful, general-purpose sound server
pasystray # PulseAudio system tray (a replacement for padevchooser)
portaudio # A free, cross-platform, open source, audio I/O library
#
### Sound recording
audacity # A program that lets you manipulate digital audio waveforms
#
### Terminal 
alacritty # A cross-platform, GPU-accelerated terminal emulator
tmux # A terminal multiplexer	
zsh # A very advanced and programmable command interpreter (shell) for UNIX
zsh-autosuggestions	# Fish-like autosuggestions for zsh
zsh-completions	# Additional completion definitions for Zsh
zsh-history-substring-search # ZSH port of Fish history search (up arrow)
zsh-lovers # A collection of tips, tricks and examples for the Z shell
zsh-syntax-highlighting	# Fish shell like syntax highlighting for Zsh
#
### Composite manager
# picom # X compositor that may fix tearing issues
picom-ibhagwan-git # iBhagwan's compton|picom fork (X compositor) with dual_kawase blur and rounded corners
#
### Python and python modules 
python2 # A high-level scripting language
python # Next generation of the python high-level scripting language
ipython # An enhanced Interactive Python shell
python-scipy # SciPy is open-source software for mathematics, science, and engineering
python-matplotlib # A python plotting library, making publication quality plots
python-numpy # Scientific tools for Python
python-lxml # Python3 binding for the libxml2 and libxslt libraries
python-beautifulsoup4 # A Python HTML/XML parser designed for quick turnaround projects like screen-scraping
python-adblock # Brave's adblock library in Python
#
### Fortran
gcc-fortran	# Fortran front-end for GCC
#
### C compiler
gcc # The GNU Compiler Collection - C and C++ frontends	
#
### Packages for pacman
reflector # A script to retrieve and filter the latest Pacman mirror list
pacman-contrib # Contributed scripts and tools for pacman systems 
pkgfile # A pacman .files metadata explorer
pkgstats # Submit a list of installed packages to the Arch Linux project
[AUR]informant # An Arch Linux News reader and pacman hook
#
### More utilities
acpi # Client for battery, power, and thermal readings
tree # A directory listing program displaying a depth indented list of files
fd # Simple, fast and user-friendly alternative to find
mlocate # Merging locate/updatedb implementation
htop # Interactive process viewer
[AUR]gotop # A terminal based graphical activity monitor inspired by gtop and vtop
dosfstools # DOS filesystem utilities
ntfs-3g # NTFS filesystem driver and utilities
usbutils # USB Device Utilities
qtqr # Qt GUI that makes easy creating and decoding QR codes
# 
### Archive management
p7zip # Command-line file archiver with high compression ratio
unrar # The RAR uncompression program
unzip # For extracting and viewing files in .zip archives
zip # Compressor/archiver for creating and modifying zipfiles
xarchiver # GTK+ frontend to various command line archivers
# 
### Display manager
# I do not use a display manager
# 
### Window manager
i3 # Install the i3 group - i3gaps is the default
[AUR]i3-battery-popup-git # A script that shows messages to the user when the battery is almost empty
#
### Status bar
[AUR]polybar # A fast and easy-to-use status bar
#
### Desctop notification deamon
dunst # Customizable and lightweight notification-daemon
# 
### Version control
git # The fast distributed version control system
#
### Text editors
gvim # Vi Improved, a highly configurable, improved version of the vi text editor (with advanced features, such as a GUI)
# code # The Open Source build of Visual Studio Code (vscode) editor
#
### ebooks, pdf viewers etc
zathura # Minimalistic document viewer
zathura-cb # Adds comic book support to zathura
zathura-djvu # DjVu support for Zathura
zathura-pdf-mupdf # EPUB, PDF and XPS support based on MuPDF
# zathura-pdf-poppler # Adds pdf support to zathura by using the poppler engine
zathura-ps # PostScript support
djvulibre # Suite to create, manipulate and view DjVu documents
evince # Document viewer (PDF, Postscript, djvu, tiff, dvi, XPS, SyncTex support with gedit, comics books (cbr,cbz,cb7 and cbt))
bookworm # A simple user centric eBook reader which displays multiple eBooks formats uniformly
pdfpc # pdf presentation console
pdftk # Command-line tool for working with PDFs
pdfarranger # Helps merge or split PDF documents and rotate, crop and rearrange pages
diffpdf # Diffing pdf files visually or textually
calibre # Ebook management application
mcomix # A user-friendly, customizable image viewer specifically designed to handle comic books
fanficfare # A tool for downloading fanfiction to eBook formats
#
### Code highlighter
highlight # Fast and flexible source code highlighter (CLI version)
#
### LaTeX
texlive-most # TeX Live group
# texlive-langextra # TeX Live - Bundle of all extra language support
texlive-langgreek # TeX Live - Fonts and support for typesetting Greek
biber # A Unicode-capable BibTeX replacement for biblatex users
ctags # needed for vimtex
#
### Utils for markup languages
pandoc # Conversion between markup formats
#
### Spell checkers
hunspell # Spell checker and morphological analyzer library and program
hunspell-en_GB # GB English hunspell dictionaries
hunspell-en_US # US English hunspell dictionaries
hunspell-el # Greek hunspell dictionary
#
### Fonts
adobe-source-code-pro-fonts # Monospaced font family for user interface and coding environments
adobe-source-sans-pro-fonts # Sans serif font family for user interface environments
adobe-source-serif-pro-fonts # Serif typeface for setting text. Designed to complement Source Sans Pro
terminus-font # Monospace bitmap font (for X11 and console) 
ttf-dejavu # Font family based on the Bitstream Vera Fonts with a wider range of characters
noto-fonts # Google Noto TTF fonts
ttf-font-awesome # Iconic font designed for Bootstrap
awesome-terminal-fonts # fonts/icons for powerlines
[AUR]ttf-material-design-icons-extended # An extended Material Design icons font by the guys over at materialdesignicons.com (I use the Arch symbol from this font)
#
### Icon themes
[AUR]numix-circle-icon-theme-git # Circle icon theme from the Numix project
adwaita-icon-theme # GNOME standard icons
#
### Office apps 
libreoffice-fresh # with new program enhancements
# 
### File managers
ranger # A simple, vim-like file manager
thunar # Modern file manager for Xfce
thunar-archive-plugin # Create and extract archives in Thunar
thunar-media-tags-plugin # Adds special features for media files to the Thunar File Manager
gvfs # Virtual filesystem implementation for GIO
tumbler # D-Bus service for applications to request thumbnails
ffmpegthumbnailer # Lightweight video thumbnailer that can be used by file managers
#
### Printing
cups # the CUPS Printing System - daemon package
nss-mdns # glibc plugin providing host name resolution via mDNS
#
### Launcher
rofi # A window switcher, application launcher and dmenu replacement
dmenu # Generic menu for X
#
### Internet browsers
qutebrowser # A keyboard-driven, vim-like browser based on PyQt5
firefox # Standalone web browser from mozilla.org
flashplugin # flash plugin for firefox
chromium # A web browser built for speed, simplicity, and security
chromium-widevine # A browser plugin designed for the viewing of premium video content
elinks # An advanced and well-established feature-rich text mode web browser
w3m # Text-based Web browser as well as pager
#
### Social apps
signal-desktop-bin # Private messaging from your desktop
#
### Tor
tor # Anonymizing overlay network
nyx # Command-line status monitor for tor
[AUR]tor-browser # Tor Browser Bundle: anonymous browsing using Firefox and Tor (international PKGBUILD)
#
### Network utilities 
networkmanager # Network connection manager and user applications
nm-connection-editor # NetworkManager GUI connection editor and widgets
network-manager-applet # Applet for managing network connections
wireless_tools # Tools allowing to manipulate the Wireless Extensions
# dnsmasq # Lightweight, easy to configure DNS forwarder and DHCP server
curl # An URL retrieval utility and library
wget # Network utility to retrieve files from the Web
speedtest-cli # Command line interface for testing internet bandwidth using speedtest.net
#
### Bluetooth
bluez # Daemons for the bluetooth protocol stack
bluez-utils	# Development and debugging utilities for the bluetooth protocol stack
blueman # GTK+ Bluetooth Manager
pulseaudio-bluetooth # Bluetooth support for PulseAudio
#
### Vpn 
openvpn # An easy-to-use, robust and highly configurable VPN (Virtual Private Network)
networkmanager-openvpn # NetworkManager VPN plugin for OpenVPN
#
### Youtube utilities 
youtube-dl # A small command-line program to download videos from YouTube.com and a few more sites
youtube-viewer # Command line utility for viewing YouTube videos
#
### Torrent client
transmission-gtk # Fast, easy, and free BitTorrent client (GTK+ GUI)
#
### Irc client 
irssi # Modular text mode IRC client with Perl scripting
#
### Scientific software 
calc # Arbitrary precision console calculator
stellarium # A stellarium with great graphics and a nice database of sky-objects
# celestia # Real-time space simulation
# units # Converts between different units
# kalzium # Periodic Table of Elements
# marble # Desktop Globe
## add more map tools and meteorology tools
#
### Data syncing
rsync # A file transfer program to keep remote files in sync
[AUR]dropbox # A free service that lets you bring your photos, docs, and videos anywhere and share them easily
# [AUR]owncloud # A cloud server to store your files centrally on a hardware controlled by you
# 
### Android devices
android-file-transfer # Android MTP client with minimalistic UI
android-udev # Udev rules to connect Android devices to your linux box
#
### Time management
calcurse # A text-based personal organizer
remind # A sophisticated calendar and alarm program
#
### Virtual machines
# virtualbox # Powerful x86 virtualization for enterprise as well as home use
# virtualbox-ext-vnc # VirtualBox VNC extension pack
# virtualbox-modules-arch # Virtualbox host kernel modules for Arch Kernel
# virtualbox-host-dkms # VirtualBox Host kernel modules sources
#
### Media players and tools
feh # Fast and light imlib2-based image viewer
imagemagick # An image viewing/manipulation program
mpv # A free, open source, and cross-platform media player
mplayer # Media player for Linux
subtitleeditor # A GTK+3 tool to edit subtitles for GNU/Linux/*BSD
mediainfo # Supplies technical and tag information about a video or audio file (CLI interface)
[AUR]stremio # A one-stop hub for video content aggregation (Movies, TV shows, series, live television or web channels)
[AUR]subliminal # Python library and CLI tool for searching and downloading subtitles
#
### Screen capturing
maim # Simple command line utility that takes screenshots (better than scrot)
fbgrab # A framebuffer screenshot grabber
screenkey # A screencast tool to display your keys inspired by Screenflick
simplescreenrecorder # A feature-rich screen recorder that supports X11 and OpenGL
#
### For fun
fortune-mod # The Fortune Cookie Program from BSD games
cowsay # Configurable talking cow (and a few other creatures)
cmatrix # A curses-based scrolling 'Matrix'-like screen
asciiquarium # An aquarium/sea animation in ASCII art
lolcat # A colourful alternative to cat 
figlet # A program for making large letters out of ordinary text
[AUR]tty-clock # Digital clock in ncurses
[AUR]bash-pipes # Pipes screensaver for bash
[AUR]oneko # A cat that chases around your cursor
#
### Tabletop RPGs
# [AUR]roll # A tool to roll a user-defined dice sequence and display the result
# [AUR]rolisteam # Virtual tabletop software. It helps you to manage tabletop role playing games with remote friends/players.
#
)


# Use reflector to optimise mirrorlist
read -p "Would you like to use reflector to optimise pacman's mirrorlist (Y/n)?  " yn
yn=${yn:-yes}
if [ $yn = "yes" -o $yn = "y" -o $yn = "YES" -o $yn = "Y" ]; then
    sudo pacman -S reflector --noconfirm --needed
    sudo reflector --verbose --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
    echo -ne "\nRefreshing package lists\n"
    sudo pacman -Syyu
fi


# install official repository packages
echo -ne "\nInstalling packages from official repositories\n"
for X in "${packages[@]}"
do
    if [[ $X != *"[AUR]"* ]]; then
	sudo pacman -S --noconfirm --needed $X >> $log
    fi
done

echo -ne "\nOfficial repository packages are ready\n"


# Create a GPG key
read -p "Generate a GPG key (y/N)?  " yn
yn=${yn:-no}
if [ $yn = "yes" -o $yn = "y" -o $yn = "YES" -o $yn = "Y" ]; then
    gpg --full-gen-key
fi


# Install pikaur to help with the AUR package management
if pacman -Qs pikaur > /dev/null ; then
    echo -ne "\npikaur is up to date"
else
    echo -ne "\nInstalling pikaur to help with the AUR package management\n"
    cd ~
    git clone https://aur.archlinux.org/pikaur.git
    cd pikaur
    makepkg -sic >> $log
    cd ~
    rm -rf pikaur
fi


# pikaur will now be used to manage the AUR packages
echo -ne "\nInstalling aur packages with pikaur\n"
for X in "${packages[@]}"
do
    if [[ $X == *"[AUR]"* ]]; then 
    Y="$(echo "$X" | sed 's/\[AUR\]//')"
    pikaur -S --noconfirm --needed "$Y" >> $log
    fi
done

echo -ne "\nAUR packages are installed\n"


# Cleaning orphans
echo -ne "Cleaning orphan packages from system.
Please check if you wish to keep some of the packages!\n\n"
sudo pacman -Rns $(pacman -Qtdq) >> $log


# Final step: manage dotfiles, create symlinks for them
read -p "Do you want to clone the archie-boorchie dotfiles repository from GitHub (Y/n)?  " yn
yn=${yn:-yes}
if [ $yn = "yes" -o $yn = "y" -o $yn = "YES" -o $yn = "Y" ]; then
    # check if dotfiles directory exists in ~
    if [ -d "dotfiles" ]; then
        echo -ne "\nError: a dotfiles directory already exists! Aborting...\n"
    else
        git clone https://github.com/archie-boorchie/dotfiles
    fi
fi

echo -ne "\nStarting script symlinks.sh\n"

sh ~/arch-install/symlinks.sh


# echo -ne "\nEnabling services\n"
#
# sh ~/arch-install/services.sh

echo -ne "\nSystem is now ready to use!\n"
echo -ne "The output of this script can be found at ~/logfile-install.txt.\n"
echo -ne "Please check the file for errors!\n"

echo -ne "\nExiting script install.sh\n"

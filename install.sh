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

packages=(
#
### X.org 
xorg # Install the X package group
xorg-xinit # X.Org initialisation program
xorg-xinput # Small commandline tool to configure devices
xf86-input-synaptics # Synaptics driver for notebook touchpads
xdotool # Command-line X11 automation tool
# you may also need an extra driver for intel
#xf86-video-intel # X.org Intel i810/i830/i915/945G/G965+ video drivers
#
### Keyboard
xcape # Configure modifier keys to act as other keys when pressed and released on their own	
#
### Hide cursor
[AUR]unclutter-xfixes-git # unclutter-xfixes is a rewrite of unclutter using the x11-xfixes extension
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
#
### Terminal 
termite # A simple VTE-based terminal
tmux # A terminal multiplexer	
zsh # A very advanced and programmable command interpreter (shell) for UNIX
zsh-syntax-highlighting	# Fish shell like syntax highlighting for Zsh
zsh-autosuggestions	# Fish-like autosuggestions for zsh
zsh-completions	# Additional completion definitions for Zsh
zsh-history-substring-search # ZSH port of Fish history search (up arrow)
zsh-lovers # A collection of tips, tricks and examples for the Z shell
#
### Composite manager
xcompmgr # Composite Window-effects manager for X.org
#
### Python and python modules 
python2 # Python v2. Needed many times for package management
python # Latest version of Python (currently v3)
python-matplotlib # A python plotting library, making publication quality plots
python-numpy # Scientific tools for Python
nmap # Utility for network discovery and security auditing
[AUR]python-nmap # A Python library which helps in using the nmap port scanner
#
### C compiler
gcc # The GNU Compiler Collection - C and C++ frontends	
#
### Packages for pacman
reflector # A script to retrieve and filter the latest Pacman mirror list
pacman-contrib # Contributed scripts and tools for pacman systems 
pkgfile # A pacman .files metadata explorer
#
### Core utilities
tree # A directory listing program displaying a depth indented list of files
fd # Simple, fast and user-friendly alternative to find
mlocate # Merging locate/updatedb implementation
htop # Interactive process viewer
lolcat # a colourful alternative to cat 
# 
### Archive management
atool # Script for managing file archives of various types
unzip # For extracting and viewing files in .zip archives
# 
### Display manager
# I do not use a display manager
# 
### Window manager
i3 # install the i3 group - i3gaps is the default
# additionally, to save an i3 session we need
perl-anyevent-i3
perl-json-xs
#
### Desctop notification deamon
dunst # Customizable and lightweight notification-daemon
# 
git # Git is used for aur packages, dotfile management etc
#
### Editors
# console
# main editor is vim - I use gvim package to get the +xterm_clipboard option for vim
gvim # Vi Improved, a highly configurable, improved version of the vi text editor (with advanced features, such as a GUI)
# gui
code # The Open Source build of Visual Studio Code (vscode) editor
#
### ebooks, pdf viewers etc
mupdf # Lightweight PDF and XPS viewer
# llpp # opengl accelerated pdf viewer based on mupdf
fbreader # An e-book reader for Linux
# something more mainstream? maybe evince or zathura
#
### LaTeX
texlive-most # includes TeX Live applications
texlive-langgreek # fonts and support for typesetting Greek
biber # a Unicode-capable BibTeX replacement for biblatex users
#
### Utils for markup languages
pandoc # Conversion between markup formats
#
### File managers
# console
ranger # A simple, vim-like file manager
# gui
thunar # Modern file manager for Xfce
# make thunar functional
thunar-archive-plugin # Create and extract archives in Thunar
thunar-media-tags-plugin # Adds special features for media files to the Thunar File Manager
thunar-volman # Automatic management of removeable devices in Thunar
#
### Printing
cups  # the CUPS Printing System - daemon package
print-manager # GUI-tool for managing print jobs and printers (KDE)
#
### Launcher
rofi
#
### Fonts
adobe-source-code-pro-fonts # Monospaced font family for user interface and coding environments
adobe-source-sans-pro-fonts # Sans serif font family for user interface environments
adobe-source-serif-pro-fonts # Serif typeface for setting text. Designed to complement Source Sans Pro
terminus-font # Monospace bitmap font (for X11 and console) 
ttf-dejavu
ttf-noto
ttf-font-awesome
awesome-terminal-fonts
[AUR]ttf-material-design-icons-git # Material Design Icons Web Font (I use the Arch symbol)
#
### Icon themes
adwaita-icon-theme
# 
### Internet browsers
# gui
qutebrowser # A keyboard-driven, vim-like browser based on PyQt5
firefox # Standalone web browser from mozilla.org
flashplugin # flash plugin for firefox
# console
elinks # An advanced and well-established feature-rich text mode web browser
w3m # Text-based Web browser as well as pager
#
### Tor 
tor # Anonymizing overlay network
arm # Terminal status monitor for Tor relays
[AUR]tor-browser # Tor Browser Bundle: anonymous browsing using Firefox and Tor (international PKGBUILD)
#
### Network utilities 
networkmanager # Network connection manager and user applications
nm-connection-editor # NetworkManager GUI connection editor and widgets
network-manager-applet # Applet for managing network connections
# dnsmasq # Lightweight, easy to configure DNS forwarder and DHCP server
curl # An URL retrieval utility and library
wget # Network utility to retrieve files from the Web
speedtest-cli # Command line interface for testing internet bandwidth using speedtest.net
#
### Vpn 
openvpn # An easy-to-use, robust and highly configurable VPN (Virtual Private Network)
networkmanager-openvpn # NetworkManager VPN plugin for OpenVPN
#
### Youtube utilities 
minitube # A native YouTube client in Qt. Watch YouTube videos without Flash Player
mps-youtube # Terminal based YouTube jukebox with playlist management
youtube-dl # A small command-line program to download videos from YouTube.com and a few more sites
youtube-viewer # Command line utility for viewing YouTube videos
#
### Irc client 
irssi # Modular text mode IRC client with Perl scripting
#
### Science 
calc # Arbitrary precision console calculator
stellarium # A stellarium with great graphics and a nice database of sky-objects
# celestia # Real-time space simulation
# units # Converts between different units
# kalzium # Periodic Table of Elements
# marble # Desktop Globe
## add more map tools and meteorology tools
#
### Office apps 
# libreoffice-fresh # with new program enhancements
# hunspell # for spell-checking
# hunspell-en # for english spell-checking
# hunspell-gr # for greek spell-checking
# 
### Data syncing
[AUR]dropbox # A free service that lets you bring your photos, docs, and videos anywhere and share them easily
# [AUR]owncloud # A cloud server to store your files centrally on a hardware controlled by you
#
### PDF utilities
[AUR]pdftk # pdftk is a simple tool for doing everyday things with PDF documents
[AUR]crop-pdf # command line tool to crop PDF files
diffpdf # Diffing pdf files visually or textually
#
### ebook utilities
[AUR]epubcheck # A tool to validate epub files
# calibre # Ebook management application
#
### Time management
calcurse # A text-based personal organizer
remind # A sophisticated calendar and alarm program
#
### Icons
numix-circle
#
### Virtual machines
virtualbox
#
### Media players
feh # Fast and light imlib2-based image viewer 
mplayer # Media player for Linux 
mpv # A free, open source, and cross-platform media player 
#
### Toolkits for image etc convertions and so on 
imagemagick # An image viewing/manipulation program
#
### Screen capturing
maim #  Simple command line utility that takes screenshots (better than scrot)
fbgrab # A framebuffer screenshot grabber
[AUR]screenkey # Show the keys you type on the screen
# add a screencast tool
#
### Presentation, multiscreen etc
pdfpc # pdf presentation console
mons # for easy multiscreen management
#
### For fun
fortune-mod
cowsay
cmatrix
#
### Tabletop RPGs
[AUR]roll # A tool to roll a user-defined dice sequence and display the result
# [AUR]rolisteam # Virtual tabletop software. It helps you to manage tabletop role playing games with remote friends/players.
#
)

# update and synchronise pacman
echo -ne "\nSynchronising pacman\n"
sudo pacman -Syy

# install official repository packages
echo -ne "\nInstalling packages from official repositories\n"
for X in "${packages[@]}"
do
    if [[ $X != *"[AUR]"* ]]; then
	sudo pacman -S --noconfirm --needed $X
    fi
done

echo -ne "\nOfficial repository packages are ready\n"


# Create a GPG key
read -p "Generate a GPG key before installing AUR packages (Y/n)?  " yn
yn=${yn:-yes}
if [ $yn = "yes" -o $yn = "y" -o $yn = "YES" -o $yn = "Y" ]; then
    gpg --full-gen-key
fi


# Install aurman to help with the AUR package management
echo -ne "\nInstalling aurman to help with the AUR package management\n"
cd ~
git clone https://aur.archlinux.org/aurman.git
cd aurman
makepkg -sic
cd ~
rm -rf aurman/

echo -ne "\naurman will now be used to manage the AUR packages\n"


# Now we download packages from [AUR]. aurman  will be used to install the rest
# aur packages.

# install aur packages
echo -ne "\nInstalling aur packages with aurman\n"
for X in "${packages[@]}"
do
    if [[ $X == *"[AUR]"* ]]; then 
    Y="$(echo "$X" | sed 's/\[AUR\]//')"
    aurman -S --needed "$Y"
    fi
done

echo -ne "\nAUR packages are ready\n"


# Final step: manage dotfiles, create symlinks for them
read -p "Do you want to clone the dotfiles repository from GitHub (Y/n)?  " yn
yn=${yn:-yes}
if [ $yn = "yes" -o $yn = "y" -o $yn = "YES" -o $yn = "Y" ]; then
    # check if dotfiles directory exists in ~
    if [ -d "dotfiles" ]; then
        echo -ne "\nError: a dotfiles directory already exists!\n"
    else
        git clone https://github.com/archie-boorchie/dotfiles
    fi
fi

echo -ne "\nCreating symlinks for the dotfiles\n"

sh ~/arch-install/symlinks.sh

echo -ne "\nSystem is now ready to use!\n"

echo -ne "\nExiting script install.sh\n"

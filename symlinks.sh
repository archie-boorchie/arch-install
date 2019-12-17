#!/bin/bash

# We will create a list for the links X -> /home/user/.X 
# and another for X -> ~/.config/X 

# Before the symlinks we have to delete all the configuration files and folders.
# We can overwite files with ln, but not folders...  For that, it suffices to
# delete each file/folder using "rm -rf ..." before creating the symlink.  This
# is done automatically by this script.

# Since this script is quite dangerous, we ask user for confirmation.
echo -ne "\nWARNING! This script may be harmfull for your system.\nDo you want to continue?\n\n\n"
read -p "Type 'yes' to continue.  " yn

if [ $yn = "yes" -o $yn = "y" -o $yn = "YES" -o $yn = "Y" ]; then
    echo "Running the script symlinks.sh ..."
    
    # dotfiles to /home/user/
    linkstohome=(
    aliases
    asoundrc
    bash_profile
    bashrc
    elinks
    functions
    latexmkrc
    tmux.conf
    vim
    vimrc
	xinitrc
	Xmodmap
    zprofile
    zshrc
    )
    
    # dotfiles to /home/user/.config
    linkstoconfig=(
    i3
    llpp.conf
    mcomix
    qutebrowser
    ranger
    rofi
    termite
    zathura
    )
    
    echo -ne "\ncreating softlinks to /home/user/\n"
    for X in "${linkstohome[@]}"
        do
        	rm -rf ~/.$X
        	ln -sfn ~/dotfiles/$X ~/.$X
        done

    echo -ne "\ncreating softlinks to /home/user/.config\n"
    mkdir -p ~/.config
    for X in "${linkstoconfig[@]}"
        do
        	rm -rf ~/.config/$X
        	ln -sfn ~/dotfiles/$X ~/.config/$X
        done
    echo -ne "\nYour configuration files are now loaded!\n"
else
    echo -ne "\nYou may run the script symlinks.sh manually at any time.\n"
fi

echo -ne "Exiting script symlinks.sh\n\n"

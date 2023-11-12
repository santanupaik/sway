#!/bin/bash

echo
read -p "Setup your Desktop Environment ? (y/n): " sans
case $sans in
    y|Y)
    	echo
        echo "Setup is Starting..."
        sleep 1s
    ;;
    n|N)
    	echo
        echo "Aborting..."
        echo
	exit 0
    ;;
    *)
    	echo
	echo "Invalid Choice."
	echo
	exit 0
    ;;
esac

echo
printf "Creating the initial .config Directory...                                  "
sleep 1s

mkdir -p /home/$USER/.config
mkdir -p /home/$USER/.local/share
printf "DONE\n"

printf "Copying the necessary config files to .config...                           "
sleep 1s
cp -r fuzzel /home/$USER/.config/
cp -r swappy /home/$USER/.config/
cp -r sway /home/$USER/.config/
cp -r swaylock /home/$USER/.config/
cp -r waybar /home/$USER/.config/
cp -r alacritty /home/$USER/.config/
cp -r Thunar /home/$USER/.config/
cp -r gedit /home/$USER/.local/share/
sync
printf "DONE\n"

printf "Creating rest of the necessary Directories...                              "
sleep 1s
mkdir -p /home/$USER/Pictures/Screenshots
mkdir /home/$USER/.local/share/icons
mkdir /home/$USER/Downloads
mkdir /home/$USER/Documents
mkdir /home/$USER/.icons
mkdir /home/$USER/.themes
printf "DONE\n"

printf "Extracting rest of the necessary files to their appropriate Directories... "
sleep 1s
bsdtar -xf wallpapers/wallpapers.zip -C /home/$USER/
bsdtar -xf themes/Tokyonight-Dark-B.zip -C /home/$USER/.themes/
bsdtar -xf icons/Cursor.zip -C /home/$USER/.icons/
bsdtar -xf icons/papirus-icon-theme-yaru-folders.tar.xz -C /home/$USER/.icons/ Papirus
sync
printf "DONE\n"

printf "Linking the necessary Directories...                                       "
sleep 1s
ln -sf /home/$USER/.icons/Papirus /home/$USER/.local/share/icons/
ln -sf /home/$USER/.themes/Tokyonight-Dark-B/gtk-4.0 /home/$USER/.config/
printf "DONE\n"

printf "Appending strings to their required config files...                        "
sleep 1s
cat bash_profile-append >> /home/$USER/.bash_profile
cat electron-append >> /home/$USER/.config/electron-flags.conf
cat electron-append >> /home/$USER/.config/code-flags.conf
printf "DONE\n"

echo
read -p "Script Succeeded. Remove Cloned Repository ? (y/n): " dans
case $dans in
    y|Y)
        rm -rf /home/$USER/userdots && echo "DONE"
    ;;
    n|N)
        echo "Keeping Cloned Repo Intact."
    ;;
    *)
        echo "Invalid Choice."
    ;;
esac

echo
echo "Note: A reboot is Recommended."
echo "Success !!"
echo

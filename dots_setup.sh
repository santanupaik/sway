#!/bin/bash
echo
read -p "Setup your Desktop Environment ? (y/n): " ans
case $ans in
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
printf "Done\n"
printf "Copying the necessary config files to .config...                           "
sleep 1s
cp -r fuzzel /home/$USER/.config/
cp -r swappy /home/$USER/.config/
cp -r sway /home/$USER/.config/
cp -r swaylock /home/$USER/.config/
cp -r waybar /home/$USER/.config/
cp -r alacritty /home/$USER/.config/
sync
printf "Done\n"
printf "Creating the rest of the necessary Directories...                          "
sleep 1s
mkdir -p /home/$USER/Pictures/Screenshots
mkdir -p /home/$USER/.local/share/icons
mkdir -p /home/$USER/.local/share/gedit/styles
mkdir /home/$USER/Downloads
mkdir /home/$USER/Documents
mkdir /home/$USER/.icons
mkdir /home/$USER/.themes
printf "Done\n"
printf "Extracting rest the necessary files to their appropriate Directories...    "
sleep 1s
cp -r gedit/tokyonight-dark.xml /home/$USER/.local/share/gedit/styles/
bsdtar -xf wallpapers/wallpapers.zip -C /home/$USER/
bsdtar -xf themes/Tokyonight-Dark-B.zip -C /home/$USER/.themes/
bsdtar -xf icons/Cursor.zip -C /home/$USER/.icons/
bsdtar -xf icons/papirus-icon-theme-yaru-folders.tar.xz -C /home/$USER/.icons/ Papirus
sync
printf "Done\n"
printf "Linking the necessary Directories...                                       "
sleep 1s
ln -sf /home/$USER/.icons/Papirus /home/$USER/.local/share/icons/
ln -sf /home/$USER/.themes/Tokyonight-Dark-B/gtk-4.0 /home/$USER/.config/
printf "Done\n"
printf "Appending required variables to .bash_profile...                           "
sleep 1s
cat bash_profile-append >> /home/$USER/.bash_profile
printf "Done\n"
echo
echo "Note: A reboot is required to complete the setup."
echo "Success !!"
echo

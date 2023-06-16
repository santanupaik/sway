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
echo "Creating the initial .config Directory...                                   Done"
sleep 1s
mkdir -p /home/$USER/.config
echo "Copying the necessary config files to .config...                            Done"
sleep 1s
cp -r fuzzel /home/$USER/.config/
cp -r swappy /home/$USER/.config/
cp -r sway /home/$USER/.config/
cp -r swaylock /home/$USER/.config/
cp -r waybar /home/$USER/.config/
sync
echo "Creating the rest of the necessary Directories...                           Done"
sleep 1s
mkdir -p /home/$USER/Pictures/Screenshots
mkdir -p /home/$USER/.local/share/fonts
mkdir /home/$USER/.local/share/icons
mkdir /home/$USER/Downloads
mkdir /home/$USER/Documents
mkdir /home/$USER/.icons
mkdir /home/$USER/.themes
echo "Extracting rest the necessary files to their appropriate Directories...     Done"
sleep 1s
bsdtar -xf wallpapers/wallpapers.zip -C /home/$USER/
bsdtar -xf themes/Tokyonight-Dark-B.zip -C /home/$USER/.themes/
bsdtar -xf icons/Cursor.zip -C /home/$USER/.icons/
bsdtar -xf fonts/Ubuntu.zip -C /home/$USER/.local/share/fonts/
bsdtar -xf fonts/SourceCodePro.zip -C /home/$USER/.local/share/fonts/
bsdtar -xf icons/papirus-icon-theme-yaru-folders.tar.xz -C /home/$USER/.icons/ Papirus
sync
echo "Linking the necessary Directories...                                        Done"
ln -sf /home/$USER/.icons/Papirus /home/$USER/.local/share/icons/
ln -sf /home/$USER/.themes/Tokyonight-Dark-B/gtk-4.0 /home/$USER/.config/
echo "Appending required variables to .bash_profile...                            Done"
sleep 1s
cat bash_profile-append >> /home/$USER/.bash_profile
echo
echo "Note: A reboot is required to complete the setup."
echo "Success !!"
echo

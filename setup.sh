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
cp -r thunar /home/$USER/.config/
cp -r gedit /home/$USER/.local/share/
cp -r themes/Tokyonight-Dark-B/"gtk-4.0" /home/$USER/.config/
sync
printf "DONE\n"

printf "Creating rest of the necessary Directories...                              "
sleep 1s
mkdir -p /home/$USER/Pictures/Screenshots
mkdir /home/$USER/.local/share/icons
mkdir /home/$USER/.local/share/themes
mkdir /home/$USER/.local/share/wallpapers
mkdir /home/$USER/Downloads
mkdir /home/$USER/Documents
printf "DONE\n"

printf "Moving rest of the necessary files to their appropriate Directories... "
sleep 1s
mv wallpapers/assets/* /home/$USER/.local/share/wallpapers/
mv themes/* /home/$USER/.local/share/themes/
mv icons/* /home/$USER/.local/share/icons/
sync
printf "DONE\n"

printf "Appending strings to their required config files...                        "
sleep 1s
< bash_profile tee -a /home/$USER/.bash_profile > /dev/null
< electron-flags tee -a /home/$USER/.config/electron-flags.conf > /dev/null
< electron-flags tee -a /home/$USER/.config/code-flags.conf > /dev/null
printf "DONE\n"

echo
read -p "Script Succeeded. Remove Cloned Repository ? (y/n): " dans
case $dans in
    y|Y)
        rm -rf /home/$USER/swaywm && echo "DONE"
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

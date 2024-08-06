#!/bin/bash

echo
read -p "Setup your Desktop Environment ? (y/n): " userInput
case $userInput in
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
printf "Creating necessary directories...                       "
sleep 1s

mkdir -p $HOME/.config
mkdir -p $HOME/.local/share
printf "DONE\n"

printf "Downloading Theme files... (This might take a while)    "
wget -q https://master.dl.sourceforge.net/project/swaywm/Tokyonight-Dark-B.tar.gz -P themes
wget -q https://master.dl.sourceforge.net/project/swaywm/Papirus.tar.gz -P themes
printf "DONE\n"

printf "Extracting Theme files...                               "
tar -xzf themes/cursor.tar.gz -C themes 2> /dev/null
tar -xzf themes/Tokyonight-Dark-B.tar.gz -C themes 2> /dev/null
tar -xzf themes/Papirus.tar.gz -C themes 2> /dev/null 
rm themes/Tokyonight-Dark-B.tar.gz
rm themes/Papirus.tar.gz
printf "DONE\n"

printf "Copying the necessary config files to .config...        "
sleep 1s
cp -r fuzzel $HOME/.config/
cp -r swappy $HOME/.config/
cp -r sway $HOME/.config/
cp -r swaylock $HOME/.config/
cp -r waybar $HOME/.config/
cp -r alacritty $HOME/.config/
cp -r Thunar $HOME/.config/
cp -r gedit $HOME/.local/share/
cp -r themes/Tokyonight-Dark-B/"gtk-4.0" $HOME/.config/
sync
printf "DONE\n"

printf "Creating rest of the necessary Directories...           "
sleep 1s
mkdir -p $HOME/Pictures/Screenshots
mkdir $HOME/.local/share/icons
mkdir $HOME/.local/share/themes
mkdir $HOME/.local/share/wallpapers
mkdir $HOME/Downloads
mkdir $HOME/Documents
printf "DONE\n"

printf "Moving rest of the necessary files...                   "
sleep 1s
mv wallpapers/* $HOME/.local/share/wallpapers/
mv themes/Tokyonight-Dark-B $HOME/.local/share/themes/
mv themes/* $HOME/.local/share/icons/
sync
printf "DONE\n"

printf "Appending strings to their required config files...     "
sleep 1s
< misc/bash-profile tee -a $HOME/.bash_profile > /dev/null
< misc/electron-flags tee -a $HOME/.config/electron-flags.conf > /dev/null
< misc/electron-flags tee -a $HOME/.config/code-flags.conf > /dev/null
< misc/electron-flags tee -a $HOME/.config/chromium-flags.conf > /dev/null
printf "DONE\n"

echo
read -p "Script Succeeded. Remove Cloned Repository ? (y/n): " userInput
case $userInput in
    y|Y)
        rm -rf $HOME/sway && echo "DONE"
    ;;
    n|N)
        echo "Keeping Cloned Repo Intact."
    ;;
    *)
        echo "Invalid Choice."
    ;;
esac

echo
echo "Note: You must logout and log back in again."
echo "Success !!"
echo

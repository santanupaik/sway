#!/bin/sh
echo
echo "NOTE: ONLY RUN THIS SCRIPT IN ROOT, ELSE IT WILL FAIL !"
echo
read -p "Update the System & install all the required packages ? (y/n): " ans

case $ans in
    y|Y)
    	echo
        echo "Preparing for System Upgrade..."
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
pacman -Syu --noconfirm
echo

echo "Installing all the Required Packages..."
sleep 1s

echo
pacman -S --noconfirm linux linux-headers base-devel openssh linux-firmware vim git networkmanager netctl dialog reflector
pacman -S --noconfirm amd-ucode sbctl efibootmgr dosfstools mtools
pacman -S --noconfirm mesa libva-mesa-driver wayland sway swaylock swayidle swaybg fuzzel waybar gvfs alacritty \
                      thunar fragments celluloid gvfs-smb torbrowser-launcher pipewire pipewire-pulse gvfs-mtp \
                      gsettings-desktop-schemas pamixer pavucontrol otf-font-awesome grim slurp swappy rsync
pacman -S --noconfirm gedit ristretto corectrl qt5-wayland qt6-wayland wget android-tools exfatprogs zathura \
                      zathura-pdf-mupdf usbutils htop neofetch keepassxc thunar-archive-plugin thunar-volman \
                      tumbler file-roller pwgen ttf-dejavu noto-fonts-cjk noto-fonts-emoji noto-fonts code \
                      ttf-hack-nerd ttf-sourcecodepro-nerd ttf-ubuntu-font-family gnome-themes-extra github-cli
sleep 1s

echo
echo "Success !!"
echo

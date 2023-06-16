#!/bin/sh

echo "Installing the required Packages........"
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

sudo pacman -Syu
sudo pacman -S mesa wayland sway swaylock swayidle swaybg fuzzel waybar gvfs alacritty thunar fragments firefox chromium celluloid gvfs-smb torbrowser-launcher firejail pipewire pipewire-pulse gvfs-mtp gsettings-desktop-schemas pamixer pavucontrol otf-font-awesome grim slurp swappy xdg-desktop-portal xdg-desktop-portal-wlr

echo "Success !!"

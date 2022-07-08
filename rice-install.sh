#!/bin/sh
# RICING SCRIPT
# This script assumes you ran the base-install.sh

#TODO
#1 Setup mpd and mpc
#2 Setup bluetooth via cli
#3 Make a script to update dotfiles

echo "installing xorg and setting up xorg"
sudo pacman -S xorg xclip xorg-xinit --no-confirm

cp ./rice/xorg/.xinitrc ~/
cp ./rice/xorg/.Xresources ~/

echo "installing and setting up window manager"
sudo pacman -S bspwm sxhkd --no-confirm




echo "installing fonts"
yay -S nerd-fonts-fira-code --noconfirm

echo "installing and setting up custom prompt"
sudo pacman -S starship --noconfirm

cp ./rice/starship.toml ~/.config/

# ALACRITTY
echo "ricing alacritty"
cp ./rice/alacritty.yml ~/

# PLYMOUTH
echo "setting up plymouth"
sudo plymouth-set-default-theme bgrt -R

sudo mkinitcpio -p linux

# WINDOW MANAGER RICE
echo "ricing window manager"
cp ./rice/window-manager/config.py ~/.config/qtile/
cp ./rice/window-manager/space.png ~/.config/qtile/

cp ./rice/window-manager/picom.conf ~/.config/

# CLI PROGRAMS
echo "installing cli programs"
yay -S cava pfetch pipes.sh --noconfirm

sudo pacman -S cmatrix gtop --noconfirm

echo "done"

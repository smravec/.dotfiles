#!/bin/sh
# RICING SCRIPT
# This script assumes you ran the base-install.sh

#TODO
#1 Setup mpd and mpc
#2 Setup bluetooth via cli (easy with arch wiki)
#3 Make a script to update dotfiles (done)
#$ Setup neovim

echo "installing xorg and setting up xorg"
sudo pacman -S xorg xclip xorg-xinit --no-confirm

cp ./rice/xorg/.xinitrc ~/
cp ./rice/xorg/.Xresources ~/

echo "installing and setting up window manager"
sudo pacman -S bspwm sxhkd picom --noconfirm

cp ./rice/window-manager/bspwmrc ~/.config/bspwm/
cp ./rice/window-manager/sxhkdrc ~/.config/sxhkd/
cp ./rice/picom.conf ~/.config/

echo"installing and setting up application launcher"
sudo pacman -S rofi --noconfirm

mkdir ~/.config/rofi
cp ./rice/window-manager/config.rasi ~/.config/rofi/

echo "installing fonts"
yay -S nerd-fonts-fira-code --noconfirm

echo "installing and setting up custom prompt"
sudo pacman -S starship --noconfirm

cp ./rice/starship.toml ~/.config/

echo "installing gui apps"
sudo pacman -S firefox
sudo pacman -S krita vlc shotcut audacity libreoffice --noconfirm

yay -S vscodium-bin

echo "installing and ricing alacritty"
sudo pacman -S alacritty --noconfirm

mkdir ~/.config/alacritty
cp ./rice/alacritty.yml ~/.config/alacritty/

echo "setting up plymouth"
sudo plymouth-set-default-theme bgrt -R

sudo mkinitcpio -p linux

echo "installing cli programs"
yay -S cava pfetch oneko cbonsai pipes.sh --noconfirm

sudo pacman -S cmatrix gtop pv --noconfirm

echo "setting up custom scripts"

mkdir ~/Code
mkdir ~/Code/Scripts
cp ./rice/SystemUtils ~/Code/Scripts

echo "done"

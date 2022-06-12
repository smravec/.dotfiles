#!/bin/sh

#BASE INSTALL

echo "creating base home dirs"
mkdir /home/simon/Downloads
mkdir /home/simon/Notes
mkdir /home/simon/Music
mkdir /home/simon/Videos
mkdir /home/simon/Code
mkdir /home/simon/Code/Bash-Scripts
mkdir /home/simon/Pictures
mkdir /home/simon/Pictures/Wallpapers
mkdir /home/simon/School

echo "refreshing pacman"
sudo pacman -Syu --noconfirm

echo "installing packages"
sudo pacman -S cmatrix man-db man-pages libmagick neovim --noconfirm

echo "setting up AUR"
git clone https://aur.archlinux.org/yay.git /home/simon/Downloads/yay
( cd /home/simon/Downloads/yay && makepkg -si --noconfirm )

echo "installing packages from AUR"
yay -Syu acpi feh kpcli --noconfirm

echo "setting up git"
git config --global user.name "simon"
git config --global user.email "simon.mravec@gmail.com"

#WM AND XORG INSTALL

echo "installing web browser"
sudo pacman -S chromium --noconfirm

echo "installing terminal emulator"
yay -S alacritty --noconfirm

echo "installing other gui programs"
sudo pacman -S krita vlc shotcut audacity --noconfirm
yay -S visual-studio-code-bin --noconfirm

echo "installing xorg and window manager"
sudo pacman -S xorg xclip xorg-xinit qtile rofi picom --noconfirm

cp ./base/xorg/.xinitrc ~/
cp ./base/xorg/.Xresources ~/

#BOOT SETUP

echo "setting up boot with plymouth"
sudo mkdir /etc/systemd/system/getty@tty1.service.d
sudo cp ./base/boot/autologin.conf /etc/systemd/system/getty@tty1.service.d/

sudo rm /var/log/lastlog
sudo touch /var/log/lastlog
sudo chattr +i /var/log/lastlog

cp ./base/boot/.bash_profile /home/simon/

sudo cp ./base/boot/20-quiet-printk.conf /etc/sysctl.d/

sudo cp ./base/boot/mkinitcpio.conf /etc/
sudo mkinitcpio -p linux

sudo cp ./base/boot/system.conf /etc/systemd/

#AUDIO AND BLUETOOTH SETUP

echo "setting up audio and  bluetooth"
sudo pacman -S blueman pavucontrol pulseaudio alsa-utils pulseaudio-bluetooth --noconfirm

sudp cp ./base/main.conf /etc/bluetooth/
sudo systemctl enable bluetooth.service

#CODING SETUP

echo "installing programing languages and runtimes"
sudo pacman -S nodejs npm python python-pip --noconfirm

pip install youtube-dl
pip install yt-dlp

cp ./base/.bashrc /home/simon/

echo "rebooting system..."
sudo reboot
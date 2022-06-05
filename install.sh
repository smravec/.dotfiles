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

echo "installing packages"
sudo pacman -S cmatrix man-db man-pages libmagick --noconfirm

echo "setting up AUR"
git clone https://aur.archlinux.org/yay.git /home/simon/Downloads/yay
( cd /home/simon/Downloads/yay && makepkg -si --noconfirm )

echo "installing packages from AUR"
yay -Syu acpi feh kpcli --noconfirm

echo "setting up grub"
sudo cp  ./grub/grub /etc/default/grub
sudo cp -r  ./grub/Framework-Variant1 /usr/share/grub/themes/
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "setting up git"
git config --global user.name "simon"
git config --global user.email "simon.mravec@gmail.com"

#WM AND XORG INSTALL

echo "installing web browser"
sudo pacman -S chromium --noconfirm

echo "installing terminal emulator"
yay -S alacritty --noconfirm

echo "installing other gui programs"
sudo pacman -S krita vlc --noconfirm
yay -S visual-studio-code-bin --noconfirm

echo "installing xorg and window manager"
sudo pacman -S xorg xclip xorg-xinit xf86-video-intel qtile rofi --noconfirm

cp ./wm/xorg/.xinitrc /home/simon/
cp ./wm/xorg/.Xresources /home/simon/

echo "setting up clean boot"
sudo cp ./clean-boot/autologin.conf /etc/systemd/system/getty@tty1.service.d/

sudo rm /var/log/lastlog
sudo touch /var/log/lastlog
sudo chattr +i /var/log/lastlog

cp ./clean-boot/.bash_profile /home/simon/

sudo cp ./clean-boot/20-quiet-printk.conf /etc/sysctl.d/

sudo cp ./clean-boot/mkinitcpio.conf /etc/
sudo mkinitcpio -p linux

#BLUETOOTH SETUP

echo "setting up audio and  bluetooth"
sudo pacman -S blueman pavucontrol pulseaudio pulseaudio-bluetooth --noconfirm

echo "rebooting system..."
sudo reboot

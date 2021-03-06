#!/bin/sh

#BASE INSTALL
#MADE FOR FRAMEWORK LAPTOP MAY NOT WORK ON OTHER HARDWARE

echo "refreshing pacman"
sudo pacman -Syu --noconfirm
	
echo "setting up reflector(refreshes pacman mirrors)"
sudo pacman -S reflector --noconfirm

sudo cp ./base/reflector.conf /etc/xdg/reflector/

sudo systemctl enable reflector.service reflector.timer
sudo systemctl start reflector.service reflector.timer

echo "installing packages"
sudo pacman -S man-db rsync man-pages libmagick neovim --noconfirm

echo "setting up AUR"
git clone https://aur.archlinux.org/yay.git /home/simon/Downloads/yay
( cd /home/simon/Downloads/yay && makepkg -si --noconfirm )

echo "installing packages from AUR"
yay -Syu acpi feh kpcli --noconfirm

echo "setting up git"
git config --global user.name "simon"
git config --global user.email "simon.mravec@gmail.com"
git config --global pull.rebase false

echo "installing drivers"
sudo pacman -S intel-media-driver --noconfirm

echo "setting up vim"
cp ./base/.vimrc /home/simon/

#BOOT SETUP

echo "setting up clean boot"
yay -S plymouth-git --noconfirm

sudo mkdir /etc/systemd/system/getty@tty1.service.d
sudo cp ./base/boot/autologin.conf /etc/systemd/system/getty@tty1.service.d/

sudo rm /var/log/lastlog
sudo touch /var/log/lastlog
sudo chattr +i /var/log/lastlog

sudo cp ./base/boot/arch.conf /boot/loader/entries/

sudo cp ./base/boot/mkinitcpio.conf /etc/
sudo mkinitcpio -p linux

sudo cp ./base/boot/system.conf /etc/systemd/

#SHELL SETUP

echo "installling and setting up fish"
sudo pacman -S fish --noconfirm

sudo chsh -s $(which fish) simon

cp ./base/config.fish ~/.config/fish/

#AUDIO AND BLUETOOTH SETUP

#echo "setting up audio and  bluetooth"
#sudo pacman -S blueman pavucontrol pulseaudio alsa-utils pulseaudio-bluetooth --noconfirm

#sudp cp ./base/main.conf /etc/bluetooth/
#sudo systemctl enable bluetooth.service

#CODING SETUP

echo "installing programing languages and runtimes"
sudo pacman -S nodejs npm python python-pip --noconfirm

pip install youtube-dl
pip install yt-dlp

echo "done"

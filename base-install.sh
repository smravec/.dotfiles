
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
sudo pacman -Syu cmatrix man-db man-pages libmagick --noconfirm

echo "setting up AUR"
git clone https://aur.archlinux.org/yay.git /home/simon/Downloads/yay
( cd /home/simon/Downloads/yay && makepkg -si --noconfirm )

echo "installing packages from AUR"
yay -Syu acpi feh kpcli ly --noconfirm

echo "setting up display manager"
sudo systemctl enable ly.service
sudo systemctl disable getty@tty2.service

echo "setting up grub"
sudo cp  ./grub/grub /etc/default/grub
sudo cp -r  ./grub/theme/Framework-Variant1 /usr/share/grub/themes/
sudo grub-mkconfig -o /boot/grub/grub.cfg

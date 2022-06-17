# PLYMOUTH
echo "setting up plymouth"
yay -S plymouth-git --noconfirm

sudo plymouth-set-default-theme bgrt -R

# WINDOW MANAGER RICE
echo "ricing window manager"

cp ./rice/window-manager/config.py ~/.config/qtile/
cp ./rice/window-manager/arch_bg.png ~/Pictures/Wallpapers/

cp ./rice/window-manager/picom.conf ~/.config/

# COSMETIC CLI PROGRAMS
echo "installing cosmetic cli programs"
yay -S cava pfetch --noconfirm

sudo pacman -S cmatrix --noconfirm


echo "done"

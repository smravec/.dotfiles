# RICING SCRIPT
# This script assumes you ran the base-install.sh

#TODO
#1 Setup mpd and mpc
#2 Setup bluetooth via cli
#3 Make a script to update dotfiles

# SHELL
echo "ricing fish shell"
yay -S nerd-fonts-fira-code --noconfirm

sudo pacman -S starship --noconfirm

# ALACRITTY
echo "ricing alacritty"


# PLYMOUTH
echo "setting up plymouth"
yay -S plymouth-git --noconfirm

sudo plymouth-set-default-theme bgrt -R

# WINDOW MANAGER RICE
echo "ricing window manager"
cp ./rice/window-manager/config.py ~/.config/qtile/
cp ./rice/window-manager/arch_bg.png ~/Pictures/Wallpapers/

cp ./rice/window-manager/picom.conf ~/.config/

# CLI PROGRAMS
echo "installing cli programs"
yay -S cava pfetch vtop --noconfirm

sudo pacman -S cmatrix --noconfirm

echo "done"

#!/bin/sh

Home="/home/simon/"


echo "updating .dotfiles"

#alacritty ( terminal emulator )
cp $Home".config/alacritty/alacritty.yml" ./rice/
#rofi ( application launcher )
cp $Home".config/rofi/config.rasi" ./rice/window-manager/
#fish ( shell )
cp $Home".config/fish/config.fish" ./base/
#bspwm ( window manager )
cp $Home".config/bspwm/bspwmrc" ./rice/window-manager/
#sxhkd ( keybinds )
cp $Home".config/sxhkd/sxhkdrc" ./rice/window-manager/
#firefox ( browser )
#cp $Home
#picom ( compositor )
cp $Home".config/picom.conf" ./rice/
#starship ( prompt )
cp $Home".config/starship.toml" ./rice/
#color scheme ( custom color scheme based on tokio night )
#cp $Home
#polybar ( bar )
cp $Home".config/polybar/config.ini" ./rice/window-manager/
#vim ( text editor )
cp $Home".vimrc" ./base/
#neovim ( editor )
#cp $Home
#mpd ( music server )
#cp $Home
#xorg ( display server )
cp $Home".Xresources" ./rice/xorg/
cp $Home".xinitrc" ./rice/xorg/
#scripts ( other fish/bash scripts I use)
#UPDATE MANUALLY
#cp ~/Code/Scripts/SystemUtils ./rice/

echo "done"

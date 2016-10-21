#!/bin/bash

echo "Only setting up some of the files."
cp -ir .i3 ~/
cp -ir .wallpapers ~/
cp -ir .fonts ~/
cp -ir .gtkrc-2.0 ~/
cp -ir .bashrc ~/
cp -ir .emacs ~/
mkdir -p /home/alex/.config/gtk-3.0
cp -ir settings.ini /home/alex/.config/gtk-3.0

#install manually

#playerctl

#feh
sudo apt-get -y install feh lxappearance
#xrendr to be installed if it is not and setup your screen resolution
#arendr too for visual config of monitors

echo "Done."



#!/bin/bash

echo "Only setting up some of the files."
cp -ir .i3 ~/
cp -ir .wallpapers ~/
cp -ir .fonts ~/
#install manually

#playerctl

#feh
sudo apt-get -y install feh lxappearance
#xrendr to be installed if it is not and setup your screen resolution
#arendr too for visual config of monitors

echo "Done."



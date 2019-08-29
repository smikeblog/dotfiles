#! /bin/bash

xwallpaper --zoom ~/.config/dwm-00.jpg

smWM() {
    smWM=$(exec wmctrl -m | grep Name | awk '{ print $2 }' | grep -ic "dwm" )
   # echo "$smWM"
   return 0
}
smWM
if [ "$smWM" -eq 1 ]
then
   echo "Hi, Now dwmStatus Started"
   exec dwmStatus $HOME/.config/dwmStatus.json &
else
    echo "Not dwm window manager"
fi

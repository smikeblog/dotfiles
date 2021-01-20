#!/bin/bash
sleep 0.2

declare -a options=("$(/bin/ls $HOME/space/appimages/)")
choice=$(echo -e "$options[@]" | dmenu -l 25 -i -p 'Appimages: ')

exec $HOME/space/appimages/$choice


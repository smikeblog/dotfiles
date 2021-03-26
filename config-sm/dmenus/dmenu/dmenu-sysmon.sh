#!/bin/bash
#  ____ _____
# |  _ \_   _|  Derek Taylor (DistroTube)
# | | | || |    http://www.youtube.com/c/DistroTube
# | |_| || |    http://www.gitlab.com/dwt1/
# |____/ |_|
#
# Dmenu script for launching system monitoring programs.

sleep 0.2

declare -a options=("htop
glances
pulsemixer
gotop
iftop
iotop
iptraf-ng
nmon
s-tui
quit")

choice=$(echo -e "${options[@]}" | dmenu -l -i -p 'System monitors: ')

case $choice in
	quit)
		echo "Program terminated." && exit 1
	;;
	htop| \
	pulsemixer| \
    gotop| \
	glances| \
	nmon| \
	s-tui)
        exec st -e $choice
	;;
	iftop| \
	iotop| \
	iptraf-ng)
        exec st -e gksu $choice
	;;
	*)
		exit 1
	;;
esac


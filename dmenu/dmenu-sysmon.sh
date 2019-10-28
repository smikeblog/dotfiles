#!/bin/bash
#  ____ _____ 
# |  _ \_   _|  Derek Taylor (DistroTube)
# | | | || |    http://www.youtube.com/c/DistroTube
# | |_| || |    http://www.gitlab.com/dwt1/ 
# |____/ |_| 
#
# Dmenu script for launching system monitoring programs.


declare -a options=(" htop 
 glances 
 gtop 
 iftop 
 iotop 
 iptraf-ng 
 nmon 
 s-tui 
 quit ")

choice=$(echo -e "${options[@]}" | dmenu -l -i -p 'System monitors: ')

	if [ "$choice" == ' quit ' ]; then
		echo "Program terminated."
	fi
	if [ "$choice" == ' htop ' ]; then
        exec st -e htop
	fi
	if [ "$choice" == ' glances ' ]; then
        exec st -e glances
	fi
	if [ "$choice" == ' gtop ' ]; then
        exec st -e gtop
	fi
	if [ "$choice" == ' iftop ' ]; then
        exec st -e gksu iftop
	fi
	if [ "$choice" == ' iotop ' ]; then
        exec st -e gksu iotop
	fi
	if [ "$choice" == ' iptraf-ng ' ]; then
        exec st -e gksu iptraf-ng
	fi
	if [ "$choice" == ' nmon ' ]; then
        exec st -e nmon
	fi
	if [ "$choice" == ' s-tui ' ]; then
        exec st -e s-tui
	fi

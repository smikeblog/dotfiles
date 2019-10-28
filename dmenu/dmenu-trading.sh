#!/bin/bash
#  ____ _____ 
# |  _ \_   _|  Derek Taylor (DistroTube)
# | | | || |    http://www.youtube.com/c/DistroTube
# | |_| || |    http://www.gitlab.com/dwt1/ 
# |____/ |_| 
#
# Dmenu script for launching trading programs.


declare -a options=(" tastyworks 
 tastytrade 
 thinkorswim 
 quit ")

choice=$(echo -e "${options[@]}" | dmenu -l -i -p 'System monitors: ')

	if [ "$choice" == ' quit ' ]; then
		echo "Program terminated."
	fi
	if [ "$choice" == ' tastyworks ' ]; then
        exec /opt/tastyworks/tastyworks
	fi
	if [ "$choice" == ' tastytrade ' ]; then
        exec firefox tastytrade.com
	fi
	if [ "$choice" == ' thinkorswim ' ]; then
        exec /home/dt/thinkorswim/thinkorswim
	fi


#!/bin/bash
#  ____ _____ 
# |  _ \_   _|  Derek Taylor (DistroTube)
# | | | || |    http://www.youtube.com/c/DistroTube
# | |_| || |    http://www.gitlab.com/dwt1/ 
# |____/ |_| 
#
# Dmenu script for reddio - a command line Reddit viewer.


declare -a options=(" r/archlinux 
 r/commandline 
 r/DistroTube 
 r/GopherHoles 
 r/linux 
 r/linuxmasterrace 
 r/unixporn 
 r/linux4noobs 
 r/vim 
 quit ")

choice=$(echo -e "${options[@]}" | dmenu -l 10  -i -p 'Last 10 Posts From Reddit: ')

	if [ "$choice" == ' quit ' ]; then
		echo "Program terminated."
	fi
	if [ "$choice" == ' r/archlinux ' ]; then
        reddio print -l 15 r/archlinux | sed 's/\x1b\[[0-9;]*m//g' | dmenu -l 15 -i -p 'r/archlinux'
        exec st -e $SHELL -c 'reddio print -l 10 r/archlinux;$SHELL'
	fi
	if [ "$choice" == ' r/commandline ' ]; then
        reddio print -l 15 r/archlinux | sed 's/\x1b\[[0-9;]*m//g' | dmenu -l 15 -i -p 'r/commandline'
        exec st -e $SHELL -c 'reddio print -l 10 r/commandline;$SHELL'
	fi
	if [ "$choice" == ' r/DistroTube ' ]; then
        reddio print -l 15 r/archlinux | sed 's/\x1b\[[0-9;]*m//g' | dmenu -l 15 -i -p 'r/DistroTube'
        exec st -e $SHELL -c 'reddio print -l 10 r/DistroTube;$SHELL'
	fi
	if [ "$choice" == ' r/GopherHoles ' ]; then
        reddio print -l 15 r/archlinux | sed 's/\x1b\[[0-9;]*m//g' | dmenu -l 15 -i -p 'r/GopherHoles'
        exec st -e $SHELL -c 'reddio print -l 10 r/GopherHoles;$SHELL'
	fi
	if [ "$choice" == ' r/linux ' ]; then
        reddio print -l 15 r/archlinux | sed 's/\x1b\[[0-9;]*m//g' | dmenu -l 15 -i -p 'r/linux'
        exec st -e $SHELL -c 'reddio print -l 10 r/linux;$SHELL'
	fi
	if [ "$choice" == ' r/linuxmasterrace ' ]; then
        reddio print -l 15 r/archlinux | sed 's/\x1b\[[0-9;]*m//g' | dmenu -l 15 -i -p 'r/linuxmasterrace'
        exec st -e $SHELL -c 'reddio print -l 10 r/linuxmasterrace;$SHELL'
	fi
	if [ "$choice" == ' r/unixporn ' ]; then
        reddio print -l 15 r/archlinux | sed 's/\x1b\[[0-9;]*m//g' | dmenu -l 15 -i -p 'r/unixporn'
        exec st -e $SHELL -c 'reddio print -l 10 r/unixporn;$SHELL'
	fi
	if [ "$choice" == ' r/linux4noobs ' ]; then
        reddio print -l 15 r/archlinux | sed 's/\x1b\[[0-9;]*m//g' | dmenu -l 15 -i -p 'r/linux4noobs'
        exec st -e $SHELL -c 'reddio print -l 10 r/linux4noobs;$SHELL'
	fi
	if [ "$choice" == ' r/vim ' ]; then
        reddio print -l 15 r/archlinux | sed 's/\x1b\[[0-9;]*m//g' | dmenu -l 15 -i -p 'r/vim'
        exec st -e $SHELL -c 'reddio print -l 10 r/vim;$SHELL'
	fi

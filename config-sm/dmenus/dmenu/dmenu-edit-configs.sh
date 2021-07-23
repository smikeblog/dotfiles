#!/bin/bash
#  ____ _____ 
# |  _ \_   _|  Derek Taylor (DistroTube)
# | | | || |    http://www.youtube.com/c/DistroTube
# | |_| || |    http://www.gitlab.com/dwt1/ 
# |____/ |_| 
#
# Dmenu script for editing some of my more frequently edited config files.

sleep 0.2

declare -a options=(" awesome 
 bash 
 bspwm 
 dwm 
 polybar 
 st 
 sxhkd 
 kitty 
 zsh 
 quit ")

choice=$(echo -e "${options[@]}" | dmenu -l -i -p 'Edit a config file: ')

	if [ "$choice" == ' quit ' ]; then
		echo "Program terminated."
	fi
	if [ "$choice" == ' awesome ' ]; then
        exec st -e vim $HOME/.config/awesome/rc.lua
	fi
	if [ "$choice" == ' bash ' ]; then
        exec st -e vim $HOME/.bashrc
	fi
	if [ "$choice" == ' bspwm ' ]; then
        exec st -e vim $HOME/.config/bspwm/bspwmrc
	fi
	if [ "$choice" == ' dwm ' ]; then
        exec st -e vim $HOME/dwm/config.h
	fi
	if [ "$choice" == ' polybar ' ]; then
        exec st -e vim $HOME/.config/polybar/config
	fi
	if [ "$choice" == ' st ' ]; then
        exec st -e vim $HOME/Downloads/build/st/config.h
	fi
	if [ "$choice" == ' sxhkd ' ]; then
        exec st -e vim $HOME/.config/sxhkd/sxhkdrc
	fi
	if [ "$choice" == ' kitty ' ]; then
        exec st -e vim $HOME/.config/kitty/kitty.conf
	fi
	if [ "$choice" == ' zsh ' ]; then
        exec st -e vim $HOME/.zshrc
	fi

#!/bin/bash
#  ____ _____ 
# |  _ \_   _|  Derek Taylor (DistroTube)
# | | | || |    http://www.youtube.com/c/DistroTube
# | |_| || |    http://www.gitlab.com/dwt1/ 
# |____/ |_| 
#
# Dmenu script for editing some of my more frequently edited config files.


declare -a options=(" awesome 
 bash 
 bspwm 
 dwm 
 herbstluftwm 
 i3 
 polybar 
 qtile 
 st 
 sxhkd 
 xmonad 
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
	if [ "$choice" == ' herbstluftwm ' ]; then
        exec st -e vim $HOME/.config/herbstluftwm/autostart
	fi
	if [ "$choice" == ' i3 ' ]; then
        exec st -e vim $HOME/.i3/config
	fi
	if [ "$choice" == ' polybar ' ]; then
        exec st -e vim $HOME/.config/polybar/config
	fi
	if [ "$choice" == ' qtile ' ]; then
        exec st -e vim $HOME/.config/qtile/config.py
	fi
	if [ "$choice" == ' st ' ]; then
        exec st -e vim $HOME/st/config.h
	fi
	if [ "$choice" == ' sxhkd ' ]; then
        exec st -e vim $HOME/.config/sxhkd/sxhkdrc
	fi
	if [ "$choice" == ' xmonad ' ]; then
        exec st -e vim $HOME/.xmonad/xmonad.hs
	fi
	if [ "$choice" == ' zsh ' ]; then
        exec st -e vim $HOME/.zshrc
	fi

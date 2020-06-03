#!/bin/bash

if [ "$1" == "first_child"  ]
then
      notify-send -i bspwm "Switched to first_child mode!" && \ 
            bspc config automatic_scheme first_child
#        zenity --info --width=200 --height=100 --text "Switched to first_child mode!"
          exit 0
      elif [ "$1" == "longest_side"  ]
      then
            bspc config automatic_scheme longest_side
#              zenity --info --width=200 --height=100 --text "Switched to longest_side mode!"
                exit 0
            elif [ "$1" == "spiral"  ]
            then
                  bspc config automatic_scheme spiral
#                    zenity --info --width=200 --height=100 --text "Switched to spiral mode!"
                      exit 0
                  else
#                        zenity --info --width=200 --height=100 --text "Invalid mode!"
                          exit 1
fi

## from : https://dev.to/l04db4l4nc3r/bspwm-a-bare-bones-window-manager-44di

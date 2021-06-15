#!/bin/bash

if [ "$1" == "alternate" ]
then
  notify-send -i alternate "Switched to alternate mode!" && \
  bspc config automatic_scheme first_child
#  zenity --info --width=200 --height=100 --text "Switched to first_child mode!"
  exit 0
elif [ "$1" == "longest_side" ]
then
  notify-send -i longside  "Switched to longest_side mode!" && \
  bspc config automatic_scheme longest_side
#  zenity --info --width=200 --height=100 --text "Switched to longest_side mode!"
  exit 0
elif [ "$1" == "spiral" ]
then
  notify-send -i spiral "Switched to spiral mode!" && \
  bspc config automatic_scheme spiral
#  zenity --info --width=200 --height=100 --text "Switched to spiral mode!"
  exit 0
else
  notify-send -i error "Invalid mode!"
#  zenity --info --width=200 --height=100 --text "Invalid mode!"
  exit 1
fi

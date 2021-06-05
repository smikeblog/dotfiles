#!/bin/bash

#uses fzf and apt/pacman to list all available packages, allowing you to install a package by pressing ther Enter key
function fz-apt() {
    apt-cache search '' | sort | cut --delimiter ' ' --fields 1 | fzf --multi --cycle --reverse --preview 'apt-cache show {1}' | xargs -r sudo apt install
}

function fz-pacman() {
    pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S
} 

while :; do
  case "$1" in
    -h|--help)
      LESS=-FEXR less <<HELP
fztop SEARCH

USAGE:
  the following options are available:

  -a | --apt
    will show all available to install to APT packages
  -p | --pacman
    will show all available to install to PACMAN packages
  -h | --help
    will show this help
HELP
      exit ;;
    *) break
  esac
done


case "$1" in
    -a|--apt)
        fz-apt
esac

case "$1" in
    -p|--pacman)
        fz-pacman
esac

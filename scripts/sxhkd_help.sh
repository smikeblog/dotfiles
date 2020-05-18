#!/bin/bash

## from https://www.reddit.com/r/bspwm/comments/aejyze/tip_show_sxhkd_keybindings_with_fuzzy_search/
# awk '/^[a-z]/ && last {print $0,"\t",last} {last=""} /^#/{last=$0}' ~/.config/sxhkd/sxhkdrc | column -t -s $'\t' | fzf

awk '/^[a-z]/ && last {print $0,"\t",last} {last=""} /^#/{last=$0}' ~/.config/sxhkd/sxhkdrc | column -t -s $'\t'  | rofi -dmenu -i -no-show-icons -width 1000 -columns 1 lines 50

#cat $HOME/.config/sxhkd/sxhkdrc | awk '/^[a-z]/ && last {print $0,"\t",last} {last=""} /^#/{last=$0}' | column -t -s $'\t' | fzf

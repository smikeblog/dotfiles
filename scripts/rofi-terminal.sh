#!/usr/bin/env bash

rofi_path=$(find "$HOME" -type d -path '*/\.*' -prune -o -not -name '.*' -type d | rofi -dmenu)

[[ $rofi_path != "" ]] && exec st -e bash -c "cd $rofi_path; bash -i"

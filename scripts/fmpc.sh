#!/bin/bash

MUSIC_LIBRARY=$HOME/Music/

MPC_BIN=/usr/bin/mpc

#PROMPT=fzf

PROMPT="rofi -fuzzy -dmenu"

playlist(){
    $MPC_BIN playlist -f  " [%position% %artist% - %title%]"
}

if [ ! $# -eq 0 ]
then
    case "$1" in
        'playlist')
            playlist
            exit
            ;;
        'play')
            if [ -z "${2}" ]
            then
                song="$(playlist | $PROMPT | awk '{print $1}')"
            else
                song="$2"
            fi
            $MPC_BIN play "$song"
            ;;
        'add')
            if [ -z "${2}" ]
            then
                selection="$(find $MUSIC_LIBRARY -type d | $PROMPT | sed "s-$MUSIC_LIBRARY--")"
            else
                selection="$2"
            fi
            $MPC_BIN add "$selection"
            ;;
        *)
            $MPC_BIN "$@"
            ;;
    esac
fi

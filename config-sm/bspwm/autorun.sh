#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run setxkbmap -layout 'us,ru' -option 'grp:ctrls_toggle,grp_led:scroll',caps:escape

if [ -f /usr/lib/po*kit*-gnome/polkit-gnome-authentication-agent-1 ] ; then
    run /usr/lib/po*kit*-gnome/polkit-gnome-authentication-agent-1
fi

if hash pcmanfm > /dev/null 2>&1 ; then
    run dbus-launch pcmanfm -d
fi
if hash udiskie > /dev/null 2>&1 ; then
    run udiskie
fi
if hash tilda > /dev/null 2>&1 ; then
    run tilda
fi
if hash picom > /dev/null 2>&1 ; then
    run picom --experimental-backends
elif hash compton > /dev/null 2>&1 ; then
    run compton
fi

run xfce4-power-manager
run nm-applet

run xset -dpms
run xset s off


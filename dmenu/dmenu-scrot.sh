#!/usr/bin/env bash
#changelog
#v0.4
#1.Addedvariable for notification timeouts, 2. Show link in notification

IMG_PATH=$HOME/Pictures/scrot_screenshots 
UL=fb
EDIT=gimp
TIME=3000 #Miliseconds to view notification

prog="
---Local screenshots (save to IMG_PATH)---
1.quick_fullscreen
2.delayed_fullscreen
3.section
4.edit_fullscreen
---Upload to remote service (image will be deleted)---
a.upload_fullscreen
u.upload_delayed_fullscreen
e.edit_upload_fullscreen
s.upload_section
p.edit_upload_section
"

cmd=$(dmenu -l 20 -nf '#999' -nb '#292d3e' -sf '#eee' -sb '#0077bb' -p 'Choose Screenshot Type'  <<< "$prog")

cd $IMG_PATH  
case ${cmd%% *} in 

  1.quick_fullscreen) scrot -d 1 '%Y-%m-%d-@%H-%M-%S-scrot.png' && notify-send -u low -t $TIME 'Scrot' 'Fulldcreen taken and saved'  ;;
  2.delayed_fullscreen) scrot -d 4 '%Y-%m-%d-@%H-%M-%S-scrot.png' && notify-send -u low -t $TIME 'Scrot' 'Fulldcreen Screenshot saved'  ;;
  3.section) scrot -s '%Y-%m-%d-@%H-%M-%S-scrot.png' && notify-send -u low -t $TIME 'Scrot' 'Section Screenshot saved'  ;;
  4.edit_fullscreen) scrot -d 1 '%Y-%m-%d-@%H-%M-%S-scrot.png' -e "$EDIT \$f" && notify-send -u low -t $TIME 'Scrot' 'Screenshot Edited and saved'  ;;
 
  a.upload_fullscreen) scrot -d 1 '%Y-%m-%d-@%H-%M-%S-scrot.png' -e "$UL \$f" && (xclip -o;echo) | xclip -selection clipboard && notify-send -u low -t $TIME "Scrot" "Screenshot Uploaded (Powered by fb) - $(xclip -o;echo)"  ;;
  u.upload_delayed_fullscreen) scrot -d 4 '%Y-%m-%d-@%H-%M-%S-scrot.png' -e "$UL \$f" && (xclip -o;echo) | xclip -selection clipboard && notify-send -u low -t $TIME "Scrot" "Screenshot Uploaded (Powered by fb) - $(xclip -o;echo)"  ;;
  e.edit_upload_fullscreen) scrot -d 4 '%Y-%m-%d-@%H-%M-%S-scrot.png' -e "$EDIT \$f && $UL \$f && rm -f \$f" && notify-send -u low -t $TIME "Scrot" "Screenshot Uploaded (Powered by fb) - $(xclip -o)"  ;;
  s.upload_section) scrot -s '%Y-%m-%d-@%H-%M-%S-scrot.png' -e "$UL \$f" && (xclip -o;echo) | xclip -selection clipboard && notify-send -u low -t $TIME "Scrot" "Screenshot Uploaded (Powered by fb) - $(xclip -o)"  ;;
  p.edit_upload_section) scrot -s '%Y-%m-%d-@%H-%M-%S-scrot.png' -e "$EDIT \$f && $UL \$f && rm -f \$f" && notify-send -u low -t $TIME "Scrot" "Screenshot Uploaded (Powered by fb) - $(xclip -o)"  ;;


  *) exec "'${cmd}'" ;;
esac

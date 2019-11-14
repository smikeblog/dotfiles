#!/bin/bash

##	less 	<<-EOF
	bat 	<<-EOF
	List of some useful keybindings.
	More can be found from the file ~/.config/sxhkd/sxhkdrc.
	You can also edit keybindings there.

	Mod4 is super key, on many keyboards marked with windows logo.
	As a rule of thumb, super+<direction> moves focus,
	super+shift+<direction> moves focused window,
	and super+ctrl+<direction> resizes windows.

	Arrow keys, wasd and hjkl represent directions and numbers represent
	different workspaces.

	### Window manipulation ################################################################

		Super + shift + {q,r}         |- quit/restart bspwm
		Super + shift + c             |- close and kill
		Super + <direction>           |- Move focus to the direction
		Alt + ctrl + <direction>      |- Expand focused window to direction
		Super + 1-9                   |- Focus the desktop with that number
		Super + {_,shift + }n         |- Focus the next/prev node in that desktop
		Super + bracket{left, right}  |- Focus the next/prev node in current monitor 
		Super + shift + 1-9           |- Move focused window to desktop with that number
		Super + g                     |- Move window to the biggest available space
                                              |  or preselection if there is one
		Super + ctrl + <direction>    |- Preselect where the next window will be opened
		Super + ctrl + 1-9            |- Preselect the next window ratio
		Super + ctrl + <space>        |- Cancel the preselection for the focused node 
		Super + {p,b,"m","."}         |- Focus the node for the given path jump 
		Super + {o,i}                 |- Focus the older/newer node in the focus history
		Super + s                     |- Set float
		Super + t                     |- Set tiling
		Super + shift + t             |- Set pseudotiling
		Super + f                     |- Set fullscreen
		Super + m                     |- Toggle monocle
		Super + {grave,Tab}           |- Focus the last node/desktop
		Super + ctrl + z              |- Make window private
                                              |  (Avoids splitting it automatically)
		Super + ctrl + m              |- Make window marked
		Super + ctrl + x              |- Make window locked
		Super + ctrl + y              |- Make window sticky
	    ### Move/Resize  windcommands ######################################################

		Alt + ctrl + <direction>      |- Expand focused window to <direction>
		Alt + ctrl + shift + <direct> |- Contract focused window to <direction>
		Super + {Left,Down,Up,Right}  |- Move floating window  
		Super + shift + {comma,period}|- Rotate leaves of tree {90,270}
		Super + {_,shift + }a         |- Flip layout vertically/horizontally
		Super + alt + brckt{lft,rt}   |- Increaze/decreaze window gap on focused desktop 
		Super + alt + b               |- Balance tree (equalize windows)
		Super + ctrl + b              |- Undo Balance tree 
		Super + shift + b             |- Balance brother tree (equalize windows)
	### Mousecommands ######################################################################

		Leftclick menus	              |- Close menu
		Super + scroll                |- Adjust window gap
		Super + drag                  |- Moves window
		Super + rightclick drap       |- Resizes window
		Alt + leftclick               |- Spawn window manipulation menu on cursor
		Alt_gr + leftclick            |- Split window depending on mouselocation
                              |  and spawn application menu
	### Applications #######################################################################

		Alt + F2                     |- AppFinder xfce
		Alt + F3                     |- Jgmenu
		Alt + ctrl + s	             |- Web search with surfraw
		Super + w                    |- BROWSER
		Super + alt + v              |- Explore files with Vifm
		Super + alt + m              |- Audio Mixer (pulsemixer)
		Super + alt + h              |- htop
		Super + alt + n              |- newsboat
		Super + Return               |- Terminal
		Super + shift + Return       |- tmux Terminal
	### Menu Applications ##################################################################

		Alt + ctrl + Return          |- Dmenu (Run applications)
		Shift + ctrl + Return        |- Run rofi (Run applications)
		Alt + ctrl + e               |- Edit common Config Files 
		Alt + ctrl + m               |- Common Sys Monitoring Files 
		Alt + ctrl + r               |- reddio Reddit Viewer 

	### Not used ######################################################################
	### Applications #######################################################################

	Super + p                     |- Dmenu (Run applications)
	Super + space                 |- Dmenu (Run applications)
	Super + x                     |- Close window
	Super + shift + x             |- Kill window
	Alt + shift + <direction>     |- Preselect/split the rootwindow
	Alt + b                       |- Toggle automatic window balancing
	Ctrl + space                  |- Preselect where the next window will be opened
	Alt + Enter                   |- Preselect/split the root window




	EOF

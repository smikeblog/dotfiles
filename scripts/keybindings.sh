#!/bin/bash

	less 	<<-EOF
##	bat -l zsh	<<-EOF
	List of some useful keybindings.
	More can be found from the file ~/.config/sxhkd/sxhkdrc.

	Mod4 is super key, on many keyboards marked with windows logo.
	As a rule of thumb,
		super+<direction>            |- moves focus,
		super+shift+<direction>      |- moves focused window,
		super+ctrl+<direction>       |- resizes windows.

	Arrow keys and hjkl represent directions and
	numbers represent different workspaces.

	### Window manipulation ################################################################

		Super + shift + {q,r}         |- quit/restart bspwm
		Super + shift + c             |- close and kill
		Super + <direction>           |- Move focus to the direction
		Super + 1-9                   |- Focus the desktop with that number
		Super + {_,shift + }n         |- Focus the next/prev node in that desktop
		Super + bracket{left, right}  |- Focus the next/prev node in current monitor
		Super + shift + 1-9           |- Move focused window to desktop with that number
		Super + alt + g               |- Swap window with the biggest on desktop
                                  |  or preselection if there is one
		Super + ctrl + <direction>    |- Preselect where the next window will be opened
		Super + ctrl + 1-9            |- Preselect the next window ratio
		Super + ctrl + <space>        |- Cancel the preselection for the focused node
		Super + {p,b,"m","."}         |- Focus the node for the given path jump
		Super + {o,i}                 |- Focus the older/newer node in the focus history
		Super + {s,t,f}               |- Set {float,tiling,fullscreen}
		Super + shift + t             |- Set pseudotiling
		Super + d                     |- Toggle float
		Super + m                     |- Toggle monocle
		Super + {grave,Tab}           |- Focus the last node/desktop
		Super + ctrl + z              |- Make window private
                                  |  (Avoids splitting it automatically)
		Super + ctrl + m              |- Make window marked
		Super + ctrl + x              |- Make window locked
		Super + ctrl + y              |- Make window sticky
	### Move/Resize  windcommands ######################################################

		Alt + ctrl + <direction>      |- Expand focused window to <direction>
		Alt + shift + <direction>     |- Expand/Contract focused window to <direction>
		Alt + ctrl + shift + <direct> |- Contract focused window to <direction>
		Super + {Left,Down,Up,Right}  |- Move floating window
		Super + alt + {Left,Right}    |- Increase/Decrease floating window
		Super + shift + {comma,period}|- Rotate leaves of tree {90,270}
		Super + {_,shift + }a         |- Flip layout vertically/horizontally
		Super + shift + b             |- Balance brother tree (equalize windows)
		Super + ctrl + b              |- Undo Balance tree
		Super + alt + b               |- Balance tree (equalize windows)
		Super + alt + brckt{lft,rt}   |- Increaze/decreaze window gap on focused desktop
	### Applications #######################################################################

		Alt + F2                      |- AppFinder xfce
		Alt + F3                      |- Jgmenu
		Alt + F4                      |- Bspwm Window Menu
		Alt + F5                      |- Bspwm Desktop Menu
		Alt + ctrl + s	              |- Web search with surfraw
		Super + w                     |- BROWSER
		Super + alt + v               |- Explore files with Vifm
		Super + alt + m               |- Audio Mixer (pulsemixer)
		Super + alt + h               |- htop
		Super + alt + n               |- newsboat
		Super + shift + Return        |- tmux Terminal
		Super + alt + Return          |- tilix Terminal
		Super + Return                |- Terminal
	### Menu Applications ##################################################################

		Alt + ctrl + Return           |- Dmenu (Run applications)
		Shift + ctrl + Return         |- Run rofi (Run applications)
		Alt + ctrl + e                |- Edit common Config Files
		Alt + ctrl + m                |- Common Sys Monitoring Files
		Alt + ctrl + r                |- reddio Reddit Viewer

	### Not used ######################################################################
	### Applications #######################################################################

	Super + p                       |- Dmenu (Run applications)
	Super + space                   |- Dmenu (Run applications)
	Super + x                       |- Close window
	Super + shift + x               |- Kill window
	Alt + shift + <direction>       |- Preselect/split the rootwindow
	Alt + b                         |- Toggle automatic window balancing
	Ctrl + space                    |- Preselect where the next window will be opened
	Alt + Enter                     |- Preselect/split the root window




	EOF

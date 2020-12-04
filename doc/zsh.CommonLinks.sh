#!/usr/bin/sh

echo "links to $HOME"
ln -s $HOME/.dotfiles/scripts $HOME/scripts
ln -s $HOME/.dotfiles/dmenu/ $HOME/.dmenu
ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/todo $HOME/.todo
ln -s $HOME/.dotfiles/todo.actions.d/ $HOME/.todo.actions.d
ln -s $HOME/.dotfiles/dot.vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/vim/vim-vanilla/dot.vimrc.local $HOME/.vimrc.local
ln -s $HOME/.dotfiles/vim/vil $HOME/.vil
ln -s $HOME/.dotfiles/vim/vimrc.go-symlink $HOME/.go.vimrc
ln -s $HOME/.dotfiles/vim//vimrc $HOME/.vimrcD
ln -s $HOME/.dotfiles/home.Xresources $HOME/.Xresources
ln -s $HOME/.dotfiles/home-baraction.sh $HOME/baraction.sh
ln -s $HOME/.dotfiles/home.pentadactylrc $HOME/.pentadactylrc
ln -s $HOME/.dotfiles/pentadactyl-gruvbox/ $HOME/pentadactyl-gruvbox
##
echo "links to $HOME/.config/"
ln -s $HOME/.dotfiles/vifm/ $HOME/.config/vifm 
ln -s $HOME/.dotfiles/config/lf/ $HOME/.config/lf 
ln -s $HOME/.dotfiles/config/ranger $HOME/.config/ranger 
ln -s $HOME/.dotfiles/zathura $HOME/.config/zathura 
ln -s $HOME/.dotfiles/config/alacritty/ $HOME/.config/alacritty 
ln -s $HOME/.dotfiles/config/bat/ $HOME/.config/bat 
ln -s $HOME/.dotfiles/config/navi/ $HOME/.config/navi 
ln -s $HOME/.dotfiles/config/newsboat/ $HOME/.config/newsboat 
ln -s $HOME/.dotfiles/config/peco/ $HOME/.config/peco 
ln -s $HOME/.dotfiles/config/pet/ $HOME/.config/pet 
ln -s $HOME/.dotfiles/config/procs/ $HOME/.config/procs 
ln -s $HOME/.dotfiles/config/qutebrowser/ $HOME/.config/qutebrowser 
ln -s $HOME/.dotfiles/config/compton $HOME/.config/compton 
ln -s $HOME/.dotfiles/config/picom/ $HOME/.config/picom 
ln -s $HOME/.dotfiles/config/rofi/ $HOME/.config/rofi 
ln -s $HOME/.dotfiles/config/jgmenu/ $HOME/.config/jgmenu 
ln -s $HOME/.dotfiles/config/bspwm $HOME/.config/bspwm 
ln -s $HOME/.dotfiles/config/btops/ $HOME/.config/btops 
ln -s $HOME/.dotfiles/config/sxhkd $HOME/.config/sxhkd 
ln -s $HOME/.dotfiles/config/polybar/ $HOME/.config/polybarDT 

##
echo "links to $HOME/.local/share/"
ln -s $HOME/.dotfiles/fonts/ $HOME/.local/share/fonts

##
echo "copy ./bin to $HOME/.local/bin"
cp -r $HOME/.dotfiles/home.local/bin/ $HOME/.local/bin

##
echo "other links"
ln -s $HOME/Repos/polybars $HOME/.config/polybar 

##
echo "cheat links"
mkdir -p $HOME/.config/cheat $HOME/.config/cheat/
ln -s $HOME/.dotfiles/cheat/personal $HOME/.config/cheat/
ln -s $HOME/.dotfiles/cheat/work $HOME/.config/cheat/
ln -s $HOME/.dotfiles/cheat/config.yml $HOME/.config/cheat/

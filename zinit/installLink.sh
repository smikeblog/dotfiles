#!/usr/bin/sh

if [ -d $HOME/.dotfiles/zinit ]; then  
    ln -s ~/.dotfiles/zinit/zshrc ~/.zshrc
    ln -s ~/.dotfiles/zinit/zshenv ~/.zshenv
fi

# copy dot.zinit dir to home
if [ ! -d $HOME/.zinit ]; then  
    mkdir $HOME/.zinit	
    cp -r $HOME/.dotfiles/zinit/dot.zinit/* $HOME/.zinit/
fi

echo "DONE !"


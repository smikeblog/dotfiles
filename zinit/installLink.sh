#!/usr/bin/sh

if [ -d $HOME/.dotfiles/zinit ]; then
    ln -s ~/.dotfiles/zinit/zshrc ~/.zshrc
    ln -s ~/.dotfiles/zinit/zshenv ~/.zshenv
fi

# copy dot.zinit dir to home
if [ ! -d $HOME/.zinit ]; then
    mkdir -p $HOME/.local/ZINIT_TMPDIR
    mkdir $HOME/.zinit
    cp -r $HOME/.dotfiles/zinit/dot.zinit/* $HOME/.zinit/
fi

ln -s $HOME/.dotfiles/zsh.links/profile $HOME/.profile
ln -s $HOME/.dotfiles/zsh.links/zprofile $HOME/.zprofile
ln -s $HOME/.dotfiles/zsh.links/zshfunc.custom $HOME/.zshfunc.custom
ln -s $HOME/.dotfiles/zsh.links/zshrc.custom $HOME/.zshrc.custom
echo "DONE !"


#!/usr/bin/sh

ln -sf $HOME/.dotfiles/zsh.links/profile $HOME/.profile
ln -sf $HOME/.dotfiles/zsh.links/zprofile  $HOME/.zprofile
ln -sf $HOME/.dotfiles/zsh.links/zshfunc.custom  $HOME/.zshfunc.custom
ln -sf $HOME/.dotfiles/zsh.links/zshrc  $HOME/.zshrc
ln -sf $HOME/.dotfiles/zsh.links/zshrc.custom $HOME/.zshrc.custom

echo "all zsh links DONE!"

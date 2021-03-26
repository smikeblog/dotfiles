#!/usr/bin/sh

mkdir -p $HOME/bin

ln -sf $HOME/.dotfiles/config/bat/bat-extras-src/batman.sh $HOME/bin/batman

ln -sf $HOME/.dotfiles/config/bat/bat-extras-src/batdiff.sh $HOME/bin/batdiff

ln -sf $HOME/.dotfiles/config/bat/bat-extras-src/batgrep.sh $HOME/bin/batgrep

ln -sf $HOME/.dotfiles/config/bat/bat-extras-src/prettybat.sh $HOME/bin/batpretty

ln -sf $HOME/.dotfiles/config/bat/bat-extras-src/bat-modules.sh $HOME/bin/bat-modules

ln -sf $HOME/.dotfiles/config/bat/bat-extras-src/batwatch.sh $HOME/bin/batwatch

echo "All Done!!!"


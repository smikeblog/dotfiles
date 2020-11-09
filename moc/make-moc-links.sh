## Script will create ~/.moc dir and make link to config files
mkdir -p ~/.moc && cd ~/.moc

ln -s ~/.dotfiles/moc/themes ~/.moc/


ln -s ~/.dotfiles/moc/config ~/.moc/

ln -s ~/.dotfiles/moc/playlist.m3u ~/.moc/

ln -s ~/.dotfiles/moc/softmixer ~/.moc/

ln -s ~/.dotfiles/moc/equalizer ~/.moc/

ln -s ~/.dotfiles/moc/last_directory ~/.moc/

echo "All Done !"

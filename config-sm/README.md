# The configs link system is borrowed from  Kevin's dotfiles
# https://github.com/kevinhwang91/dotfiles.git

This is my personal ArchLinux dotfiles.

## Install all configuration

1. `cd ~/.dotfiles/config-sm`
2. `./install_all.sh`

## Install configuration respectively

1. `cd xxx`(e.g.,nvim, zsh ...)
2. `./install.sh`

## Add other application configuration 

1. `mkdir xxx`(new config directory)
2. `cp template.sh xxx/install.sh`
3. make the content of your personal configuration
4. `./install.sh`

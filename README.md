my dotfile configuration

##  1. Install zsh and git
### 1.1 on Debian
      sudo apt install zsh git
### 1.2 on Manjaro and Arco
      pacman -S zsh git
##  2.  make zsh default shell
### 2.1 on Debian and Manjaro+Arco
      chsh -s $(which zsh)
##  3.  install neovim and compile vim with scripting lang (py+rb+pl+lua)
### 3.1 on debian install neovim .appimage from
       https://github.com/neovim/neovim/wiki/Installing-Neovim
       curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
       chmod u+x nvim.appimage
       ./nvim.appimage
### 3.2 on Manjaro + Arco
       yay -S neovim.git
##  4.  install nodejs and ruby
### 4.1 node -
	https://github.com/nodesource/distributions/blob/master/README.md
### 4.2 ruby -
	https://www.ruby-lang.org/en/documentation/installation/
##  5.  clone repo
       git clone https://github.com/smikeblog/dotfiles.git
       cd ~/
       mv ~/dotfiles ~/.dotfiles
       cd ~/.dotfiles
##  6.  Nerd fonts for Powerline and update fonts cache
       cp fonts/ ~/.local/share/
       fc-cache -vf ~/.local/share/fonts/
##  7.  make links to zsh and vim lite configs
### 7.1 zsh
	  ln -s ~/.dotfiles/zsh.links/zshrc ~/.zshrc
	  ln -s ~/.dotfiles/zsh.links/zshrc.custom ~/.zshrc.custom
	  ln -s ~/.dotfiles/zsh.links/zshfunc.custom ~/.zshfunc.custom
### 7.2 vifm
	  ln -s ~/.dotfiles/vifm/ ~/.config/
### 7.3 nvim
	  nvm -u ~/.dotfiles/vimrc +PlugInstall
	  ln -s ~/.dotfiles/vim/vil ~/.vil
##  7.  logout && login for chsh to take effect


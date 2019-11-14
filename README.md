my dotfile configuration
# Default Configuration (as base XFCE or Cinnamon DEs)   #{{{
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
	Note: for polybar are used UbuntuMono and Fontawesome fonts
	https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/UbuntuMono.zip
	https://fontawesome.com/download
       also for terminal , vim and tmux:
       cp fonts/ ~/.local/share/
       and finally index new fonts:
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
   #}}}

# development environment setup (bspwm or dwm WMs)  #{{{
Note: I install WM for dev environment alongside to DE (cinnamon or xfce) to have more memory
### bspwm (https://github.com/baskerville/bspwm/wiki )
#### bspwm is compiled from github sources
	git clone https://github.com/baskerville/bspwm.git ~/Downloads/build/
	git clone https://github.com/baskerville/sxhkd.git ~/Downloads/build/
	cd ~/Downloads/build/bspwm && make && sudo make install
	cd ~/Downloads/build/sxhkd && make && sudo make install
#### make links to my .dotfiles
	ln -s ~/.dotfiles/config/bspwm ~/.config/
	ln -s ~/.dotfiles/config/sxhkd ~/.config/
#### copy desktop file to nake it to appear in login manager
	sudo cp ~/.dotfiles/doc/desktops/bspwm.desktop /usr/share/xsessions/


## install dependencies polybar and btops
### polybar
#### debian
	sudo apt install polybar

#### manjaro
	yay -S polybar

### install btops (show only used workspaces and add additional dinamically) need Golang
#### install and config golang according instructions from its site golang.org (look for current version ...)
	wget https://dl.google.com/go/go1.13.1.linux-amd64.tar.gz
	sudo tar -C /usr/local tar -xzf go1.13.1.linux-amd64.tar.gz
	mkdir ~/go && mkdir ~/go/bin && mkdir ~/go/pkg && mkdir ~/go/src
#### get go sources for btops and compile
	go get github.com/cmschuetz/btops

   #}}}

## Other used Tools
	https://github.com/Peltoche/lsd
	https://github.com/relastle/pmy
	https://github.com/gokcehan/lf
	https://github.com/sharkdp/fd
	https://github.com/peco/peco
	https://github.com/sharkdp/bat
	https://github.com/sharkdp/ripgrep
	https://gitlab.com/wavexx/screenkey


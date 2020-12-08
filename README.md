My dotfile configuration
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
    NOTE: for MXLinux on st fix emojis err with font:
          wget http://ftp.br.debian.org/debian/pool/main/t/ttf-ancient-fonts/fonts-symbola_2.60-1_all.deb
	https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/UbuntuMono.zip
	https://fontawesome.com/download
       also for terminal , vim and tmux:
       cp fonts/ ~/.local/share/
       and finally index new fonts:
       fc-cache -vf ~/.local/share/fonts/
##  7.  make links to zsh and vim lite configs
### 7.1 zsh
	  ln -s ~/.dotfiles/zsh.links/profile ~/.profile
	  ln -s ~/.dotfiles/zsh.links/zshrc.custom ~/.zshrc.custom
	  ln -s ~/.dotfiles/zsh.links/zshfunc.custom ~/.zshfunc.custom
     a) for zgit manager and prezto prompt
	  ln -s ~/.dotfiles/zsh.links/zshrc ~/.zshrc
     b) for zinit manager and powerlevel10k pure theme run script
      ~/.dotfiles/zinit/installLink.sh
### 7.2 vifm
	  ln -s ~/.dotfiles/vifm/ ~/.config/
### 7.3 nvim
	  nvim -u ~/.dotfiles/vimrc +PlugInstall
	  ln -s ~/.dotfiles/vim/vil ~/.vil
##  7.  logout && login for chsh to take effect
   #}}}

# development environment setup (bspwm or dwm WMs)  #{{{
Note: I install WM for development environment alongside with DE (cinnamon or xfce) to have more memory
### bspwm (https://github.com/baskerville/bspwm/wiki )
[[####]] bspwm is compiled from github sources
```
	git clone https://github.com/baskerville/bspwm.git ~/Downloads/build/
	git clone https://github.com/baskerville/sxhkd.git ~/Downloads/build/
	cd ~/Downloads/build/bspwm && make && sudo make install
	cd ~/Downloads/build/sxhkd && make && sudo make install
```
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

### install btops (to show only used workspaces and add additional dinamically) depends on Golang
#### install and config golang according instructions from its site golang.org (look for current version ...)
	wget https://dl.google.com/go/go1.13.1.linux-amd64.tar.gz
	sudo tar -C /usr/local tar -xzf go1.13.1.linux-amd64.tar.gz
	mkdir ~/go && mkdir ~/go/bin && mkdir ~/go/pkg && mkdir ~/go/src
#### get go sources for btops and compile
	go get github.com/cmschuetz/btops

   #}}}

## Other used Tools                                        {{{
    Ranger filemaneger: https://github.com/ranger/ranger
    and mpv image preview method: https://github.com/ranger/ranger/wiki/Image-Previews
	pip install ranger-fm

### provided from ~/.dotfiles/
	https://github.com/sharkdp/bat
	https://github.com/cheat/cheat
	https://github.com/dandavison/delta
	https://github.com/sharkdp/fd
	https://github.com/charmbracelet/glow
	https://github.com/xxxserxxx/gotop
	https://github.com/gokcehan/lf
	https://github.com/Peltoche/lsd
	https://github.com/denisidoro/navi
	https://github.com/peco/peco
	https://github.com/knqyf263/pet
	https://github.com/doronbehar/pistol
	https://github.com/relastle/pmy
	https://github.com/dalance/procs
	https://github.com/monochromegane/the_platinum_searcher
	https://github.com/sharkdp/ripgrep
	https://github.com/lotabout/skim
	https://github.com/lunaryorn/mdcat
	https://github.com/dbrgn/tealdeer
	https://github.com/cjbassi/ytop/releases
	https://github.com/wfxr/forgit
	https://github.com/bvaisvil/zenith

### Other Mandatory
	https://www.soimort.org/translate-shell/
	https://gitlab.com/wavexx/screenkey
	https://prettier.io/docs/en/install.html
	https://github.com/ggreer/the_silver_searcher
	https://github.com/jarun/buku
  https://github.com/Aloxaf/fzf-tab

### Other Optional
	pacman -S shellcheck
	https://github.com/mvdan/sh
	pip3 install awesome-finder
	cargo install runiq
	https://github.com/athityakumar/colorls
	https://github.com/Canop/broot
	https://gitlab.com/dwt1/shell-color-scripts
#### }}}


### {{{ Experimental
	 -- picom effects
	    https://github.com/jonaburg/picom

}}}

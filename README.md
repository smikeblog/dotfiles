My dotfile configuration

# Default Configuration (as base XFCE or Cinnamon DEs) #{{{

## 1. Install zsh and git

### 1.1 on Debian

      sudo apt install zsh git

### 1.2 on Manjaro and Arco

      pacman -S zsh git

## 2. make zsh default shell

### 2.1 on Debian and Manjaro+Arco

      chsh -s $(which zsh)

## 3. install neovim and compile vim with scripting lang (py+rb+pl+lua)
### 3.a. 2021 - now is managed by zinit

### 3.1 on debian install neovim.appimage from

       https://github.com/neovim/neovim/wiki/Installing-Neovim
       curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
       chmod u+x nvim.appimage
       ./nvim.appimage

### 3.2 on Manjaro + Arco

       yay -S neovim.git

## 4. install nodejs and ruby

### 4.1 node -

    https://github.com/nodesource/distributions/blob/master/README.md
    https://linuxize.com/post/how-to-install-yarn-on-debian-10/

### 4.2 ruby -

    https://www.ruby-lang.org/en/documentation/installation/

## 5. clone repo

       git clone https://github.com/smikeblog/dotfiles.git
       cd ~/
       mv ~/dotfiles ~/.dotfiles
       cd ~/.dotfiles

## 6. Nerd fonts setup and update fonts cache
      Note: polybar uses UbuntuMono and FiraCode fonts
     
      For terminal , vim and tmux:
      cp ~/.dotfiles/fonts/ ~/.local/share/

### 6.1 Nerd FiraCode
```
     wget $((curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | \
        grep "browser_download_url" | \
        grep "FiraCode.zip") | \
        cut -d\: -f2,3 | jq -r )

     mkdir -p ~/.local/share/fonts/FiraCodeNerd/
     unzip FiraCode.zip -d ~/.local/share/fonts/FiraCodeNerd/
```

### 6.1 Nerd UbuntuMono
```
     wget $((curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | \
        grep "browser_download_url" | \
        grep "UbuntuMono.zip") | \
        cut -d\: -f2,3 | jq -r )

     mkdir -p ~/.local/share/fonts/UbuntuMonoNerd/
     unzip FiraCode.zip -d ~/.local/share/fonts/UbuntuMonoNerd/
```

     and finally index new fonts:
```
       fc-cache -vf ~/.local/share/fonts/

       rm FiraCode.zip  && rm UbuntuMono.zip
```

## 7. make links to zsh and vim lite configs

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

### 7.3 nvim (2021 - if zsh=b) then appimage is used and managed by zinit )

      nvim -u ~/.dotfiles/vimrc +PlugInstall
      ln -s ~/.dotfiles/vim/vil ~/.vil

## 7. logout && login for chsh to take effect

#}}}

# development environment setup (bspwm or dwm WMs) #{{{

Note: I install WM for development environment alongside with DE (cinnamon or xfce) to have more memory

### bspwm (https://github.com/baskerville/bspwm/wiki )

[[####]] bspwm is compiled from github sources

```
	git clone https://github.com/baskerville/bspwm.git ~/Downloads/build/
	git clone https://github.com/baskerville/sxhkd.git ~/Downloads/build/
	cd ~/Downloads/build/bspwm && make && sudo make install
	cd ~/Downloads/build/sxhkd && make && sudo make install
```
  and install layouts scripts from:
     https://github.com/phenax/bsp-layout/blob/master/src/layout.sh
```
  curl https://raw.githubusercontent.com/phenax/bsp-layout/master/install.sh | bash -;

```
#### Dmenu Scripts (dmscripts) from: https://gitlab.com/dwt1/dmscripts 

    1. pandoc install to /usr/local/bin/
```
  cd ~/Downloads
  mkdir pandot && cd pandot
  wget -A "gz" $((curl -s https://api.github.com/repos/jgm/pandoc/releases/latest | grep "browser_download_url" | grep "amd64.tar") | cut -d\: -f2,3 | jq -r )
  sudo tar xvzf *.gz --strip-components 1 -C /usr/local/bin
  cd 
  rm -rf ~/Downloads/pandot
```

```
  git clone https://gitlab.com/dwt1/dmscripts.git
  cd dmscripts
  sudo make clean build
  sudo make install

```

#### make links to .dotfiles

    ln -s ~/.dotfiles/config/bspwm ~/.config/
    ln -s ~/.dotfiles/config/sxhkd ~/.config/

#### copy desktop file to nake it to appear in login manager

    sudo cp ~/.dotfiles/doc/desktops/bspwm.desktop /usr/share/xsessions/

## install dependencies polybar and btops

### polybar

#### debian based note: repo version is too old. It's better to compile sources 
     https://github.com/polybar/polybar/wiki/Compiling
```
    sudo apt install polybar
```
#### Arch
```
    yay -S polybar
````
### install and config golang according instructions from its site golang.org (look for current version ...)
     https://golang.org/dl/
```
    mkdir ~/go && mkdir ~/go/bin && mkdir ~/go/pkg && mkdir ~/go/src
```

#}}}

## Other used Tools {{{

    Ranger filemaneger: https://github.com/ranger/ranger
    pip3 install ranger-fm ueberzug

### provided from ~/.dotfiles/

    https://github.com/sharkdp/bat                               # zinit installed
    https://github.com/dandavison/delta                          # zinit installed
    https://github.com/sharkdp/fd                                # zinit installed
    https://github.com/cheat/cheat                               # zinit installed
    https://github.com/charmbracelet/glow                        # zinit installed
    https://github.com/gokcehan/lf                               # zinit installed
    https://github.com/Peltoche/lsd                              # zinit installed
    https://github.com/denisidoro/navi                           # zinit installed
    https://github.com/knqyf263/pet                              # zinit installed
    https://github.com/dalance/procs                             # zinit installed
    https://github.com/wfxr/forgit                               # zinit installed
    https://github.com/sharkdp/ripgrep                           # zinit installed
    https://github.com/Aloxaf/fzf-tab                            # zinit installed
    https://github.com/peco/peco                                 # zinit installed
    https://github.com/doronbehar/pistol
    https://github.com/relastle/pmy
    https://github.com/monochromegane/the_platinum_searcher
    https://github.com/xxxserxxx/gotop
    https://github.com/lotabout/skim
    https://github.com/lunaryorn/mdcat
    https://github.com/dbrgn/tealdeer
    https://github.com/cjbassi/ytop/releases
    https://www.soimort.org/translate-shell/
    https://github.com/bvaisvil/zenith
    https://github.com/seebye/fzf-ueberzogen

### Other Mandatory

		https://github.com/imsnif/bandwhich                            # zinit installed
    https://github.com/EricChiang/pup                              # zinit installed
    https://gitlab.com/wavexx/screenkey
    https://prettier.io/docs/en/install.html
    https://github.com/ggreer/the_silver_searcher
    https://github.com/jarun/buku

### Other Optional

    pacman -S shellcheck
    https://github.com/Bugswriter/tuxi/blob/main/tuxi
    https://github.com/ckardaris/ucollage
    https://github.com/mvdan/sh
    pip3 install awesome-finder
    cargo install runiq
    https://github.com/athityakumar/colorls
    https://github.com/Canop/broot
    https://gitlab.com/dwt1/shell-color-scripts

#### }}}

### {{{ Experimental
    -- kitty terminal binary install
        https://sw.kovidgoyal.net/kitty/binary.html
    -- picom effects
        https://github.com/jonaburg/picom

}}}

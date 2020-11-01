## Dejine usefull temp local tools
mkcd() { mkdir -- "$1" && cd -P -- "$1" ; }  #-- make dir and cd into

sudo apt update 
sudo apt install zsh 
sudo apt install libqt4-dev cmake  ##- needed fo keepassz
sudo apt install qutebrowser
sudo apt install fonts-powerline
sudo apt install libx11-dev
sudo apt install libxi-dev
sudo apt install libxrandr-dev
sudo apt install libncursses5-dev
sudo apt install libxft-dev
sudo apt install ruby ruby-dev
sudo apt install git vifm screenkey 
sudo apt install universal-ctags lxappearance dmenu rofi 
sudo apt install xsel sxiv nitrogen polybar 
sudo apt install zathura zathura-djvu zathura-pdf-poppler zathura-ps
sudo apt build-dep vim   #-- we use compiled vim

## install nodejs 14 lts 'cause in repo is too old (10v)
#    from : https://github.com/nodesource/distributions/blob/master/README.md#deb
#    Node.js v14.x:

# Using Debian, as root
su <passwd>
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt-get install -y nodejs
exit   # exit from root
node --version   #check install

## python related
sudo apt install python3-pip python3-dev
sudo apt install pip3 install neovim-remote
sudo pip3 install setuptools
sudo pip3 install ueberzug
sudo pip3 install ranger-fm        #-- from repo version is too old
sudo npm i -g neovim               #-- sudo???
pip3 install setuptools
pip3 install pynvim
pip3 install neovim-remote
## check pip and python install
which pip3
which python
python --version
python3 --version

## clone my dotfiles
git clone https://github.com/smikeblog/dotfiles ~/.dotfiles

## temp path to be able to use my tools now
export PATH=$PATH:"$HOME/.dotfiles/tools/"
ln -s ~/.dotfiles/vifm/ ~/.config/
ln -sf ~/.dotfiles/fonts/ ~/.local/share/
fc-cache -vf ~/.local/share/fonts/
lf

curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod 755 nvim.appimage 
sudo mv nvim.appimage /opt/
ln -sf /opt/nvim.appimage /usr/local/bin
sudo ln -sf /opt/nvim.appimage /usr/local/bin
sudo rm -rf /usr/local/bin/nvim.appimage 
sudo ln -sf /opt/nvim.appimage /usr/local/bin/nvim
## nvim --version   #-- check nvim install 

## install go dload archive from golang,org
sudo tar -C /usr/local -xzf go1.15.3.linux-amd64.tar.gz 
export PATH=$PATH:/usr/local/go/bin #-- temp path set 
## go version     #-- check install

##-- rust lang install 
curl https://sh.rustup.rs -sSf | sh
rustup override set stable
rustup update stable
sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
cargo build --release


## vim neovim plugins and configs
nvim -u ~/.dotfiles/vimrc +PlugInstall
ln -s ~/.dotfiles/vim/vil ~/.vil
git clone https://github.com/smikeblog/nvim ~/.config/nvim

## zsh links
cd ~/.dotfiles/zsh.links/
./make-zsh-links.sh 

## keepassz compile 
mkdir -p ~/Downloads/build && cd ~/Downloads/build
git clone https://github.com/kost/keepassz.git 
mkdir build
cd build
cmake ..
make
sudo make install

#-- vim Compile from Sources
sudo apt-get remove \\
		vim \\
		vim-runtime \\
		gvim \\
		vim-tiny \\
		vim-common \\
		vim-gui-common

##-- config
## define vars for compilation
FULL_VERSION="3.7.3"
MM_VERSION="3.7"
VIM_CONENSED_VER="82"
VIM_TAG="8.2"
BUILT_BY="Smike <smikeya@ya.ru>"

./configure --with-features=huge \\
            --enable-multibyte \\
            --enable-rubyinterp=yes \\
            --with-x \\
            --enable-perlinterp=yes \\
            --enable-luainterp=yes \\
            --enable-gui=gtk2 \\
            --enable-cscope \\
            --prefix=/usr/local \\
            --with-compiledby="${BUILT_BY}" \\
            --enable-python3interp=yes \\
            --with-python3-config-dir=$HOME/.pyenv/versions/${FULL_VERSION}/lib/python${MM_VERSION}/config-${MM_VERSION}m-x86_64-linux-gnu \\
            --includedir=$HOME/.pyenv/versions/${FULL_VERSION}/include/



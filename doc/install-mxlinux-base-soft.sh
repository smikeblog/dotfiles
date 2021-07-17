
comd_exists() {
    hash "$1" &>/dev/null
}
# install git
if comd_exists git; then
    echo "git is installed"
else
    echo "WARNING: \"git\" command is not found. Install it first"
    apt-get install -y git
fi

# install curl
if comd_exists curl; then
    echo "curl is installed"
else
    echo "WARNING: \"curl\" command is not found. Install it first"
    apt-get install -y curl
fi

# install wget
if comd_exists wget; then
    echo "wget is installed"
else
    echo "require wget but it's not installed. Install it first"
    apt-get install -y wget
fi

# install vim stable
if comd_exists vim; then
    echo "vim is installed"
else
    echo "require vim but it's not installed. Install it first from \n"
    echo " home: https://github.com/vim/vim-appimage/releases " 
#     add-apt-repository -y ppa:jonathonf/vim
#     apt-get update -y
#     apt-get install -y vim
#     apt-get install -y vim-gnome
fi
if comd_exists nvim; then
    echo "nvim is installed"
else
    echo "require nvim but it's not installed. Install it first"
    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.ap
       pimage
    chmod 755 nvim.appimage
    mv nvim.appimage /opt/nvim.appimage  && ln -sf /opt/nvim.appimage /usr/loca/bin/nvim
#    add-apt-repository -y ppa:neovim-ppa/stable
#    apt-get update -y
#    apt-get install -y neovim
fi

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "vim-plug installed"

# install zsh stable
if comd_exists zsh; then
    echo "zsh is installed"
else
    echo "require zsh but it's not installed. Install it first"
    apt-get install -y zsh
fi

# install tmux stable
if comd_exists tmux; then
    echo "tmux is installed"
else
    echo "require tmux but it's not installed. Install it first"
    apt-get install -y tmux
fi

# install node lts
if comd_exists node; then
    echo "nodejs is installed"
else
    echo "require nodejs but it's not installed. Install it first"
    wget install-node.now.sh/lts
    bash lts
    rm -rf lts
fi


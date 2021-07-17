log_file=~/install_progress_log.txt

sudo apt-get -y install zsh
if type -p zsh > /dev/null; then
    echo "zsh Installed" >> $log_file
else
    echo "zsh FAILED TO INSTALL!!!" >> $log_file
fi

#sudo apt-get install zsh-syntax-highlighting

#sudo apt-get -y install vim-gnome
#if type -p vim > /dev/null; then
#    echo "Vim Installed" >> $log_file
#else
#    echo "Vim FAILED TO INSTALL!!!" >> $log_file
#fi

#sudo apt-get -y install keepassx
#if type -p keepassx > /dev/null; then
#    echo "Keepassx Installed" >> $log_file
#else
#    echo "Keepassx FAILED TO INSTALL!!!" >> $log_file
#fi

sudo apt-get -y install figlet
if type -p figlet > /dev/null; then
    echo "figlet Installed" >> $log_file
else
    echo "figlet FAILED TO INSTALL!!!" >> $log_file
fi

#sudo apt-get -y install espeak
#if type -p espeak > /dev/null; then
#    echo "espeak Installed" >> $log_file
#else
#    echo "espeak FAILED TO INSTALL!!!" >> $log_file
#fi

sudo apt-get -y install curl
if type -p curl > /dev/null; then
    echo "curl Installed" >> $log_file
else
    echo "crul FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install exuberant-ctags
if type -p ctags-exuberant > /dev/null; then
    echo "exuberant-ctags Installed" >> $log_file
else
    echo "exuberant-ctags FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y gtk-redshift
if type -p redshift > /dev/null; then
    echo "redshift Installed" >> $log_file
else
    echo "redshift FAILED TO INSTALL!!!" >> $log_file
fi


# ---
# Install git-completion and git-prompt
# ---
#cd ~/
#curl -OL https://github.com/git/git/raw/master/contrib/completion/git-completion.bash
#mv ~/git-completion.bash ~/.git-completion.bash
#curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
#echo "git-completion and git-prompt Installed and Configured" >> $log_file

# ---
# Install node
# ---
cd ~/
# git clone https://github.com/joyent/node
#cd node
curl -LO install.-node.now.sh/lts
chmod 755 lts
sudo ./lts
cd ~/
rm -r lts # Remove the node script in the home directory

# node it seems is installed as nodejs in Mint if that
# is the case we create a symlink to node
if [[ (! -f /usr/bin/node) && (-f /usr/bin/nodejs) ]]; then
    sudo ln -s /usr/bin/nodejs /usr/bin/node
fi

if type -p node > /dev/null; then
    echo -n "Node version: "; echo -n `node --version`; echo " Installed" >> $log_file
else
    echo "node FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install npm
if type -p npm > /dev/null; then
    echo "npm Installed" >> $log_file
else
    echo "npm FAILED TO INSTALL!!!" >> $log_file
fi

sudo npm install -g jshint
if type -p jshint > /dev/null; then
    echo "jshint Installed" >> $log_file
else
    echo "jshint FAILED TO INSTALL!!!" >> $log_file
fi

curl http://beyondgrep.com/ack-2.08-single-file > ~/ack && chmod 0755 !#:3
sudo mv ~/ack /usr/bin/ack
sudo chmod 755 /usr/bin/ack
if type -p ack > /dev/null; then
    echo "Ack Downloaded and Installed" >> $log_file
else
    echo "Ack FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get install silversearcher-ag
if type -p ag > /dev/null; then
    echo "Silver searcher Installed" >> $log_file
else
    echo "Silver searcher FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install python3-pip
if type -p pip > /dev/null; then
    echo "pip Installed" >> $log_file
else
    echo "pip FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install tmux
if type -p tmux > /dev/null; then
    echo "tmux Installed" >> $log_file
else
    echo "tmux FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install python3-dev

# install neovim nightly release appImage
cd ~/
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod 755 nvim.appimage
sudo mv nvim.appimage /opt/
sudo ln -sf /opt/nvim.appimage /usr/local/bin
echo "installed nightly neovim and made link to /usr/local/bin ... "


#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Enjoy -Jarrod"
rm $log_file

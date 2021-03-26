cheat allows you to create and view interactive cheatsheets on the command-line

homepage: https://github.com/cheat/cheat

# Installing
cheat has no dependencies. To install it, download the executable from the releases page and place it on your PATH.

mkdir -p ~/.config/cheat && cheat --init > ~/.config/cheat/conf.yml
(replace config file with provided in .dotfiles/cheatdir)

also ln -s ~/.dotfiles/cheat/personal/ ~/.config/cheat/
and  ln -s ~/.dotfiles/cheat/work/ ~/.config/cheat/

and clone community cheats
    git clone https://github.com/cheat/cheatsheets.git ~/.config/cheat/community



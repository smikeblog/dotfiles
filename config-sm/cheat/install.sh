#!/usr/bin/env bash

source "$(cd -P "$(dirname "$0")" && pwd -P)/../base.sh"

    mkdir -p $HOME/.config/cheat

do_install() {
    link_file "$src_conf/conf.yml" "$HOME/.config/cheat/conf.yml"
    ln -sf "$src_conf/personal" "$HOME/.config/cheat/"
    ln -sf "$src_conf/work" "$HOME/.config/cheat/"
}

install

if [ ! -d $dst_conf/community ]; then
    git clone https://github.com/cheat/cheatsheets.git $HOME/.config/cheat/community
fi

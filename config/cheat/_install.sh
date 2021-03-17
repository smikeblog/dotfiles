#!/usr/bin/env bash

src_conf="$HOME/.dotfiles/config/cheat"
dst_conf="$HOME/.config/cheat"


do_install() {

    mkdir -p $dst_conf 2>/dev/null
    ln -sf "$src_conf/conf.yml" "$dst_conf/conf.yml"
    ln -sf "$src_conf/personal" "$dst_conf/"
    ln -sf "$src_conf/work" "$dst_conf/"

}

do_install

if [ ! -d $dst_conf/community ]; then
    git clone https://github.com/cheat/cheatsheets.git $dst_conf/community
fi

#!/usr/bin/env bash

src_conf="$HOME/.dotfiles/config/ranger"
dst_conf="$HOME/.config/ranger"

rm -rf "$dst_conf"

do_install() {
    local ranger_plugin_dot=$src_conf/plugins
    local ranger_plugin_home=$dst_conf/plugins

    mkdir -p $dst_conf 2>/dev/null
    ln -s "$src_conf/rc.conf" "$dst_conf/rc.conf"
    ln -s "$src_conf/rifle.conf" "$dst_conf/rifle.conf"
    ln -s "$src_conf/scope.sh" "$dst_conf/scope.sh"

    mkdir -p "$ranger_plugin_home" 2>/dev/null
    find "$ranger_plugin_dot" -iname '*.py' -type f | {
        while read -r file; do
            ln -s "$file" "$ranger_plugin_home/$(basename "$file")" </dev/tty
        done
    }
}

do_install

#!/usr/bin/env bash

source "$(cd -P "$(dirname "$0")" && pwd -P)/../base.sh"

do_install() {

    dst_confSM=$HOME/.moc
    moc_theme_dot=$src_conf/themes
    moc_theme_home=$dst_confSM/themes

    mkdir -p $dst_confSM 2>/dev/null
    link_file "$src_conf/config" "$dst_confSM/config"
    link_file "$src_conf/playlist.m3u" "$dst_confSM/playlist.m3u"
    link_file "$src_conf/softmixer" "$dst_confSM/softmixer"
    link_file "$src_conf/equalizer" "$dst_confSM/equalizer"

    mkdir -p "$moc_theme_home" 2>/dev/null
    find "$moc_theme_dot" -type f | {
        while read -r file; do
            link_file "$file" "$moc_theme_home/$(basename "$file")" </dev/tty
        done
    }
}
install

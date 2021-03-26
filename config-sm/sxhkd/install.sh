#!/usr/bin/env bash

source "$(cd -P "$(dirname "$0")" && pwd -P)/../base.sh"

do_install() {
    mkdir -p $dst_conf 2>/dev/null
    link_file "$src_conf/cheatsheet_sxhkdrc.txt" "$dst_conf/cheatsheet_sxhkdrc.txt"
    link_file "$src_conf/sxhkdrc" "$dst_conf/sxhkdrc"
    link_file "$src_conf/sxhkdrc_bspc" "$dst_conf/sxhkdrc_bspc"
}
install

#!/usr/bin/env bash

source "$(cd -P "$(dirname "$0")" && pwd -P)/../base.sh"

do_install() {
    mkdir -p $dst_conf 2>/dev/null
    link_file "$src_conf/autorun.sh" "$dst_conf/autorun.sh"
    link_file "$src_conf/bspwmrc" "$dst_conf/bspwmrc"
}
install

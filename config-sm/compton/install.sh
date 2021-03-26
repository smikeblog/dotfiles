#!/usr/bin/env bash

source "$(cd -P "$(dirname "$0")" && pwd -P)/../base.sh"

do_install() {
    mkdir -p $dst_conf 2>/dev/null
    link_file "$src_conf/compton.conf" "$dst_conf/compton.conf"
    link_file "$src_conf/toggle_compton" "$dst_conf/toggle_compton"
}
install

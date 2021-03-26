#!/usr/bin/env bash

source "$(cd -P "$(dirname "$0")" && pwd -P)/../base.sh"

do_install() {
    mkdir -p $dst_conf 2>/dev/null
    link_file "$src_conf/config" "$dst_conf/config"
    link_file "$src_conf/urls" "$dst_conf/urls"
}
install

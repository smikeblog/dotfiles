#!/usr/bin/env bash

source "$(cd -P "$(dirname "$0")" && pwd -P)/../base.sh"

do_install() {
    mkdir -p $dst_conf 2>/dev/null
    link_file "$src_conf/lfrc" "$dst_conf/lfrc"
    link_file "$src_conf/preview" "$dst_conf/preview"
    link_file "$src_conf/cleaner" "$dst_conf/cleaner"
}
install

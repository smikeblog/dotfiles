#!/usr/bin/env bash

source "$(cd -P "$(dirname "$0")" && pwd -P)/../base.sh"

do_install() {
    navi_cheat_dot=$src_conf/cheats/
    navi_shell_dot=$src_conf/shell/
    navi_cheat_home=$dst_conf/cheats/
    navi_shell_home=$dst_conf/shell/

    mkdir -p $dst_conf 2>/dev/null

    ln -sf $src_conf/cheats $dst_conf/cheats
    ln -sf $src_conf/shell $dst_conf/shell
}

install

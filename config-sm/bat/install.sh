#!/usr/bin/env bash

source "$(cd -P "$(dirname "$0")" && pwd -P)/../base.sh"

    mkdir -p $HOME/bin

do_install() {
    link_file "$src_conf" "$HOME/.config/bat"

    link_file "$src_conf/bat-extras-src/batman.sh" "$HOME/bin/batman"
    link_file "$src_conf/bat-extras-src/batdiff.sh" "$HOME/bin/batdiff"
    link_file "$src_conf/bat-extras-src/batgrep.sh" "$HOME/bin/batgrep"
    link_file "$src_conf/bat-extras-src/prettybat.sh" "$HOME/bin/batpretty"
    link_file "$src_conf/bat-extras-src/bat-modules.sh" "$HOME/bin/bat-modules"
    link_file "$src_conf/bat-extras-src/batwatch.sh" "$HOME/bin/batwatch"
}

install

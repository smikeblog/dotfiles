#!/usr/bin/env bash

source "$(cd -P "$(dirname "$0")" && pwd -P)/../base.sh"

    mkdir -p $HOME/bin

do_install() {
    link_file "$src_conf" "$HOME/.config/bat"
}

install

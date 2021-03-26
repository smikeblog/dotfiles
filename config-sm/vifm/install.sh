#!/usr/bin/env bash

source "$(cd -P "$(dirname "$0")" && pwd -P)/../base.sh"

do_install() {
    vifm_color_dot=$src_conf/colors
    vifm_color_home=$dst_conf/colors
    vifm_script_dot=$src_conf/scripts
    vifm_script_home=$dst_conf/scripts

    mkdir -p $dst_conf 2>/dev/null
    link_file "$src_conf/vifmrc" "$dst_conf/vifmrc"
    link_file "$src_conf/vifm-help.txt" "$dst_conf/vifm-help.txt"

    mkdir -p "$vifm_color_home" 2>/dev/null
    find "$vifm_color_dot" -iname '*.vifm' -type f | {
        while read -r file; do
            link_file "$file" "$vifm_color_home/$(basename "$file")" </dev/tty
        done
    }
    mkdir -p "$vifm_script_home" 2>/dev/null
    find "$vifm_script_dot" -type f | {
        while read -r file; do
            link_file "$file" "$vifm_script_home/$(basename "$file")" </dev/tty
        done
    }
}

install

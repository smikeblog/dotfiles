#!/usr/bin/env bash

source "$(cd -P "$(dirname "$0")" && pwd -P)/../base.sh"

    src_conf="$(pwd -P)"
    todo_home="$HOME/.todo"
    mkdir -p "$todo_home" 2>/dev/null

    ln -sf "$src_conf/config" "$HOME/.todo/config"
    ln -sf "$src_conf/todo.actions.d/" "$HOME/.todo.actions.d"


#!/usr/bin/env bash

source "$(cd -P "$(dirname "$0")" && pwd -P)/../base.sh"

ln -s $HOME/.dotfiles/config-sm/qutebrowserl/qutebrowser/ $HOME/.config/

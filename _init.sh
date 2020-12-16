#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

# system executables
#export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/libexec
# local system binaries
# export PATH=/usr/local/sbin:/usr/local/bin:$PATH

#-----------------------------------------------------
# ensure to only execute on ZSH
# https://stackoverflow.com/a/9911082/339302
# [ ! -n "$ZSH_VERSION" ] && return

# sm defined
ZSHCONFIG=$HOME/.dotfiles

#-----------------------------------------------------
# Setting autoloaded functions
#
my_zsh_fpath=${ZSHCONFIG}/autoloaded

fpath=($my_zsh_fpath $fpath)

if [[ -d "$my_zsh_fpath" ]]; then
    for func in $my_zsh_fpath/*; do
        autoload -Uz ${func:t}
    done
fi
unset my_zsh_fpath

#-----------------------------------------------------
# Load the plugins before scripts
#
#source ${ZSHCONFIG}/antibody.zsh

#source ${ZSHCONFIG}/zsh-managed-plugins.zsh

#
# Load all scripts ${ZSHCONFIG}/lib/*.zsh
#
my_zsh_lib=${ZSHCONFIG}/lib
if [[ -d "$my_zsh_lib" ]]; then
   for file in $my_zsh_lib/*.zsh; do
      source $file
   done
fi
unset my_zsh_lib
# source  ${ZSHCONFIG}/reposm/zshfuncs/3_functions.zsh

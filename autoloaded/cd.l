#! /bin/dash

# List content when changing directory
#cdl () 
{ builtin cd "$@"; exa -l --icons --group-directories-first; }

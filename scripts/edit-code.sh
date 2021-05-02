#!/bin/bash

#=======================================================================================
#         FILE: edit.sh
#        USAGE: edit.sh
#  DESCRIPTION: Utility to allow selection of a project directory with the option to
#               check/update the dependencies, run Rollup watch, and edit in VS Code
#      WEBSITE: https://www.elsewebdevelopment.com/
# REQUIREMENTS: npm-check   https://www.npmjs.com/package/npm-check
#               rollup      https://www.npmjs.com/package/rollup
#               VS Code     https://code.visualstudio.com/
#       AUTHOR: David Else
#      COMPANY: Else Web Development
#      VERSION: 1.0
#     REVISION: 03-01-18
#=======================================================================================

PROJECT_FOLDER="$HOME/Code" # site that contains users projects to edit
BOLD=$(tput bold)            # bold text
NORMAL=$(tput sgr0)          # normal text

#===  FUNCTION  ========================================================================
#         NAME:  create_menu_from_directory
#  DESCRIPTION:  convert current directory names into a menu for selection
#=======================================================================================
function create_menu_from_directory() {
    IFS=$'\n' read -d '' -ra files < <(ls -td -- */) # sorted names of dirs in ${files[@]}

    select f in "${files[@]}"; do
        [[ -n "$f" ]] && break # valid selection made, exit the menu
        echo ">>> Invalid Selection" >&2
    done
}

#---------------------------------------------------------------------------------------
# ask the user which project they would like to edit
#---------------------------------------------------------------------------------------
cd "$PROJECT_FOLDER" || exit

clear
echo "Which project would you like to edit in VS Code?"
echo
echo "${BOLD}$PROJECT_FOLDER${NORMAL}"
echo

create_menu_from_directory
cd "$f" || exit

#---------------------------------------------------------------------------------------
# check NPM packages are up-to-date and allow upgrading using npm-check
#---------------------------------------------------------------------------------------
if [[ -f package.json ]]; then
    echo
    echo "${BOLD}'package.json' detected${NORMAL}"
    echo
    read -p "Check NPM packages are up-to-date? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "We now don't use npm  npm-check -u "
    fi
fi

#---------------------------------------------------------------------------------------
# ask user if they would like to run Rollup if it is detected
#---------------------------------------------------------------------------------------
if [[ -f rollup.config.js ]]; then
    echo
    echo "${BOLD}'rollup.config.js' detected${NORMAL}"
    echo
    read -p "Run Rollup in watch mode? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        code .
#        ./node_modules/.bin/rollup -c --watch
        exit
    fi
fi

nvim .

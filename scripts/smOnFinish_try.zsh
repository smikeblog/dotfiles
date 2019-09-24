#!/usr/bin/env zsh
#
trap on_error SIGKILL SIGTERM

e='\033'
RESET="${e}[0m"
BOLD="${e}[1m"
CYAN="${e}[0;96m"
RED="${e}[0;91m"
YELLOW="${e}[0;93m"
GREEN="${e}[0;92m"

_exists() {
  command -v $1 > /dev/null 2>&1
}

# Success reporter
info() {
  echo -e "${CYAN}${*}${RESET}"
}

# Error reporter
error() {
  echo -e "${RED}${*}${RESET}"
}

# Success reporter
success() {
  echo -e "${GREEN}${*}${RESET}"
}

# End section
finish() {
  success "Done!"
  echo
  sleep 1
}

on_start() {
  info '           __        __   ____ _  __            '
  info '      ____/ /____   / /_ / __/(_)/ /___   _____ '
  info '     / __  // __ \ / __// /_ / // // _ \ / ___/ '
  info '  _ / /_/ // /_/ // /_ / __// // //  __/(__  )  '
  info ' (_)\__,_/ \____/ \__//_/  /_//_/ \___//____/   '
  info '                                                '
  info '              by @smike                         '
  info '                                                '
}
#
on_finish() {
  success "Done!"
  success "Happy Coding!"
  echo
  echo -ne $RED'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e  $RESET$BOLD',------,'$RESET
  echo -ne $YELLOW'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e  $RESET$BOLD'|   /\_/\\'$RESET
  echo -ne $GREEN'-_-_-_-_-_-_-_-_-_-_-_-_-_-'
  echo -e  $RESET$BOLD'~|  ( ^..^)'$RESET
  echo -ne $CYAN'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e  $RESET$BOLD'|__ ""--""'$RESET
  echo
}

on_error() {
  error "Wow... Something serious happened!"
  error "Though, I don't know what really happened :("
  exit 1
}

main() {
  on_start "$*"
#  update_dotfiles "$*"
#  update_brew "$*"
#  update_apt_get "$*"
#  update_npm "$*"
#  update_gem "$*"
#  update_apm "$*"
  finish
  on_finish "$*"
}

main "$*"


#!/usr/bin/env bash

set -eu

usage() {
  cat <<_EOF_

Description:
  Helper script for managing power operations via GNOME and systemd.

Usage:
  $0 command

  With <command> being one of the following:
    - logout      : ends the current session
    - lock        : locks the screen
    - suspend     : locks the screen and suspends the machine
    - shutdown    : shuts down the machine
    - reboot      : reboots the machine

Author:
  Jonas De Moor
_EOF_
}

logout_user() {
  /usr/bin/gnome-session-quit --logout \
    --no-prompt
}

lock_machine() {
  "${HOME}/i3.d/i3_lock_wrapper.sh" "${HOME}/Pictures/morty_locked.png"
}

suspend_machine() {
  lock_machine
  sleep 2
  /usr/bin/systemctl suspend
}

shutdown_machine() {
  /usr/bin/systemctl poweroff
}

reboot_machine() {
  /usr/bin/systemctl reboot
}

if [[ "${#}" -ne 1 ]]; then
  echo "Error: wrong number of arguments (expected: 1; actual: ${#})"
  usage
  exit 1
fi

if [[ -z "${1}" ]]; then
  echo "Error: empty argument passed"
  usage
  exit 1
fi

case $1 in
  logout)
    logout_user
    ;;
  lock)
    lock_machine
    ;;
  suspend)
    suspend_machine
    ;;
  shutdown)
    shutdown_machine
    ;;
  reboot)
    reboot_machine
    ;;
  *)
    echo "Error: unkown operation '${1}'"
    usage
    exit 1
    ;;
esac

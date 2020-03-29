#!/usr/bin/env bash

set -eu

readonly screenshot="${HOME}/screenshot.png"
readonly screenshot_blur="${HOME}/screenshot_blur.png"
readonly lockscreen="${HOME}/lockscreen.png"

# Cleanup and reset EnergyStar settings
_revert() {
  for image in "${screenshot}" "${screenshot_blur}" "${lockscreen}"; do
    if [[ -f "${image}" ]]; then
      rm -f "${image}"
    fi
  done

  xset dpms 0 0 0
}
trap _revert EXIT

_usage() {
  cat << _EOF_

Description:
  Wrapper script for i3lock. Sets a blurred screenshot with an overlayed
  image as the lock screen background and blanks the screen after a set
  amount of time.

  Idea from: https://www.reddit.com/r/i3wm/comments/8hpjb6/i3_lock_screen

  Dependencies:
    * scrot
    * graphicsmagick
    * vips

Usage:
  $0 overlay_image [screen_timeout]

  Arguments:
    - overlay_image:  Required. Path to the image to be layed on top
                      of the screenshot.
    - screen_timeout: Optional. Time in seconds until the screen goes blank.
                      Defaults to 60.

Author:
  Jonas De Moor
_EOF_
}

# Usage: _die <message>
_die() {
  printf "Error: %s\n" "${1}"
  _usage
  exit 1
}

[[ "${#}" -lt 1 || "${#}" -gt 2 ]] && _die "Invalid number of arguments passed"
[[ -f "${1}" ]] || _die "Overlay image '${1}' doesn't exist"

readonly overlay_image="${1}"
readonly screen_timeout="${2:-60}"

scrot "${screenshot}"
vips gaussblur "${screenshot}" "${screenshot_blur}" 7
# TODO: Also use libvips for compositing, current openSUSE version is too old
gm composite -geometry -20x1200 -gravity Center "${overlay_image}" "${screenshot_blur}" "${lockscreen}"

xset +dpms dpms "${screen_timeout}" "${screen_timeout}" "${screen_timeout}"
i3lock -n -i "${lockscreen}"

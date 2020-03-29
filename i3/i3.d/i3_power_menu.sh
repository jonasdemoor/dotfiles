#!/usr/bin/env bash

set -euo pipefail

readonly power_script="${HOME}/i3.d/i3_power.sh"

declare -A choices=(
  [Lock screen]="lock"
  [Logout]="logout"
  [Suspend]="suspend"
  [Reboot]="reboot"
  [Shutdown]="shutdown"
)

choice=$(printf "%s\n" "${!choices[@]}" | sort | rofi -dmenu -i -l "${#choices[@]}")
"${power_script}" "${choices[${choice}]}"

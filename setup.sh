#!/usr/bin/env bash

set -eu

readarray -d "" dirs < <(find "${PWD}" -mindepth 1 -maxdepth 1 -type d -not -name ".*" -print0)
stow --target="${HOME}" --verbose "${dirs[@]##*/}"

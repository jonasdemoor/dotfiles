#!/usr/bin/env fish

# Disable fish greeting
set fish_greeting

set PATH $HOME/.rbenv/bin $HOME/.local/bin $PATH

# Environment variables
set -x BAT_THEME "ansi-dark"
set -x EDITOR "nvim"
set -x QT_QPA_PLATFORMTHEME "qt5ct"
set -x VAGRANT_DEFAULT_PROVIDER "libvirt"

# Aliases
alias b="bat"
alias e="edit"
alias g="git"
alias vi="nvim"
alias vim="nvim"

# Run on startup
if status --is-interactive
  source (rbenv init -|psub)
end

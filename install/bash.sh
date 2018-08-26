#!/usr/bin/env bash

# Inspired by https://github.com/webpro/dotfiles/blob/master/install/bash.sh
running "This is bash.sh. Checking bash installation"

if ! is-macos -o ! is-executable brew; then
  error "Skipped: Bash 4"
  return
fi

require_brew bash
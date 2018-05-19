#!/usr/bin/env bash

# Inspired (cloned by now) by https://github.com/webpro/dotfiles/blob/master/install/bash.sh
running "This is bash.sh. Checking bash installation"

if ! is-macos -o ! is-executable brew; then
  error "Skipped: Bash 4"
  return
fi

brew install bash
ok

# Setting bash4 as default shell 
# (not wanted, let's stick with zsh)

# grep "/usr/local/bin/bash" /private/etc/shells &>/dev/null || sudo bash -c "echo /usr/local/bin/bash >> /private/etc/shells"
# chsh -s /usr/local/bin/bash
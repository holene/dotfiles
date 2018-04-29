#!/usr/bin/env bash

# Inspired (cloned by now) by https://github.com/webpro/dotfiles/blob/master/install/bash.sh

if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Bash 4"
  return
fi

brew install bash

grep "/usr/local/bin/bash" /private/etc/shells &>/dev/null || sudo bash -c "echo /usr/local/bin/bash >> /private/etc/shells"
chsh -s /usr/local/bin/bash
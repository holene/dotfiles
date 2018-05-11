#!/usr/bin/env bash

# Inspired by https://github.com/webpro/dotfiles/blob/master/install/npm.sh

if ! is-executable brew -o ! is-executable git; then
  echo "Skipped: npm (missing: brew and/or git)"
  return
fi

brew install npm

export DOTFILES_BREW_PREFIX_NVM=`brew --prefix nvm`
set-config "DOTFILES_BREW_PREFIX_NVM" "$DOTFILES_BREW_PREFIX_NVM" "$DOTFILES_CACHE"

. "${DOTFILES_DIR}/system/.nvm"
nvm install 8
nvm alias default 8

# Globally install with npm

npm_packages=(
  nodemon
)

export npm_packages
npm install -g "${npm_packages[@]}"
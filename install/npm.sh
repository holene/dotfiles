#!/usr/bin/env bash

# Inspired by https://github.com/webpro/dotfiles/blob/master/install/npm.sh

running "This is npm.sh. Installing npm"

if ! is-executable brew -o ! is-executable git; then
  error "Skipped: npm (missing: brew and/or git)"
  return
fi

# Installing node version manager
brew install nvm

# Setting up some stuff
export DOTFILES_BREW_PREFIX_NVM=`brew --prefix nvm`
set-config "DOTFILES_BREW_PREFIX_NVM" "$DOTFILES_BREW_PREFIX_NVM" "$DOTFILES_CACHE"

# Installing node.js 8 with nvm
. "${DOTFILES_DIR}/system/.nvm"
nvm install 8
nvm alias default 8

# Globally install with npm
npm_packages=(
  nodemon
  vue
  vue-cli
  webpack 
)

# export npm_packages
npm install -g "${npm_packages[@]}"
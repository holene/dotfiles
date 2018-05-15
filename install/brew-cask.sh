#!/usr/bin/env bash

# Inspired by https://github.com/webpro/dotfiles/blob/master/install/brew-cask.sh

if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

brew tap caskroom/versions
brew tap caskroom/cask
brew tap caskroom/fonts

# Install packages

cask_apps=(
  alfred
  dash2
  dropbox
  flux
  google-chrome
  google-chrome-canary
  iterm2
  postman
  screenflow
  slack
  sourcetree
  spotify
  sublime-text
  virtualbox
  visual-studio-code
  vlc
)

export cask_apps
brew cask install "${cask_apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package qlvideo

# Link Hammerspoon config
if [ ! -d ~/.hammerspoon ]; then ln -sfv "$DOTFILES_DIR/etc/hammerspoon/" ~/.hammerspoon; fi
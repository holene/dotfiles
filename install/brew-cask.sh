#!/usr/bin/env bash

# Inspired by https://github.com/webpro/dotfiles/blob/master/install/brew-cask.sh

running "This is brew-casks.sh. Installing brew casks"

if ! is-macos -o ! is-executable brew; then
  error "Skipped: Homebrew-Cask"
  return
fi

action "installing caskroom/{versions, cask, fonts}"
brew tap caskroom/versions
brew tap caskroom/cask
brew tap caskroom/fonts
ok

# Install packages

cask_apps=(
  dropbox
  flux
)

cask_apps=(
  # alfred
  # caffeine
  # amphetamine
  bitwarden
  # dash2
  dropbox
  flux
  figma
  flycut
  fontbase
  google-chrome
  google-chrome-canary
  iterm2
  # kitemaker
  licecap
  # mactex
  miro
  messenger
  notion
  obsidian
  postman
  raycast
  # powershell
  # screenflow
  signal
  slack
  # sourcetree
  spotify
  superhuman
  # sublime-text
  # virtualbox
  visual-studio-code
  vlc
  whatsapp
  zoom
)

# export cask_apps
require_cask "${cask_apps[@]}"

# # Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
cask_qlplugins=(
  qlcolorcode
  qlstephen
  qlmarkdown
  quicklook-json
  qlimagesize
  webpquicklook
  suspicious-package
  qlvideo
)

# Installing quick look plugins
require_cask "${cask_qlplugins[@]}"

# # Link Hammerspoon config
# if [ ! -d ~/.hammerspoon ]; then ln -sfv "$DOTFILES_DIR/etc/hammerspoon/" ~/.hammerspoon; fi
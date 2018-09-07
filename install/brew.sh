#!/usr/bin/env bash

running "checking homebrew install"
brew_bin=$(which brew) 2>&1 > /dev/null
if [[ $? != 0 ]]; then
  action "installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if [[ $? != 0 ]]; then
      error "unable to install homebrew, script $0 abort!"
      exit 2
  fi
else
  ok
  # Make sure we’re using the latest Homebrew
  running "updating homebrew"
  brew update
  ok
  running "upgrading homebrew"
  brew upgrade
  ok
fi

# Installing packages
brew_apps=(
  coreutils
  git
  git-extras
  master
  pandoc
  python
  ruby
  tree
)

running "installing brew packages"
brew install "${brew_apps[@]}"
ok

# Remove outdated versions from the cellar.
running "removing outdated versions from the cellar"
brew cleanup
ok

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`

# not knowing what the hell is happenning here
set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"
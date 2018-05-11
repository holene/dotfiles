#!/usr/bin/env bash

if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Inspired by https://github.com/mathiasbynens/dotfiles/blob/master/brew.sh and https://github.com/webpro/dotfiles/blob/master/install/brew.sh

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Installing packages
apps=(
  coreutils
  git
  git-extras
  pandoc
  ruby
  python
)

export brew_apps
brew install "${brew_apps[@]}"

# Remove outdated versions from the cellar.
brew cleanup

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"
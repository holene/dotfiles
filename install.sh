#!/usr/bin/env bash

# Get current dir (so this script runs from anywhere)

export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR 
# DOTFILES_RESOURCES_DIR

# Setting directory helpers
# Extracting current directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
DOTFILES_EXTRA_DIR="$HOME/.extra"
# DOTFILES_RESOURCES_DIR="$DOTFILES_DIR/resources"

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first

# if is-executable git -a -d "$DOTFILES_DIR/.git"; then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; fi

# include my library helpers for colorized echo and require_brew, etc
source ./lib_sh/echos.sh
source ./lib_sh/requirers.sh

bot "Hi! I'm going to install tooling and tweak your system settings. Here I go..."

# Ask for the administrator password upfront
# if ! sudo grep -q "%wheel		ALL=(ALL) NOPASSWD: ALL #atomantic/dotfiles" "/etc/sudoers"; then

#   # Ask for the administrator password upfront
#   bot "I need you to enter your sudo password so I can install some things:"
#   sudo -v

#   # Keep-alive: update existing sudo time stamp until the script has finished
#   while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Execute python script for generating README.md

# Bunch of symlinks

# ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
# ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
# # ln -sfv "$DOTFILES_DIR/runcom/.gemrc" ~
# ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
# ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

# Package managers & packages

for file in ${DOTFILES_DIR}/install/*
do
  . ${file}
done

# . "$DOTFILES_DIR/install/xcode.sh"
# . "$DOTFILES_DIR/install/brew.sh"
# . "$DOTFILES_DIR/install/npm.sh"
# . "$DOTFILES_DIR/install/bash.sh"
# . "$DOTFILES_DIR/install/brew-cask.sh"

# Run tests

# if is-executable bats; then bats test/*.bats; else echo "Skipped: tests (missing: bats)"; fi

# # Install extra stuff

# if [ -d "$DOTFILES_EXTRA_DIR" -a -f "$DOTFILES_EXTRA_DIR/install.sh" ]; then
#   . "$DOTFILES_EXTRA_DIR/install.sh"
# fi

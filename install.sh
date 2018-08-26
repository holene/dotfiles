#!/usr/bin/env bash

# Get current dir (so this script runs from anywhere)

export DOTFILES_DIR DOTFILES_CACHE

# Setting directory helpers
# Extracting current directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"

# Make utilities available, adding them to path
PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first
if is-executable git -a -d "$DOTFILES_DIR/.git"; then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; fi

# include my library helpers for colorized echo and require_brew, etc
source ./lib_sh/echos.sh
source ./lib_sh/requirers.sh

bot "Let's do this! Holene's dotfile repo is running..."

# Ask for the administrator password upfront
if ! sudo grep -q "%wheel		ALL=(ALL) NOPASSWD: ALL #atomantic/dotfiles" "/etc/sudoers"; then

  # Ask for the administrator password upfront
  bot "I need you to enter your sudo password so I can install some things:"
  sudo -v

  # Keep-alive: update existing sudo time stamp until the script has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

  bot "Do you want me to setup this machine to allow you to run sudo without a password?\nPlease read here to see what I am doing:\nhttp://wiki.summercode.com/sudo_without_a_password_in_mac_os_x \n"

  read -r -p "Make sudo passwordless? [y|N] " response

  if [[ $response =~ (yes|y|Y) ]];then
      sudo cp /etc/sudoers /etc/sudoers.back
      echo '%wheel		ALL=(ALL) NOPASSWD: ALL #atomantic/dotfiles' | sudo tee -a /etc/sudoers > /dev/null
      sudo dscl . append /Groups/wheel GroupMembership $(whoami)
      bot "You can now run sudo commands without password!"
  fi
fi


# Setting up a bunch of symlinks

# ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
# ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
# # ln -sfv "$DOTFILES_DIR/runcom/.gemrc" ~
# ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
# ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

# Package managers & packages

# for file in ${DOTFILES_DIR}/install/*
# do
#   . ${file}
# done

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

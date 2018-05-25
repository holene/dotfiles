# If not running interactively, don't do anything

[ -z "$PS1" ] && return

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)

# uses greadlink if present 
READLINK=$(which greadlink || which readlink)
# grabs the name of the current file
CURRENT_SCRIPT=$BASH_SOURCE

# Finding script and dotfiles paths
# -n $CURRENT_SCRIPT --> true if nonzero
# -x $READLINK --> true if exists and executable
if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
  SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
  DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
# -d "$HOME/.dotfiles" --> true if exists and directory
elif [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi

# Make utilities available
PATH="$DOTFILES_DIR/bin:$PATH"

# Read cache
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
# true if $DOTFILES_CACHE exists and is a file
[ -f "$DOTFILES_CACHE" ] && . "$DOTFILES_CACHE"

# Finally we can source the dotfiles (order matters)
for DOTFILE in "$DOTFILES_DIR"/system/.{function,path,env,alias}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE EXTRAFILE

# Export
export DOTFILES_DIR DOTFILES_EXTRA_DIR

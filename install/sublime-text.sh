#export RES_DIR SUBL_DIR
RES_DIR="$DOTFILES_DIR/resources"
SUBL_DIR="$HOME/Library/Application Support/Sublime Text 3"

running "This is sublime-text.sh. Updating your Sublime Text preferences"

# Checking if SUBL_DIR exists
if [ ! -d "$SUBL_DIR" ]; then
    echo "$SUBL_DIR doesn't exist. Skipping " >&2
    return
fi

# Getting Sublime Text Package Control
curl -o "${SUBL_DIR}/Installed Packages/Package Control.sublime-package" "https://packagecontrol.io/Package%20Control.sublime-package"

# Copying sublime text resource files 
cp ${RES_DIR}/sublime-text/* "$SUBL_DIR/Packages/"

ok
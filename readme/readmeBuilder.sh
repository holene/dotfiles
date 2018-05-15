#!/usr/bin/env bash

# runs reamdeBuilder.py
# runs pandoc on all files 

# check if pandoc is installed, if not, install it with brew (it should be installed)
if ! hash pandoc 2>/dev/null; then
    brew install pandoc
fi

for 

# Creating readme.md
pandoc *.md > README.md

# Moving readme.md to top folder
mv README.md ../README.md
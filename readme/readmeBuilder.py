# Function for grabbing application lists from install/x.sh
import os
# cask_apps, brew_apps, npm_packages
lst = os.environ; 

def writeToFile(filename)
    filename = open('filename.md', 'w')
    for item in lst
        filename.write("* %s\n" % item)
    return "Wrote shit to " % filename

# eksporterer app-listevariabler fra shell-filene
# python-script som lager md-filer av de forskjellige variablene
# 
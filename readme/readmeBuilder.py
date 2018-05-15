# Function for grabbing application lists from install/x.sh
def writeToFile(filename, lst)
    filename = open('filename.md', 'w')
    for item in lst
        filename.write("* %s\n" % item)
    return "Wrote shit to " % filename

# eksporterer app-listevariabler fra shell-filene
# python-script som lager md-filer av de forskjellige variablene
# 
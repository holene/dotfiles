#!/bin/sh
# while [ "$#" -gt "0" ]; do
#   echo "\$1 is $1"
#   shift
# done
/usr/local/bin/my-command
if [[ "$?" -ne "0" ]]; then
  echo "Uhm, sorry, we encountered a problem there"
fi

#!/bin/sh
echo "I was called with $# paramteres"
echo "My name is `basename $0`"
echo "My first parameter is $1"
echo "My second parameter is $2"
echo "All my parameters are $@"

# for i in 1 2 3 4 5 6 7 8 9
# do
#   echo "This is my $i th parameter: `$`$i "
# done

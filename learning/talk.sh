#!/bin/sh
echo "Please talk to me, mofo"
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
    hello)
      echo "Hello yourself!"
      ;;
    bye)
      echo "See you again!"
      break
      ;;
    *)
      echo "I'm sorry, I don't understand..."
      ;;
  esac
done
echo
echo "That's all folks!"

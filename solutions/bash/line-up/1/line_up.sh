#!/usr/bin/env bash

suffix_for() {
  case $1 in
    *11 | *12 | *13)
      echo th
      ;;
    *1)
      echo st
      ;;
    *2)
      echo nd
      ;;
    *3)
      echo rd
      ;;
    *)
      echo th
      ;;
  esac
}

echo "$1, you are the $2$(suffix_for $2) customer we serve today. Thank you!"



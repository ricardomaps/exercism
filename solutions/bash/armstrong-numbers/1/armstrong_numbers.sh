#!/usr/bin/env bash

number=$1
total=0

for ((i = 0; i < ${#1}; i++)); do
  digit="${number:i:1}"
  ((total += digit ** ${#number}))
done

if ((number == total)); then
  echo "true"
else
  echo "false"
fi

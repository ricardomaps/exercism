#!/usr/bin/env bash

number=$1

[[ $number -le 0 ]] && echo "Error: Only positive integers are allowed" && exit 1

steps=0

while ((number != 1)); do
  ((steps++))
  ((number = number % 2 == 0 ? number / 2 : number * 3 + 1))
done

echo "$steps"

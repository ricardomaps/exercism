#!/usr/bin/env bash

allergies=(
  eggs
  peanuts
  shellfish
  strawberries
  tomatoes
  chocolate
  pollen
  cats
)

allergicTo() {
  local allergyScore=$1
  local allergy=$2
  for ((i = 0; i < ${#allergies[@]}; i++)); do
    if [[ "${allergies[$i]}" = "$allergy" ]]; then
      mask=$((1 << i))
      break
    fi
  done
  ((allergyScore & mask)) && echo "true" || echo "false"
}

list() {
  local allergyScore=$1
  local knownAllergies=()
  for ((i = 0; i < ${#allergies[@]}; i++)); do
    if (((1 << i) & allergyScore)); then
      knownAllergies+=("${allergies[$i]}")
    fi
  done
  echo "${knownAllergies[*]}"
}

case $2 in
  list)
    list "$1"
    ;;
  allergic_to)
    allergicTo "$1" "$3"
    ;;
esac

#!/usr/bin/env bash

series=$1
slice_length=$2
slices=()

[[ -z $series ]] && echo "series cannot be empty" && exit 1

[[ $slice_length -gt ${#series} ]] && echo "slice length cannot be greater than series length" && exit 1

[[ $slice_length -eq 0 ]] && echo "slice length cannot be zero" && exit 1

[[ $slice_length -lt 0 ]] && echo "slice length cannot be negative" && exit 1

for ((i = 0; i < ${#series} - slice_length + 1; i++)); do
  slice=${series:i:slice_length}
  slices[i]=$slice
done

IFS=" "; echo "${slices[*]}"

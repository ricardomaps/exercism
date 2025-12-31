#!/usr/bin/env bash


[[ $# -ne 2 ]] && echo "Usage: hamming.sh <string1> <string2>" && exit 1

strand1=$1
strand2=$2

[[ ${#strand1} -ne ${#strand2} ]] && echo "strands must be of equal length" && exit 1

hamming_distance=0

for ((i = 0; i < ${#strand1}; i++)); do
  nucleotide1=${strand1:i:1}
  nucleotide2=${strand2:i:1}
  if [[ "$nucleotide1" != "$nucleotide2" ]]; then
    ((hamming_distance++))
  fi
done

echo "$hamming_distance"


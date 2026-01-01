#!/usr/bin/env bash

strand=$1
declare -A nc=(
  ["A"]=0 ["G"]=0 ["T"]=0 ["C"]=0
)

[[ $strand =~ [^AGTC] ]] && echo "Invalid nucleotide in strand" && exit 1

for ((i = 0; i < ${#strand}; i++)); do
  nucleotide=${strand:i:1}
  ((nc[$nucleotide]++))
done

printf "A: %d\nC: %d\nG: %d\nT: %d" "${nc["A"]}" "${nc["C"]}" "${nc["G"]}" "${nc["T"]}"

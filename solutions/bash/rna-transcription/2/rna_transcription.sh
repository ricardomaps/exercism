#!/usr/bin/env bash

[[ $1 =~ [^AGTC] ]] && echo "Invalid nucleotide detected." && exit 1

echo "$1" | tr 'AGTC' 'UCAG'

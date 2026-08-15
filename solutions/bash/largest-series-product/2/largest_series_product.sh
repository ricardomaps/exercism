#!/usr/bin/env bash

series_product() {
  local product=1
  for ((i = 0; i < ${#1}; i++)); do
    local digit=${1:i:1}
    ((product *= digit))
  done
  echo "$product"
}

series=$1
span=$2

[[ ${#series} -lt $span ]] && echo "span must not exceed string length" && exit 1

[[ ! $series =~ ^[0-9]+$ ]] && echo "digits input must only contain digits" && exit 1

[[ $span -lt 0 ]] && echo "span must not be negative" && exit 1

largest_series_product=0

for ((i = 0; i < ${#series} - span + 1; i++)); do
  product=$(series_product "${series:i:span}")
  [[ $product -gt $largest_series_product ]] && largest_series_product=$product
done

echo "$largest_series_product"

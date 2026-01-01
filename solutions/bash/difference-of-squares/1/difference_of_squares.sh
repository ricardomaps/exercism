#!/usr/bin/env bash

sumOfSquares() {
  total=0
  for ((n = 1; n <= number; n++)); do
    ((total += n * n))
  done
  echo "$total"
}

squareOfSum() {
  total=0
  for ((n = 1; n <= number; n++)); do
    ((total += n))
  done
  echo "$((total *= total))"
}

number=$2

case $1 in

  difference)
    square_of_sum=$(squareOfSum)
    sum_of_squares=$(sumOfSquares)
    echo "$((square_of_sum - sum_of_squares))"
    ;;
  square_of_sum)
    squareOfSum
    ;;
  sum_of_squares)
    sumOfSquares
    ;;
esac

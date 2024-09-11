module Squares (difference, squareOfSum, sumOfSquares) where


difference :: Integral a => a -> a
difference n = (squareOfSum n) - (sumOfSquares n)

squareOfSum :: Integral a => a -> a
squareOfSum n = 
  let sumOfRange = sum [1..n]
  in sumOfRange * sumOfRange

sumOfSquares :: Integral a => a -> a
sumOfSquares n = 
  sum $ map (\x -> x * x) [1..n]

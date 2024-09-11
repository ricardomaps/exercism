module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n
  | n < 1 = Nothing
  | aliquotSum < n = Just Deficient
  | aliquotSum == n = Just Perfect
  | otherwise = Just Abundant
  where 
  divisibleBy n m = n `mod` m == 0 
  aliquotSum = sum $ filter (divisibleBy n) [1..n `div` 2]
  

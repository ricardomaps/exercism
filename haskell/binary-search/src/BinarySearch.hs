module BinarySearch (find) where

import Data.Array

binSearch :: Ord a => Array Int a -> a -> Int -> Int -> Maybe Int
binSearch array target start end
    | start > end = Nothing
    | middleValue == target = Just middle
    | middleValue > target = binSearch array target start (middle-1)
    | otherwise = binSearch array target (middle+1) end
    where middle = (end + start) `div` 2
          middleValue = array ! middle

find :: Ord a => Array Int a -> a -> Maybe Int
find array x = binSearch array x start end
  where
  (start, end) = bounds array
  
module SumOfMultiples (sumOfMultiples) where
import Data.List (nub, sum)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum . nub $ concatMap multiplesBelowLimit factors
    where 
    multiplesBelowLimit b
      | b == 0 = [0]
      | otherwise = takeWhile (< limit) $ iterate (+b) b

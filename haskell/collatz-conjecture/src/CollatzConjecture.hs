module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n = recurWhileNotOne n 0
  where recurWhileNotOne n acc
          | n < 1 = Nothing
          | n == 1 = Just acc
          | n `mod` 2 == 0 = recurWhileNotOne (n `div` 2) (acc+1)
          | otherwise = recurWhileNotOne (3*n+1) (acc+1)

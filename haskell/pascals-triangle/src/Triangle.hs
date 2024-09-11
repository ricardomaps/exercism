module Triangle (rows) where

pascalTriangle :: [[Integer]]
pascalTriangle = iterate (\prev -> zipWith (+) (0:prev) (prev++[0])) [1]

rows :: Int -> [[Integer]]
rows x = take x pascalTriangle

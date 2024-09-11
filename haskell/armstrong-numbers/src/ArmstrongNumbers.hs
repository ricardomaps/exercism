module ArmstrongNumbers (armstrong) where
import Data.Char (digitToInt)

armstrong :: Integral a => a -> Bool
armstrong number = 
  let string = show number
      digits = length string
  in number == (sum $ map (\x -> (digitToInt x)^^digits) string)

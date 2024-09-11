module RotationalCipher (rotate) where
import Data.Char(isLower, isUpper, toUpper)
import Data.Maybe(fromMaybe)

rotate :: Int -> String -> String
rotate n = map helper
  where
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  createMapping a = zip a (drop n . cycle $ a)
  mapping = createMapping alphabet ++ createMapping (map toUpper alphabet)
  helper c = fromMaybe c $ lookup c mapping

module Sublist (sublist) where
import Data.List (isInfixOf)

sublist :: [a] -> [a] -> Maybe Ordering
sublist xs ys =
  case comparing length xs ys of
    EQ -> if xs == ys then Just EQ else Nothing
    LT -> if xs `isInfinxOf` ys then Just LT else Nothing
    GT -> if ys `isInfinxOf` ys then Just GT else Nothing

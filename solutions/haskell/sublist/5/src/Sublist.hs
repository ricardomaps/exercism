module Sublist (sublist) where
import Data.List (isInfixOf)
import Data.Ord (comparing)

sublist :: Eq a => [a] -> [a] -> Maybe Ordering
sublist xs ys =
  case comparing length xs ys of
    EQ -> if xs == ys then Just EQ else Nothing
    LT -> if xs `isInfixOf` ys then Just LT else Nothing
    GT -> if ys `isInfixOf` xs then Just GT else Nothing

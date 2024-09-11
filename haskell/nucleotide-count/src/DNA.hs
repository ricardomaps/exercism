module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map as Map

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = 
  count xs (Map.fromList [(A, 0), (G, 0), (C, 0), (T, 0)]) 
  where
  count [] m = Right m
  count (n:ns) m = 
    case n of
      'A' -> count ns (adjust succ A m) 
      'G' -> count ns (adjust succ G m)
      'T' -> count ns (adjust succ T m)
      'C' -> count ns (adjust succ C m)
      _ -> Left "Invalid dna strand"
module DNA (nucleotideCounts, Nucleotide(..)) where
import Data.Map as Map
import Data.Char (toUpper)
import Data.List (all)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show, Read)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs
  | isValid xs = Right $ countNucl xs
  | otherwise = Left xs
  where
  isValid = all (`elem` "AGCT")
  countNucl xs = Map.fromListWith (+) [(read [toUpper c], 1)| c <- xs]

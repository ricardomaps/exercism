module ProteinTranslation(proteins) where

chunked :: Int -> [a] -> [[a]]
chunked _ [] = []
chunked n l = take n l : chunked n (drop n l)

convert :: String -> Maybe String
convert x
  | x == "AUG" = Just "Methionine"
  | x `elem` ["UUU", "UUC"] = Just "Phenylalanine"
  | x `elem` ["UUA", "UUG"] = Just "Leucine"
  | x `elem` ["UCU", "UCC", "UCA", "UCG"] = Just "Serine"
  | x `elem` ["UAU", "UAC"] = Just "Tyrosine"
  | x `elem` ["UGU", "UGC"] = Just "Cysteine"
  | x == "UGG" = Just "Tryptophan"
  | x `elem` ["UAA", "UAG", "UGA"] = Just "STOP"
  | otherwise = Nothing

proteins :: String -> Maybe [String]
proteins = fmap (takeWhile (/= "STOP")) . traverse convert . chunked 3

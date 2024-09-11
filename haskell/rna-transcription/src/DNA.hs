module DNA (toRNA) where

dnaToRna :: Char -> Either Char Char
dnaToRna 'A' = Right 'U'
dnaToRna 'T' = Right 'A'
dnaToRna 'G' = Right 'C'
dnaToRna 'C' = Right 'G'
dnaToRna n = Left n

toRNA :: String -> Either Char String
toRNA = mapM dnaToRna
  
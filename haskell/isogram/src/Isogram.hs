module Isogram (isIsogram) where
import Data.List(nub)
import Data.Char(toLower, isLetter)

isIsogram :: String -> Bool
isIsogram = ((==) <$> nub <*> id) . map toLower . filter isLetter

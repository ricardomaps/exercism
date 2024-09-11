module Atbash (decode, encode) where
import Data.Char(isAlphaNum, toLower)
import Data.Maybe(fromMaybe)
import Data.List(intercalate)

alphabet :: String
alphabet = "abcdefghijklmnopqrstuvwxyz"

mappingTo :: [(Char, Char)]
mappingTo = zip alphabet (reverse alphabet)

mappingFrom :: [(Char, Char)]
mappingFrom = zip (reverse alphabet) alphabet

chunk :: String -> [String]
chunk [] = []
chunk s = take 5 s : chunk (drop 5 s)

split :: String -> String
split = intercalate " " . chunk

translate :: [(Char, Char)] -> Char -> Char
translate mapping c = fromMaybe c (lookup c mapping)

decode :: String -> String
decode = map (translate mappingFrom) . filter isAlphaNum

encode :: String -> String
encode = split . map (translate mappingTo . toLower) . filter isAlphaNum

module Bob (responseFor) where
import Data.List (all, dropWhile)
import Data.Char (isUpper, isSpace, isLetter)

trimr :: String -> String
trimr = reverse . dropWhile (\x -> isSpace x) . reverse

isQuestion :: String -> Bool
isQuestion p = let tp = trimr p in if null tp then False else last tp == '?'

isYell :: String -> Bool
isYell phrase = let letters = filter (\x -> isLetter x) phrase in not (null letters) && all (\x -> isUpper x) letters

isSilence :: String -> Bool
isSilence = null . filter (\x -> not $ isSpace x)

responseFor :: String -> String
responseFor xs
	| isQuestion xs = if isYell xs then "Calm down, I know what I'm doing!" else "Sure."
	| isYell xs = "Whoa, chill out!"
	| isSilence xs = "Fine. Be that way!"
	| otherwise = "Whatever."

module Brackets (arePaired) where

arePaired :: String -> Bool
arePaired xs = go (filter (`elem` "()[]{}") xs) []
  where
  go [] [] = True
  go (')':xs) ('(':st) = go xs st 
  go ('}':xs) ('{':st) = go xs st
  go (']':xs) ('[':st) = go xs st
  go ('(':xs) st = go xs ('(':st)
  go ('[':xs) st = go xs ('[':st)
  go ('{':xs) st = go xs ('{':st)
  go _ _ = False

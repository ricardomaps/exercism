module ETL (transform) where

import Data.Map as Map
import Data.Char (toLower)

transform :: Map a String -> Map Char a
transform legacyData = Map.fromList [(toLower c, p) | (p, s) <- assocs legacyData, c <- s]

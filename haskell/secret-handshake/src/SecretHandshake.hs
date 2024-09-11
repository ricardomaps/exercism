module SecretHandshake (handshake) where
import Data.Bits (testBit)

handshake :: Int -> [String]
handshake n = 
  reverseActions $ map snd $ filter (\(idx, _) -> testBit n idx) actionsIndexed
  where 
  actionsIndexed = zip [0..] ["wink", "double blink", "close your eyes", "jump"]
  reverseActions = if testBit n 4 then reverse else id

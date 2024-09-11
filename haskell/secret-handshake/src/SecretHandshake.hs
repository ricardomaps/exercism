module SecretHandshake (handshake) where
import Data.Bits (testBit)

handshake :: Int -> [String]
handshake n = 
  reverseActions $ map snd $ filter (\x -> testBit n (fst x)) actions
  where 
  actions = zip [0..] ["wink", "double blink", "close your eyes", "jump"]
  reverseActions = if testBit n 4 then reverse else id

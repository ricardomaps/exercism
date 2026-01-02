module StateOfTicTacToe (gameState, GameState(..)) where
import Data.List (transpose)

data GameState = WinX | WinO | Draw | Ongoing | Impossible deriving (Eq, Show)

gameState :: [String] -> GameState
gameState rows
  | x /= o && x /= o + 1 = Impossible 
  | xWin && oWin = Impossible
  | xWin && x > o = WinX
  | oWin && x == o = WinO
  | xWin || oWin = Impossible
  | x + o == 9 = Draw
  | otherwise = Ongoing
  where
  x = sum . map (length . filter (== 'X')) $ rows
  o = sum . map (length . filter (== 'O')) $ rows
  toCheck =
    let
      cols = transpose rows
      dias = [
          [rows !! 0 !! 0, rows !! 1 !! 1, rows !! 2 !! 2],
          [rows !! 0 !! 2, rows !! 1 !! 1, rows !! 2 !! 0]
        ]
    in rows ++ cols ++ dias
  xWin = any (all (== 'X')) toCheck
  oWin = any (all (== 'O')) toCheck

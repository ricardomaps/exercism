module StateOfTicTacToe (gameState, GameState(..)) where

data GameState = WinX | WinO | Draw | Ongoing | Impossible deriving (Eq, Show)

gameState :: [String] -> GameState
gameState board
  | x /= o && x /= o + 1 = Impossible 
  | xWin && x > o = WinX
  | oWin && x == o = WinO
  | xWin || oWin = Impossible
  | x + o == 9 = Draw
  | otherwise = Ongoing
  where
  x = length . filter (== 'X') board
  o = length . filter (== 'O') board
  toCheck =
    let
      rows = chunk board
      cols = transpose rows
      dias = [
        [rows !! 0 !! 0, rows !! 1 !! 1, rows !! 2 !! 2],
        [rows !! 0 !! 2, rows !! 1 !! 1, rows !! 2 !! 0]
      ]
    in rows ++ cols ++ dias
  xWin = any (all (== 'X')) toCheck
  oWin = any (all (== 'O')) toCheck
  chunk []    = []
  chunk board = take 3 board : chunk (drop 3 board) 


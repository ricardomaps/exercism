module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

data BST a = Nil | Node (BST a) a (BST a) deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft Nil = Nothing
bstLeft (Node left _ _) = Just left 

bstRight :: BST a -> Maybe (BST a)
bstRight Nil = Nothing
bstRight (Node _ _ right) = Just right 

bstValue :: BST a -> Maybe a
bstValue Nil = Nothing
bstValue (Node _ value _) = Just value

empty :: BST a
empty = Nil

fromList :: Ord a => [a] -> BST a
fromList = foldl (flip insert) empty

insert :: Ord a => a -> BST a -> BST a
insert x Nil = singleton x
insert x (Node left value right)
  | x <= value = Node (insert x left) value right
  | otherwise = Node left value (insert x right)

singleton :: a -> BST a
singleton x = Node Nil x Nil

toList :: BST a -> [a]
toList Nil = []
toList (Node left value right) = (toList left) ++ [value] ++ (toList right)

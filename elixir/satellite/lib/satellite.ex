defmodule Satellite do
  @typedoc """
  A tree, which can be empty, or made from a left branch, a node and a right branch
  """
  @type tree :: {} | {tree, any, tree}

  @doc """
  Build a tree from the elements given in a pre-order and in-order style
  """
  @spec build_tree(preorder :: [any], inorder :: [any]) :: {:ok, tree} | {:error, String.t()}
  def build_tree(preorder, inorder) do
    with :ok <- test_length(preorder, inorder),
     :ok <- test_repeated(preorder, inorder),
     :ok <- test_consistent(preorder, inorder)
    do
      {:ok, do_build_tree(preorder, inorder)}
    end
  end

  defp test_length(preorder, inorder) do
    if length(preorder) != length(inorder) do
      {:error, "traversals must have the same length"}
    else
      :ok
    end
  end

  defp test_repeated(preorder, inorder) do
    if Enum.uniq(preorder) != preorder or Enum.uniq(inorder) != inorder do
      {:error, "traversals must contain unique items"}
    else
      :ok
    end
  end

  defp test_consistent(preorder, inorder) do
    if Enum.sort(preorder) != Enum.sort(inorder) do
      {:error, "traversals must have the same elements"}
    else
      :ok
    end
  end

  defp do_build_tree([], []), do: {}
  defp do_build_tree([val|preorder], inorder) do
     {left_in, [_|right_in]} = Enum.split_while(inorder, fn e -> e != val end)
     {left_pre, right_pre} = Enum.split(preorder, length(left_in))
     left_subtree = do_build_tree(left_pre, left_in)
     right_subtree = do_build_tree(right_pre, right_in)
     {left_subtree, val, right_subtree}
  end
end

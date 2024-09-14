defmodule PalindromeProducts do
  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: map
  def generate(max, min \\ 1)
  def generate(max, min) when max < min, do: raise(ArgumentError)

  def generate(max, min) do
    for n1 <- min..max, n2 <- n1..max, palindrome?(n1 * n2), reduce: %{} do
      acc -> Map.update(acc, n1 * n2, [[n1, n2]], fn pal -> pal ++ [[n1, n2]] end)
    end
  end

  defp palindrome?(number, 0, rev) when number == rev, do: true
  defp palindrome?(_number, 0, _rev), do: false

  defp palindrome?(number, acc, rev),
    do: palindrome?(number, div(acc, 10), rev * 10 + rem(acc, 10))

  defp palindrome?(number), do: palindrome?(number, number, 0)
end

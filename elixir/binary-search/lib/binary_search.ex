defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key), do: do_search(numbers, key, 0, tuple_size(numbers)-1)
  defp do_search(_numbers, _key, start, stop) when start > stop, do: :not_found
  defp do_search(numbers, key, start, stop) do
    mid = div(start + stop, 2)
    mid_elem = elem(numbers, mid)
    cond do
      mid_elem == key -> {:ok, mid}
      mid_elem < key -> do_search(numbers, key, mid+1, stop)
      true -> do_search(numbers, key, start, mid-1)
    end
  end
end

defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    Enum.filter(factors, fn factor -> factor != 0 end)
    |> Enum.flat_map(fn factor ->
      Stream.iterate(factor, fn acc -> acc + factor end)
      |> Enum.take_while(fn val -> val < limit end)
    end)
    |> Enum.uniq()
    |> Enum.sum()
  end
end

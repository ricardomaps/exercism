defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
    def classify(number) when number <= 0, do: {:error, "Classification is only possible for natural numbers."}
    def classify(1), do: {:ok, :deficient}
    def classify(number) do
      sum_of_factors = Enum.reduce(1..div(number, 2), 0, fn n, acc -> if rem(number, n) == 0, do: acc+n, else: acc end)
      cond do
	      sum_of_factors == number -> {:ok, :perfect}
	      sum_of_factors < number -> {:ok, :deficient}
	      sum_of_factors > number -> {:ok, :abundant}
      end
    end

end

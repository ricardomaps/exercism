defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input), do: calc_loop(input, 0)
  defp calc_loop(1, steps), do: steps
  defp calc_loop(input, steps) when rem(input, 2) == 0, do: calc_loop(div(input, 2), steps+1)
  defp calc_loop(input, steps), do: calc_loop(3*input+1, steps+1)
end

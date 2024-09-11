defmodule CollatzConjecture do
  defp calc_loop(input, steps) do
    cond do
	  input == 1 -> steps
	  rem(input, 2) == 0 -> calc_loop(div(input, 2), steps+1)
	  :else -> calc_loop(3*input+1, steps+1)
    end
  end
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when input > 0 and is_integer(input) do
    calc_loop(input, 0)
  end
end

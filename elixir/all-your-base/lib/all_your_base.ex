defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_, input_base, _) when input_base < 2,
    do: {:error, "input base must be >= 2"}
  def convert(_, _, output_base) when output_base < 2,
    do: {:error, "output base must be >= 2"}
  def convert(digits, input_base, output_base) do
    if Enum.any?(digits, fn digit -> digit < 0 or digit >= input_base end) do
      {:error, "all digits must be >= 0 and < input base"}
    else
      Enum.reduce(digits, 0, fn digit, acc ->
        digit + acc * input_base
      end)
      |> Stream.unfold(fn
        0 -> nil
        n -> {rem(n, output_base), div(n, output_base)}
      end)
      |> Enum.to_list()
      |> Enum.reverse()
      |> then(fn
        [] -> {:ok, [0]}
        ans -> {:ok, ans} 
      end)
    end
  end
end

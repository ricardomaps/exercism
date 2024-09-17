defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    s = String.downcase(sentence) |>  String.to_charlist()
    ~c"abcdefghijklmnopqrstuvwxyz"
    |> Enum.all?(&Enum.member?(s, &1))
  end
end

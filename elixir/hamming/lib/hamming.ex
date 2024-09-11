defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) do
    Enum.zip(strand1, strand2)
    |> Enum.reduce(0, fn ([el_first, el_second], acc) ->
                            if el_first == el_second do
                              acc + 1
                            else
                              acc
                            end end)
  end
end

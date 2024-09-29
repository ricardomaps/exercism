defmodule RnaTranscription do
  @complements %{?A => ?U, ?T => ?A, ?G => ?C, ?C => ?G}
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

    iex> RnaTranscription.to_rna(~c"ACTG")
    ~c"UGAC"
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, fn n -> @complements[n] end)
  end
end

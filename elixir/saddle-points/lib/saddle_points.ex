defmodule SaddlePoints do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(str) do
    for line <- String.split(str, "\n", trim: true) do
      for n <- String.split(line, " ", trim: true) do
        String.to_integer(n)
      end
    end
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str) do
    rows(str) |> Enum.zip() |> Enum.map(&Tuple.to_list/1)
  end

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    for {row, i} <- Enum.with_index(rows(str), 1),
        {col, j} <- Enum.with_index(columns(str), 1),
        Enum.min(col) == Enum.max(row)
    do
      {i, j}
    end
  end
end

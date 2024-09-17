defmodule Minesweeper do
  @doc """
  Annotate empty spots next to mines with the number of mines next to them.
  """
  @spec annotate([String.t()]) :: [String.t()]
  def annotate([]), do: []
  def annotate([""|_] = board), do: board
  def annotate(board) do
    m = length(board)
    n = String.length(Enum.at(board, 0))
    minefield = for {row, i} <- Enum.with_index(board), {cell, j} <- Enum.with_index(String.graphemes(row)), into: %{}, do: {{i, j}, cell}
    for i <- 0..m-1 do
      for j <- 0..n-1, into: "" do
        case minefield[{i, j}] do
          " " -> find_adjacent_mines(minefield, i, j)
          c -> c
        end
      end
    end
  end
  defp find_adjacent_mines(minefield, i, j) do
    neighbors = for x <- [-1, 0, 1], y <- [-1, 0, 1], {x, y} != {0, 0}, do: {x + i, y + j}
    adj_mines = Enum.count(neighbors, &Map.get(minefield, &1) == "*")
    if adj_mines == 0, do: " ", else: Integer.to_string(adj_mines)
  end
end

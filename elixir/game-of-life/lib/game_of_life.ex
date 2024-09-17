defmodule GameOfLife do
  @doc """
  Apply the rules of Conway's Game of Life to a grid of cells
  """

  @spec tick(matrix :: list(list(0 | 1))) :: list(list(0 | 1))
  def tick(matrix) do
    board =  build_board(matrix)

    for {line, i} <- Enum.with_index(matrix) do
      for {cell, j} <- Enum.with_index(line) do
        live_neighbors = count_live_neighbors(board, i, j)
        case cell do
          0 when live_neighbors == 3 -> 1
          1 when live_neighbors in [2, 3] -> 1
          _ -> 0
        end
      end
    end
  end

  defp count_live_neighbors(board, i, j) do
    neighbors = for x <- [-1, 0, 1], y <- [-1, 0, 1], {x, y} != {0, 0}, do: {x + i, y + j}
    Enum.count(neighbors, fn neigh -> board[neigh] == 1 end)
  end

  defp build_board(matrix) do
    for {line, i} <- Enum.with_index(matrix),
        {cell, j } <- Enum.with_index(line),
        into: %{}
    do
      {{i, j}, cell}
    end
  end
end

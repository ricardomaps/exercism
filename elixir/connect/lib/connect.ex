defmodule Connect do
  @doc """
  Calculates the winner (if any) of a board
  using "O" as the white player
  and "X" as the black player
  """
  @spec result_for([String.t()]) :: :none | :black | :white
  def result_for(board_repr) do
    board = build_board(board_repr)
    visited = build_visited(board)

    cond do
      win?(:white, board, visited) ->
      win?(:black, board, visited) -> 
      true -> :none
    end
  end

  defp build_board(board_repr) do
    for {row, i} <- Enum.with_index(board_repr),
        {cell, j} <- Enum.with_index(to_charlist(row)),
        into: %{}
    do
        {{i, j}, cell}
    end
  end

  defp build_visited(board) do
    for {{i, j}, _} <- board, into: %{}, do: {{i, j}, false}
  end

  defp win?(player, board, visited) do
    starting_points = get_starting_points(player)
    Enum.reduce_while(starting_points, visited, fn start, visited -> 
      {found, visited} = connected?(board, start)
      if found do
        {:halt, }
      else
      end
    end)
  end

  defp unvisited_neighbors({i, j} = curr, board, visited) do
    [{i-1, j}, {i-1, j+1}, {i, j-1}, {i, j+1}, {i+1, j-1}, {i+1, j}]
    |> Enum.filter(fn neigh -> board[neigh] == board[curr] and not visited[neigh] end)
  end

  defp starting_points(:black, board) do
    Stream.iterate(0, fn acc -> acc + 1 end)
    |> Enum.take_while(&Map.has_key?(board, {0, &1}))
    |> Enum.filter(fn pos -> board[pos] == "X" end)
  end
  
  defp starting_points(:white, board) do
    Stream.iterate(0, fn acc -> acc + 1 end)
    |> Enum.take_while(&Map.has_key?(board, {&1, 0}))
    |> Enum.filter(fn pos -> board[pos] == "O" end)
  end
end

defmodule StateOfTicTacToe do
  @doc """
  Determine the state a game of tic-tac-toe where X starts.
  """
  @spec game_state(board :: String.t()) :: {:ok, :win | :ongoing | :draw} | {:error, String.t()}
  def game_state(board) do
   
    with {:ok, count_X, count_O} <- validate_turns(board),
      do
    else 
      err -> err
    end
    
  end
  defp validate_turns(board) do
     %{?O => count_O, ?X => count_X} = 
      String.to_charlist(board) |> Enum.frequencies()
      cond do
        count_O > count_X  -> {:error, "Wrong turn order: O started"}
        cont_O < count_X - 1 -> {:error, "Wrong turn order: X went twice"}
        true -> {:ok count_X, count_O}
      end
end

defmodule Tournament do
  defmodule Stats do
    defstruct [mp: 0, w: 0, d: 0, l: 0, p: 0]
  end

  defp update_loss(acc, team) do
    Map.update(acc, team, %Stats{l: 1, mp: 1}, fn stats -> %Stats{stats | l: stats.l + 1, mp: stats.mp + 1} end)
  end
  defp update_win(acc, team) do
    Map.update(acc, team, %Stats{w: 1, mp: 1, p: 3}, fn stats -> %Stats{stats | w: stats.w + 1, p: stats.p + 3, mp: stats.mp + 1} end)
  end
  defp update_draw(acc, team) do
    Map.update(acc, team, %Stats{d: 1, mp: 1, p: 1}, fn stats -> %Stats{stats | d: stats.d + 1, p: stats.p + 1, mp: stats.mp + 1} end)
  end
  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """
  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    Enum.map(input, fn s -> 
      String.split(s, ";") |> List.to_tuple()
    end)
    |> Enum.reduce(%{}, fn 
      {team1, team2, result}, acc -> 
          case result do
            "win" ->
              update_win(acc, team1) |> update_loss(team2)
            "loss" ->
              update_loss(acc, team1) |> update_win(team2)
            "draw" ->
              update_draw(acc, team1) |> update_draw(team2)
            _ -> acc
          end
      _match, acc -> acc
    end)
    |> Map.to_list()
    |> Enum.sort_by(fn {_name, %Stats{p: points} = _stats} -> -points end)
    |> Enum.map(fn {name, stats} -> 
        String.pad_trailing(name, 30)
        <> " | " <> String.pad_leading(to_string(stats.mp), 2)
        <> " | " <> String.pad_leading(to_string(stats.w), 2)
        <> " | " <> String.pad_leading(to_string(stats.d), 2)
        <> " | " <> String.pad_leading(to_string(stats.l), 2)
        <> " | " <> String.pad_leading(to_string(stats.p), 2)
      end)
    |> then(fn lines -> ["Team                           | MP |  W |  D |  L |  P"|lines] end)
    |> Enum.join("\n")
  end
end

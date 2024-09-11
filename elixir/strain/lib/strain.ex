defmodule Strain do
  defp do_keep([], _fun, acc), do: Enum.reverse(acc)
  defp do_keep([elem|rest], fun, acc) do
    if fun.(elem), do: do_keep(rest, fun, [elem|acc]), else: do_keep(rest, fun, acc)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    do_keep(list, fun, [])
  end

  defp do_discard([], _fun, acc), do: Enum.reverse(acc)
  defp do_discard([elem|rest], fun, acc) do
    if not fun.(elem), do: do_discard(rest, fun, [elem|acc]), else: do_discard(rest, fun, acc)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    do_discard(list, fun, [])
  end

end

defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(as, bs) do
    case {sublist?(as, bs), sublist?(bs, as)} do
      {true, true} -> :equal
      {true, false} -> :sublist
      {false, true} -> :superlist
      {false, false} -> :unequal
    end
  end
  defp sublist?(as, [_|tl] = bs), do: if(prefix?(as, bs), do: true, else: sublist?(as, tl))
  defp sublist?(as, []), do: as == []
  defp prefix?([a|as], [b|bs]) when a === b, do: prefix?(as, bs)
  defp prefix?([], _bs), do: true
  defp prefix?(_as, _bs), do: false
end

defmodule RotationalCipher do
  defp shift_letter(codepoint, shift, base) do
    position = rem(codepoint, base)
    rem(position+shift, 26) + base
  end
  defp shift_letter(codepoint, shift) do
    cond do
      codepoint >= ?a and codepoint <= ?z -> shift_letter(codepoint, shift, ?a)
      codepoint >= ?A and codepoint <= ?Z -> shift_letter(codepoint, shift, ?A)
      :else -> codepoint
    end
  end
  defp do_rotate([], _shift, acc), do: Enum.reverse(acc) |> List.to_string()
  defp do_rotate([first|rest], shift, acc) do
    rotated = shift_letter(first, shift)
    do_rotate(rest, shift, [rotated|acc])
  end
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    do_rotate(String.to_charlist(text), shift, [])
  end
end
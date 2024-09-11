defmodule SecretHandshake do
  import Bitwise
  @actions {"wink", "double blink", "close your eyes", "jump"}
  defp do_commands(code, shift, acc) when shift == 4 do
    if (1 &&& code >>> shift) == 1 do
      Enum.reverse(acc)
    else
      acc
    end
  end
  defp do_commands(code, shift, acc) do
    if (1 &&& code >>> shift) == 1 do
      do_commands(code, shift+1, acc ++ [elem(@actions, shift)])
    else
      do_commands(code, shift+1, acc)
    end
  end
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    do_commands(code, 0, [])
  end
end


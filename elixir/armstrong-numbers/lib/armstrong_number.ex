defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = Integer.digits(number)
    total_digits = length(digits)
    Enum.map(digits, &Integer.pow(&1, total_digits))
    |> Enum.sum()
    |> then(fn armstrong_sum -> armstrong_sum == number end)
  end
end

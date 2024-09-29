defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a, b}, {c, d}) do
    {a * d + b * c, c * d} |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a, b}, {c, d}) do
    add({a, b}, {-c, d})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a, b}, {c, d}) do
    {a * b, c * d} |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a, b}, {c, d}) do
    multiply({a, b}, {d, c})
  end

  @doc """
  Kernel.absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}) do
    {Kernel.abs(a), Kernel.abs(b)} |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a, b}, n) when n < 0, do: pow_rational({b, a}, -n)
  def pow_rational({a, b}, n) do
    {Integer.pow(a, n), Integer.pow(b, n)} |> reduce()
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}) do
    x ** (a/b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a, b}) do
    gcd = Integer.gcd(a, b) |> Kernel.abs()
    ans = {div(a, gcd), div(b, gcd)}
    case ans do
      {x, y} when y < 0 -> {-x, -y}
      ans -> ans
    end
  end
end

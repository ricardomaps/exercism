defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l, acc \\ 0)
  def count([], acc), do: acc
  def count([_|tl], acc), do: count(tl, acc+1)

  @spec reverse(list) :: list
  def reverse(l, acc \\ [])
  def reverse([], acc), do: acc
  def reverse([h|tl], acc), do: reverse(tl, [h|acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f, acc \\ [])
  def map([], _f, acc), do: reverse(acc)
  def map([h|tl], f, acc), do: map(tl, f, [f.(h)|acc])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f, acc \\ [])
  def filter([], _f, acc), do: reverse(acc)
  def filter([h|tl], f, acc) do
    if f.(h) do
      filter(tl, f, [h|acc])
    else
      filter(tl, f, acc)
    end
  end

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl([], acc, _f), do: acc
  def foldl([h|tl], acc, f), do: foldl(tl, f.(h, acc), f)

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr([], acc, _f), do: acc
  def foldr([h|tl], acc, f), do: f.(h, foldr(tl, acc, f))

  @spec append(list, list) :: list
  def append(as, bs, acc \\ [])
  def append([], [], acc), do: reverse(acc)
  def append([], [b|bs], acc), do: append([], bs, [b|acc])
  def append([a|as], bs, acc), do: append(as, bs, [a|acc])

  @spec concat([[any]]) :: [any]
  def concat(ll) do
     foldl(ll, [], fn l, acc -> foldl(l, acc, fn x, a -> [x|a] end) end)
     |> reverse()
  end
end

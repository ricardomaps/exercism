defmodule CustomSet do
  @opaque t :: %__MODULE__{map: map}
  defstruct [map: %{}]

  @spec new(Enum.t()) :: t
  def new(enumerable) do
      %__MODULE__{map: Map.new(enumerable, fn key -> { key, true } end)}
  end

  @spec empty?(t) :: boolean
  def empty?(custom_set) do
    map_size(custom_set.map) == 0
  end

  @spec contains?(t, any) :: boolean
  def contains?(custom_set, element) do
    Map.has_key?(custom_set.map, element)
  end

  @spec subset?(t, t) :: boolean
  def subset?(custom_set_1, custom_set_2) do
    Enum.all?(custom_set_1.map, fn {key, _val} -> Map.has_key?(custom_set_2.map, key) end)
  end

  @spec disjoint?(t, t) :: boolean
  def disjoint?(custom_set_1, custom_set_2) do
    Enum.all?(custom_set_1.map, fn {key, _val} -> not Map.has_key?(custom_set_2.map, key) end)
    end

  @spec equal?(t, t) :: boolean
  def equal?(custom_set_1, custom_set_2) do
    Map.equal?(custom_set_1.map, custom_set_2.map)
  end

  @spec add(t, any) :: t
  def add(custom_set, element) do
    %__MODULE__{map: Map.put_new(custom_set.map, element, true)}
  end

  @spec intersection(t, t) :: t
  def intersection(custom_set_1, custom_set_2) do
    %__MODULE__{map: Map.intersect(custom_set_1.map, custom_set_2.map)}
  end

  @spec difference(t, t) :: t
  def difference(custom_set_1, custom_set_2) do
    %__MODULE__{map: Map.drop(custom_set_1.map, Map.keys(custom_set_2.map))}
  end

  @spec union(t, t) :: t
  def union(custom_set_1, custom_set_2) do
    %__MODULE__{map: Map.merge(custom_set_1.map, custom_set_2.map)}
  end
end

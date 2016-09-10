defmodule QuickcheckExample do
  @moduledoc """

  ## Example

      iex> QuickcheckExample.sort([3,6,7,8,2,1])
      [1,2,3,6,7,8]

  """

  @spec sort([any]) :: [any]
  def sort([]), do: []
  def sort([h | t]) do
    smaller = t |> Enum.filter(&(&1 <= h))
    greater = t |> Enum.filter(&(&1 > h))

    s_sort = sort(smaller)
    g_sort = sort(greater)

    [s_sort | [h | g_sort]] |> List.flatten
  end
end

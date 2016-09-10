defmodule QuickcheckExampleTest do
  use ExUnit.Case, async: true
  use ExCheck
  doctest QuickcheckExample

  property :sort_is_idempotent do
    for_all x in list(int) do
      sorted = QuickcheckExample.sort(x)
      QuickcheckExample.sort(x) == sorted
    end
  end

  property :single_element_list_is_sorted do
    for_all x in int do
      QuickcheckExample.sort([x]) == [x]
    end
  end

  property :head_less_eql_to_tail do
    for_all x in list(int) do
      implies x != [] do
        sorted = QuickcheckExample.sort(x)
        hd(sorted) <= List.last(sorted)
      end
    end
  end

  property :head_less_eql_to_tail_two do
    for_all x in such_that(x in list(int) when x != []) do
      sorted = QuickcheckExample.sort(x)
      hd(sorted) <= List.last(sorted)
    end
  end

  property :sorts_integers do
    for_all x in list(int) do
      QuickcheckExample.sort(x) == Enum.sort(x)
    end
  end

  property :sorts_real_numbers do
    for_all x in list(real) do
      QuickcheckExample.sort(x) == Enum.sort(x)
    end
  end
end

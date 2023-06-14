defmodule Selection_Sort do
  def selection_sort(list), do: do_sel_sort(list, [])

  defp do_sel_sort([], sorted), do: sorted
  defp do_sel_sort(unsorted, sorted) do
    max_value = Enum.max(unsorted)

    do_sel_sort((remove_num(unsorted, max_value)), [max_value | sorted])
  end

  def remove_num(list, value), do: do_rem_num([], list, value)

  defp do_rem_num(seen, [head | tail], value) do
    if head == value do
      Enum.reverse(seen) ++ tail
    else
      do_rem_num([head | seen], tail, value)
    end
  end
end

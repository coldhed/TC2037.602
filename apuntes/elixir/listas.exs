# Functions to work with lists
#
# Santiago Rodríguez

# lista = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
# hd(data)
# 0
# tl(data)
# [1, 2, 3, 4, 5, 6, 7, 8, 9]

defmodule Listas do
  @doc """
  Literal function to sum the elements in a list
  """
  def sum(list) do
    if list == [] do
      0
    else
      hd(list) + sum(tl(list))
    end
  end

  @doc """
  Sum using pattern matching to get the base case
  """
  def sum2([]), do: 0
  def sum2(list), do: hd(list) + sum2(tl(list))

  @doc """
  Using pattern matching to deconstruct the list
  """
  def sum3([]), do: 0
  def sum3([head | tail]), do: head + sum3(tail)

  # pattern matching can also:
  # [0, sec | res] = [0, 1, 2, 3, 4]
  # sec = 1, res = [2, 3, 4]

  @doc """
  Tail recursive function to "enlist" elements of a list
  enlist([:a, :b, :c])
  [[:a], [:b], [:c]]
  """
  def enlist(list), do: do_enlist(list, [])

  defp do_enlist([], res), do: Enum.reverse(res)
  defp do_enlist([head | tail], res), do: do_enlist(tail, [[head] | res])

  def ends_in_four(list), do: do_ends_in_four(list, [])

  defp do_ends_in_four([], new_list), do: Enum.reverse(new_list)

  defp do_ends_in_four([head | tail], new_list) do
    if rem(head, 10) == 4 do
      do_ends_in_four(tail, [head | new_list])
    else
      do_ends_in_four(tail, new_list)
    end
  end

  # defp do_ends_in_four([head | tail], new_list), do: do_ends_in_four(tail, (if rem(head, 10) == 4, do: [head | new_list], else: new_list))
end

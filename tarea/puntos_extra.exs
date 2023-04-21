# Ejercicios de puntos extras
#
# Santiago Rodríguez

defmodule ProgFunc do
  @doc """
  Pattern matching to return a list of the positive numbers in a list
  """
  def positives(list), do: do_positives(list, [])

  defp do_positives([], res), do: Enum.reverse(res)

  defp do_positives([head | tail], res),
    do: do_positives(tail, if(head > 0, do: [head | res], else: res))

  @doc """
  Pattern matching to return the sum of a list
  """
  def add_list([]), do: 0
  def add_list([head | tail]), do: head + add_list(tail)

  @doc """
  Takes in a list of pairs, and inverses the pairs
  """
  def invert_pairs(list), do: do_invert_pairs(list, [])

  defp do_invert_pairs([], res), do: Enum.reverse(res)
  defp do_invert_pairs([{a, b} | tail], res), do: do_invert_pairs(tail, [{b, a} | res])

  @doc """
  Function that returns true if all of the elements in a list are symbols
  """
  def list_of_symbols(list), do: do_list_of_symbols(list, true)

  defp do_list_of_symbols([], res), do: res

  defp do_list_of_symbols([head | tail], res) do
    if res and is_atom(head) do
      do_list_of_symbols(tail, res)
    else
      false
    end
  end

  @doc """
  Function that swaps a for b in a list list
  """
  def swapper(a, b, list), do: do_swapper(a, b, list, [])

  def do_swapper(_a, _b, [], res), do: Enum.reverse(res)

  def do_swapper(a, b, [head | tail], res) do
    if head == a do
      do_swapper(a, b, tail, [b | res])
    else
      do_swapper(a, b, tail, [head | res])
    end
  end
end

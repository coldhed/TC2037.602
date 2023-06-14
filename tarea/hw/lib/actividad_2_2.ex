# Functions to work with lists

# Santiago Rodríguez

defmodule Hw.Actividad_2_2 do
  # function to insert a value in the correct spot in a sorted list
  def insert(list, item), do: do_insert(list, item, [])

  defp do_insert([], item, temp),
    do: Enum.reverse(temp) ++ [item]

  defp do_insert([head | tail], item, temp) when item < head,
    do: Enum.reverse(temp) ++ [item, head | tail]

  defp do_insert([head | tail], item, temp),
    do: do_insert(tail, item, [head | temp])

  # function that sorts a list using the previously defined insert function
  def insertion_sort(list), do: do_insertion_sort(list, [])

  defp do_insertion_sort([], sorted), do: sorted
  defp do_insertion_sort([head | tail], sorted), do: do_insertion_sort(tail, insert(sorted, head))

  # function that rotates-left n times
  def rotate_left([], _), do: []
  def rotate_left(list, 0), do: list
  def rotate_left([head | tail], n) when n > 0, do: rotate_left(tail ++ [head], n - 1)
  def rotate_left(list, n) when n < 0, do: do_rotate_right(Enum.reverse(list), -n)

  defp do_rotate_right(list, 0), do: Enum.reverse(list)
  defp do_rotate_right([head | tail], n) when n > 0, do: do_rotate_right(tail ++ [head], n - 1)

  # get the prime factors of a number
  def prime_factors(num) when num < 1, do: []
  def prime_factors(num), do: do_prime_factors(num, 2, [])

  defp do_prime_factors(1, _, factors), do: Enum.reverse(factors)

  defp do_prime_factors(num, divisor, factors) do
    if rem(num, divisor) == 0 do
      do_prime_factors(trunc(num / divisor), divisor, [divisor | factors])
    else
      case divisor do
        2 -> do_prime_factors(num, 3, factors)
        3 -> do_prime_factors(num, 5, factors)
        5 -> do_prime_factors(num, 7, factors)
        7 -> do_prime_factors(num, num, factors)
      end
    end
  end

  # function to get the gcd
  def gcd(0, num2), do: num2
  def gcd(num1, 0), do: num1
  def gcd(num1, num2), do: do_gcd(num1, num2, Enum.min([num1, num2]))

  defp do_gcd(_, _, 1), do: 1

  defp do_gcd(num1, num2, divisor) do
    if rem(num1, divisor) == 0 and rem(num2, divisor) == 0 do
      divisor
    else
      do_gcd(num1, num2, divisor - 1)
    end
  end

  # deep reverse
  def deep_reverse(list), do: do_deep_reverse(list, [])

  defp do_deep_reverse([], reverse), do: reverse

  defp do_deep_reverse([[nestedHead | nestedTail] | tail], reverse),
    do: do_deep_reverse(tail, [deep_reverse([nestedHead | nestedTail]) | reverse])

  defp do_deep_reverse([head | tail], reverse), do: do_deep_reverse(tail, [head | reverse])

  # insert_everywhere
  def insert_everywhere(element, []), do: [[element]]
  def insert_everywhere(element, list), do: do_insert_everywhere([], element, list, [])

  defp do_insert_everywhere(before, element, [], answers),
    do: Enum.reverse([before ++ [element] | answers])

  defp do_insert_everywhere(before, element, [head | tail], answers),
    do:
      do_insert_everywhere(before ++ [head], element, tail, [
        before ++ [element] ++ [head | tail] | answers
      ])
end

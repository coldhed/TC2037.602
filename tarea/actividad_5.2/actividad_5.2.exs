# TAREA 5.2

# Por Mariel Gómez y Santiago Rodríguez

defmodule Hw.Primes do
  # functions to divide the range with the number of cores
  def make_ranges(start, finish, cores) do
    range = finish - start + 1

    size = trunc(range / cores)
    remainder = rem(range, cores)

    do_make_ranges(start, finish, size, remainder, [])
  end

  defp do_make_ranges(start, finish, _, _, acc) when start - 1 == finish, do: Enum.reverse(acc)

  defp do_make_ranges(start, finish, size, remainder, acc) do
    if (remainder > 0) do
      currentRange = Enum.to_list(start..(start + size))
      do_make_ranges(start + size + 1, finish, size, remainder - 1, [currentRange | acc])
    else
      currentRange = Enum.to_list(start..(start + size - 1))
      do_make_ranges(start + size, finish, size, remainder, [currentRange | acc])
    end
  end

  # functions to check if a number is prime
  def is_prime(num) when num < 2, do: false
  def is_prime(num), do: do_is_prime(num, 2)

  defp do_is_prime(num, i) do
    if i > :math.sqrt(num) do
      true
    else
      if rem(num, i) == 0 do
        false
      else
        do_is_prime(num, i + 1)
      end
    end
  end

  def sum_if_prime(list), do: do_sum_if_prime(list, 0)

  defp do_sum_if_prime([], sum), do: sum
  defp do_sum_if_prime([head | tail], sum) do
    if is_prime(head) do
      do_sum_if_prime(tail, sum + head)
    else
      do_sum_if_prime(tail, sum)
    end
  end

  # sum
  def sum_primes(finish) do
    sum_if_prime(Enum.to_list(2..finish))
  end

  def sum_primes_parallel(finish, cores) do
    make_ranges(2, finish, cores)
    |>Enum.map(&Task.async(fn -> sum_if_prime(&1) end))
    |>Enum.map(&Task.await(&1))
    |>Enum.sum()
  end
end

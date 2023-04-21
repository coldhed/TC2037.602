# implmentation of the factorial function using recursion
#
# Santiago Rodríguez

# elixir interactive mode iex filename.exs
# to re-enter: c("filename.exs")

# create a new module. All module names should start with Uppercase
defmodule Recur do
  def fact(n) do
    if n == 0, do: 1, else: n * fact(n - 1)
  end

  # another option using PATTERN MATCHING
  #   def fact(0), do: 1
  #   def fact(n), do: n * fact(n - 1)

  # define private function -> defp
  # using a 'guard' to identify different cases
  defp do_fact_tail(n, acc) when n < 1, do: acc
  defp do_fact_tail(n, acc), do: do_fact_tail(n - 1, n * acc)

  def fact_tail(n), do: do_fact_tail(n, 1)

  # FIBONACCI using pattern matching
  def fibonacci(n) when n < 0, do: :error
  def fibonacci(0), do: 0
  def fibonacci(1), do: 1
  def fibonacci(n), do: fibonacci(n - 1) + fibonacci(n - 2)

  # tail fibonacci
  def fibonacci_tail(n) when n < 0, do: {:error, :negative}
  def fibonacci_tail(0), do: {:ok, 0}
  def fibonacci_tail(1), do: {:ok, 1}
  def fibonacci_tail(n), do: {:ok, do_fibo_tail(0, 1, n - 1)}

  defp do_fibo_tail(_a, b, 0), do: b
  defp do_fibo_tail(a, b, n), do: do_fibo_tail(b, a + b, n - 1)
end

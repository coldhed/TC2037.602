# Functions to work with file input and output
# Pefrorm Caesar Cipher on a file

# Santiago Rodríguez

defmodule FileIO do
  def char_shift(char, offset) do
    cond do
      # check if it's uppercase
      65 <= char and char <= 90 -> Integer.mod(char - 65 + offset, 26) + 65
      # check for lowercase
      97 <= char and char <= 122 -> Integer.mod(char - 97 + offset, 26) + 97
      # any other char
      true -> char
    end
  end

  def line_shift(line, offset) do
    # to_string(Enum.map(to_charlist(line), fn char -> char_shift(char, offset) end))

    # another way of writing a lambda function is:
    # &char_shift(&1, offset)

    # using pipe operator |>
    line
    |> to_charlist()
    |> Enum.map(fn char -> char_shift(char, offset) end)
    |> to_string()
  end

  def caesar_cipher(in_filename, out_filename, offset) do
    data =
      in_filename
      |> File.stream!()
      |> Enum.map(&line_shift(&1, offset))
      |> Enum.join("")

    File.write(out_filename, data)
  end
end

#    Tests for the set of problems by Ariel Ortiz
#    Applications of the general concepts of functional programming
#
#    Gilberto Echeverria
#    2022_03_04

defmodule Hw.Actividad_2_2Test do
  use ExUnit.Case
  alias Hw.Actividad_2_2

  # Functions

  test "test insert" do
    assert Actividad_2_2.insert([], 14) == [14]
    assert Actividad_2_2.insert([5, 6, 7, 8], 4) == [4, 5, 6, 7, 8]
    assert Actividad_2_2.insert([1, 3, 6, 7, 9, 16], 5) == [1, 3, 5, 6, 7, 9, 16]
    assert Actividad_2_2.insert([1, 5, 6], 10) == [1, 5, 6, 10]
  end

  test "test insertion_sort" do
    assert Actividad_2_2.insertion_sort([]) == []

    assert Actividad_2_2.insertion_sort([4, 3, 6, 8, 3, 0, 9, 1, 7]) == [
             0,
             1,
             3,
             3,
             4,
             6,
             7,
             8,
             9
           ]

    assert Actividad_2_2.insertion_sort([1, 2, 3, 4, 5, 6]) == [1, 2, 3, 4, 5, 6]
    assert Actividad_2_2.insertion_sort([5, 5, 5, 1, 5, 5, 5]) == [1, 5, 5, 5, 5, 5, 5]
  end

  test "test rotate_left" do
    assert Actividad_2_2.rotate_left([], 5) == []

    assert Actividad_2_2.rotate_left([:a, :b, :c, :d, :e, :f, :g], 0) == [
             :a,
             :b,
             :c,
             :d,
             :e,
             :f,
             :g
           ]

    assert Actividad_2_2.rotate_left([:a, :b, :c, :d, :e, :f, :g], 1) == [
             :b,
             :c,
             :d,
             :e,
             :f,
             :g,
             :a
           ]

    assert Actividad_2_2.rotate_left([:a, :b, :c, :d, :e, :f, :g], -1) == [
             :g,
             :a,
             :b,
             :c,
             :d,
             :e,
             :f
           ]

    assert Actividad_2_2.rotate_left([:a, :b, :c, :d, :e, :f, :g], 3) == [
             :d,
             :e,
             :f,
             :g,
             :a,
             :b,
             :c
           ]

    assert Actividad_2_2.rotate_left([:a, :b, :c, :d, :e, :f, :g], -3) == [
             :e,
             :f,
             :g,
             :a,
             :b,
             :c,
             :d
           ]

    assert Actividad_2_2.rotate_left([:a, :b, :c, :d, :e, :f, :g], 8) == [
             :b,
             :c,
             :d,
             :e,
             :f,
             :g,
             :a
           ]

    assert Actividad_2_2.rotate_left([:a, :b, :c, :d, :e, :f, :g], -8) == [
             :g,
             :a,
             :b,
             :c,
             :d,
             :e,
             :f
           ]

    assert Actividad_2_2.rotate_left([:a, :b, :c, :d, :e, :f, :g], 45) == [
             :d,
             :e,
             :f,
             :g,
             :a,
             :b,
             :c
           ]

    assert Actividad_2_2.rotate_left([:a, :b, :c, :d, :e, :f, :g], -45) == [
             :e,
             :f,
             :g,
             :a,
             :b,
             :c,
             :d
           ]
  end

  test "test prime_factors" do
    assert Actividad_2_2.prime_factors(1) == []
    assert Actividad_2_2.prime_factors(6) == [2, 3]
    assert Actividad_2_2.prime_factors(96) == [2, 2, 2, 2, 2, 3]
    assert Actividad_2_2.prime_factors(666) == [2, 3, 3, 37]
  end

  test "test gcd" do
    assert Actividad_2_2.gcd(0, 0) == 0
    assert Actividad_2_2.gcd(3, 0) == 3
    assert Actividad_2_2.gcd(0, 2) == 2
    assert Actividad_2_2.gcd(2, 2) == 2
    assert Actividad_2_2.gcd(10, 8) == 2
    assert Actividad_2_2.gcd(8, 10) == 2
    assert Actividad_2_2.gcd(270, 192) == 6
    assert Actividad_2_2.gcd(13, 7919) == 1
    assert Actividad_2_2.gcd(20, 16) == 4
    assert Actividad_2_2.gcd(54, 24) == 6
    assert Actividad_2_2.gcd(6307, 1995) == 7
  end

  test "test deep_reverse" do
    assert Actividad_2_2.deep_reverse([]) == []
    assert Actividad_2_2.deep_reverse([:a, :b]) == [:b, :a]
    assert Actividad_2_2.deep_reverse([:a, :b, :c]) == [:c, :b, :a]
    assert Actividad_2_2.deep_reverse([:a, [:b, :c, :d], 3]) == [3, [:d, :c, :b], :a]
    assert Actividad_2_2.deep_reverse([[1, 2], 3, [4, [5, 6]]]) == [[[6, 5], 4], 3, [2, 1]]
  end

  test "test insert_everywhere" do
    assert Actividad_2_2.insert_everywhere(:x, []) == [[:x]]
    assert Actividad_2_2.insert_everywhere(:x, [:a]) == [[:x, :a], [:a, :x]]

    assert Actividad_2_2.insert_everywhere(:x, [:a, :b, :c]) ==
             [[:x, :a, :b, :c], [:a, :x, :b, :c], [:a, :b, :x, :c], [:a, :b, :c, :x]]

    assert Actividad_2_2.insert_everywhere(:x, [:a, :b, :c, :d, :e]) ==
             [
               [:x, :a, :b, :c, :d, :e],
               [:a, :x, :b, :c, :d, :e],
               [:a, :b, :x, :c, :d, :e],
               [:a, :b, :c, :x, :d, :e],
               [:a, :b, :c, :d, :x, :e],
               [:a, :b, :c, :d, :e, :x]
             ]
  end

  # test "test pack" do
  #   assert Actividad_2_2.pack([]) == []
  #   assert Actividad_2_2.pack([:a]) == [[:a]]

  #   assert Actividad_2_2.pack([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) ==
  #            [[:a, :a, :a, :a], [:b], [:c, :c], [:a, :a], [:d], [:e, :e, :e, :e]]

  #   assert Actividad_2_2.pack([1, 2, 3, 4, 5]) == [[1], [2], [3], [4], [5]]
  #   assert Actividad_2_2.pack([9, 9, 9, 9, 9]) == [[9, 9, 9, 9, 9]]
  # end

  # test "test compress" do
  #   assert Actividad_2_2.compress([]) == []
  #   assert Actividad_2_2.compress([:a]) == [:a]

  #   assert Actividad_2_2.compress([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) ==
  #            [:a, :b, :c, :a, :d, :e]

  #   assert Actividad_2_2.compress([1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5]
  #   assert Actividad_2_2.compress([9, 9, 9, 9, 9]) == [9]
  # end

  # test "test encode" do
  #   assert Actividad_2_2.encode([]) == []
  #   assert Actividad_2_2.encode([:a]) == [{1, :a}]

  #   assert Actividad_2_2.encode([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) ==
  #            [{4, :a}, {1, :b}, {2, :c}, {2, :a}, {1, :d}, {4, :e}]

  #   assert Actividad_2_2.encode([1, 2, 3, 4, 5]) == [{1, 1}, {1, 2}, {1, 3}, {1, 4}, {1, 5}]
  #   assert Actividad_2_2.encode([9, 9, 9, 9, 9]) == [{5, 9}]
  # end

  # test "test encode_modified" do
  #   assert Actividad_2_2.encode_modified([]) == []
  #   assert Actividad_2_2.encode_modified([:a]) == [:a]

  #   assert Actividad_2_2.encode_modified([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) ==
  #            [{4, :a}, :b, {2, :c}, {2, :a}, :d, {4, :e}]

  #   assert Actividad_2_2.encode_modified([1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5]
  #   assert Actividad_2_2.encode_modified([9, 9, 9, 9, 9]) == [{5, 9}]
  # end

  # test "test decode" do
  #   assert Actividad_2_2.decode([]) == []
  #   assert Actividad_2_2.decode([:a]) == [:a]

  #   assert Actividad_2_2.decode([{4, :a}, :b, {2, :c}, {2, :a}, :d, {4, :e}]) ==
  #            [:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]

  #   assert Actividad_2_2.decode([1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5]
  #   assert Actividad_2_2.decode([{5, 9}]) == [9, 9, 9, 9, 9]
  # end

  #  test "test args_swap" do
  #    assert Actividad_2_2.args_swap(list).(1, 2) == [2, 1]
  #    assert Actividad_2_2.args_swap(/).(8, 2) == 1/4
  #    assert Actividad_2_2.args_swap(cons).([1, 2, 3], [4, 5, 6]) == [(4, 5, 6], 1, 2, 3)
  #    assert Actividad_2_2.args_swap(map).([-1, 1, 2, 5, 10], /) == [-1, 1, 1/2, 1/5, 1/10]
  #  end
  #
  #  test "test there_exists_one?" do
  #    assert Actividad_2_2.there_exists_one?(positive?, []) == #f
  #    assert Actividad_2_2.there_exists_one?(positive?, [-1, -10, 4, -5, -2, -1]) == #t
  #    assert Actividad_2_2.there_exists_one?(positive?, [-1, -10, 4, -5, 2, -1]) == #f
  #    assert Actividad_2_2.there_exists_one?(negative?, [-1]) == #t
  #    assert Actividad_2_2.there_exists_one?(symbol?, [4, 8, 15, 16, 23, 42]) == #f
  #    assert Actividad_2_2.there_exists_one?(symbol?, [4, 8, 15, sixteen, 23, 42]) == #t
  #  end
  #
  #  test "test linear_search" do
  #    assert Actividad_2_2.linear_search([], 5, =) == #f
  #    assert Actividad_2_2.linear_search([48, 77, 30, 31, 5, 20, 91, 92, 69, 97, 28, 32, 17, 18, 96], 5, =) == 4
  #    assert Actividad_2_2.linear_search(["red" "blue" "green" "black" "white"], "black", string=?) == 3
  #    assert Actividad_2_2.linear_search([:a, :b, :c, :d, :e, :f, :g, :h], :h, equal?) == 7
  #  end
end

defmodule ElixirLinqExamples.Grouping do
  use ExUnit.Case

  import ElixirLinqExamples.Data

  test "linq40: GroupBy - Simple 1" do
    numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

    number_groups = numbers
    |> Enum.group_by(fn x -> rem(x, 5) end)
    |> Enum.map(fn {rem,num} -> %{remainder: rem, numbers: num} end)

    # for g <- number_groups do
    #   IO.puts "Numbers with a remainder of #{g.remainder} when divided by 5:"
    #   for n <- g.numbers, do: IO.puts n
    # end

    assert 5 == length(number_groups)
  end

  test "linq41: GroupBy - Simple 2" do
    words = ["blueberry", "chimpanzee", "abacus", "banana", "apple", "cheese"]

    word_groups = words
    |> Enum.group_by(fn x -> String.at(x, 0) end)
    |> Enum.map(fn {fl, words} -> %{first_letter: fl, words: words} end)

    # for g <- word_groups do
    #   IO.puts "Words that start with the letter '#{g.first_letter}'"
    #   for w <- g.words, do: IO.puts w
    # end

    assert 3 == length(word_groups)
  end

  test "linq42: GroupBy - Simple 3" do
    products = get_product_list()

    order_groups = products
    |> Enum.group_by(fn x -> x.category end)
    |> Enum.map(fn {cat, prods} -> %{category: cat, products: prods} end)

    # IO.inspect order_groups

    assert 8 == length(order_groups)
  end

  test "linq43: GroupBy - Nested" do
    customers = get_customer_list()

    customer_order_groups = customers
    |> Enum.map(fn c ->
      %{
        company_name: c.name,
        year_groups:
          c.orders
          |> Enum.group_by(fn o -> o.orderdate.year end)
          |> Enum.map(fn {year, year_orders} ->
            %{
              year: year,
              month_groups:
                year_orders
                |> Enum.group_by(fn o -> o.orderdate.month end)
                |> Enum.map(fn {month, month_orders} ->
                  %{
                    month: month,
                    orders: month_orders
                  }
                end)
            }
          end)
      }
    end)

    # IO.inspect customer_order_groups, limit: 10, pretty: true

    assert 91 == length(customer_order_groups)
  end

  test "linq44: GroupBy - Comparer" do
    anagrams = ["from   ", " salt", " earn ", "  last   ", " near ", " form  "]

    order_groups = anagrams
    |> Enum.group_by(fn x -> x
      |> String.trim
      |> String.downcase
      |> String.codepoints
      |> Enum.sort
    end)

    # for g <- order_groups, do: IO.inspect elem(g, 1)

    assert 3 == Map.size(order_groups)
  end

  test "linq45: GroupBy - Comparer, Mapped" do
    anagrams = ["from   ", " salt", " earn ", "  last   ", " near ", " form  "]

    order_groups = anagrams
    |> Enum.group_by(fn x -> x
        |> String.trim
        |> String.downcase
        |> String.codepoints
        |> Enum.sort
      end)
    |> Enum.map(fn {_, words} -> words |> Enum.map(&String.upcase/1) end)

    # for g <- order_groups, do: IO.inspect g

    assert 3 == length(order_groups)
  end
end

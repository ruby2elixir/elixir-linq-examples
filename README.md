101 LINQ Samples in Elixir
==================

Port of [C#'s' 101 LINQ Samples](http://code.msdn.microsoft.com/101-LINQ-Samples-3fb9811b) translated into Elixir.

Compare Elixir to other LINQ examples written in:

 - [Clojure](https://github.com/mythz/clojure-linq-examples)
 - [Java](https://github.com/mythz/java-linq-examples)
 - [Swift](https://github.com/mythz/swift-linq-examples)
 - [Dart](https://github.com/mythz/dart-linq-examples)

### Why not Ecto?

This repo came out of a conversation with José Valim about the possibility of having "Ecto for Structs" in the same way C# has LINQ for Objects. José expressed his disbelief in having the same syntax (Ecto) for radically different semantics (databases vs in-memory enumerable data) and advised me to explore what `Enum`, `Streams` and `for` comprehensions have to offer.

I'm only translating LINQ examples to `for` comprehensions, `Enum` and `Stream` since those differ the most from LINQ syntax and require more research for someone coming from C#.

### Pretty pretty please!

Open an issue if you think I'm doing something stupid in any of the examples or if you have a better way of doing any of them. I'm beginning Elixir, as anyone who stumble here might also be, so this is the whole point. :)

### Running the examples

The examples are coded as unit tests. For sanity, I've commented out all of the IO.

Be sure to get all dependencies before running the examples for the first time. Do so with:

    mix deps.get

Execute all of the examles with:

    mix test

### Contents

The samples below mirror the C# LINQ samples in the form of `ExUnit` unit tests with test names matching their corresponding C# examples.

#### [LINQ - Restriction Operators](https://github.com/omnibs/elixir-linq-examples/blob/master/test/restriction_test.exs) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-to-DataSets-09787825)
#### [LINQ - Projection Operators](https://github.com/omnibs/elixir-linq-examples/blob/master/test/projection_test.exs) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Partitioning-Operators-c68aaccc)
#### [LINQ - Partitioning Operators](https://github.com/omnibs/elixir-linq-examples/blob/master/test/partitioning_test.exs) / [MSDN C#](http://code.msdn.microsoft.com/SQL-Ordering-Operators-050af19e)
#### [LINQ - Ordering Operators](https://github.com/omnibs/elixir-linq-examples/blob/master/test/ordering_test.exs) / [MSDN C#](http://code.msdn.microsoft.com/SQL-Ordering-Operators-050af19e)
#### [LINQ - Grouping Operators](https://github.com/omnibs/elixir-linq-examples/blob/master/test/grouping_test.exs) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-to-DataSets-Grouping-c62703ea)
#### [LINQ - Set Operators](https://github.com/omnibs/elixir-linq-examples/blob/master/test/set_test.exs) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Set-Operators-374f34fe)
#### [LINQ - Conversion Operators](https://github.com/omnibs/elixir-linq-examples/blob/master/test/conversion_test.exs) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Conversion-Operators-e4e59714)
#### [LINQ - Element Operators](https://github.com/omnibs/elixir-linq-examples/blob/master/test/element_test.exs) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Element-Operators-0f3f12ce)
#### [LINQ - Generation Operators](https://github.com/omnibs/elixir-linq-examples/blob/master/test/generation_test.exs) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Generation-Operators-8a3fbff7)
#### [LINQ - Quantifiers](https://github.com/omnibs/elixir-linq-examples/blob/master/test/quantifiers_test.exs) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Quantifiers-f00e7e3e)
#### [LINQ - Aggregate Operators](https://github.com/omnibs/elixir-linq-examples/blob/master/test/aggregate_test.exs) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Aggregate-Operators-c51b3869)
#### [LINQ - Miscellaneous Operators](https://github.com/omnibs/elixir-linq-examples/blob/master/test/misc_test.exs) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Miscellaneous-6b72bb2a)
#### [LINQ - Query Execution](https://github.com/omnibs/elixir-linq-examples/blob/master/test/query_test.exs) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Query-Execution-ce0d3b95)
#### [LINQ - Join Operators](https://github.com/omnibs/elixir-linq-examples/blob/master/test/join_test.exs) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Join-Operators-dabef4e9)

##  Side-by-side - C# LINQ vs Elixir

For a side-by-side comparison, the original **C#** source code is displayed above the equivalent **Elixir** translation.

  - The **Output** shows the console output of running the **Clojure** samples from mythz's repo, I haven't dumped my outputs yet.
  - Outputs ending with `...` illustrates only a partial response is displayed.
  - The source-code for C# and Elixir utils used are included once under the first section they're used in.
  - The C# ObjectDumper util used is downloadable from MSDN - [ObjectDumper.zip](http://code.msdn.microsoft.com/Visual-Studio-2008-C-d295cdba/file/46086/1/ObjectDumper.zip)

LINQ - Restriction Operators
----------------------------
### linq1: Where - Simple 1

```csharp
//c#
public void Linq1()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    var lowNums =
        from n in numbers
        where n < 5
        select n;

    Console.WriteLine("Numbers < 5:");
    foreach (var x in lowNums)
    {
        Console.WriteLine(x);
    }
}
```
```elixir
# elixir
test "linq1: Where - Simple 1" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  low_nums = numbers |> Enum.filter(fn x -> x < 5 end)

  IO.puts "Numbers < 5:"
  for n <- low_nums, do: IO.puts n

  assert low_nums == [4,1,3,2,0]
end
```
#### Output

    Numbers < 5:
    4
    1
    3
    2
    0

### linq2: Where - Simple 2
```csharp
//c#
public void Linq2()
{
    List<Product> products = GetProductList();

    var soldOutProducts =
        from p in products
        where p.UnitsInStock == 0
        select p;

    Console.WriteLine("Sold out products:");
    foreach (var product in soldOutProducts)
    {
        Console.WriteLine("{0} is sold out!", product.ProductName);
    }
}
```
```elixir
# elixir
test "linq2: Where - Simple 2" do
  products = get_product_list()

  sold_out_products =
    products
    |> Enum.filter(fn x -> x.units_in_stock == 0 end)

  IO.puts "Sold out products:"
  for n <- sold_out_products, do: IO.puts "#{n.product_name} is sold out!"

  assert Enum.count(sold_out_products) == 5
  first_product = %Product{category: "Condiments", product_id: 5, product_name: "Chef Anton's Gumbo Mix", unit_price: 21.35, units_in_stock: 0}
  assert sold_out_products |> Enum.at(0) == first_product
end
```
#### Output

    Sold out products:
    Chef Anton's Gumbo Mix  is sold out
    Alice Mutton  is sold out
    Thüringer Rostbratwurst  is sold out
    Gorgonzola Telino  is sold out
    Perth Pasties  is sold out

### linq3: Where - Simple 3
```csharp
//c#
public void Linq3()
{
    List<Product> products = GetProductList();

    var expensiveInStockProducts =
        from p in products
        where p.UnitsInStock > 0 && p.UnitPrice > 3.00M
        select p;

    Console.WriteLine("In-stock products that cost more than 3.00:");
    foreach (var product in expensiveInStockProducts)
    {
        Console.WriteLine("{0} is in stock and costs more than 3.00.", product.ProductName);
    }
}
```
```elixir
# elixir
test "linq3: Where - Simple 3" do
  products = get_product_list()

  in_stock_and_more_than_3 =
    products
    |> Enum.filter(fn x -> x.units_in_stock > 0 && x.unit_price > 3.00 end)

  IO.puts "In-stock products that cost more than 3.00:"
  for n <- in_stock_and_more_than_3, do: IO.puts "#{n.product_name} is in stock and costs more than 3.00!"

  first = in_stock_and_more_than_3 |> Enum.at(0)
  assert in_stock_and_more_than_3 |> Enum.count == 71
  assert first == %Product{category: "Beverages", product_id: 1, product_name: "Chai", unit_price: 18.0, units_in_stock: 39}
end
```
#### Output

    In-stock products that cost more than 3.00:
    Chai is in stock and costs more than 3.00
    Chang is in stock and costs more than 3.00
    Aniseed Syrup is in stock and costs more than 3.00
    Chef Anton's Cajun Seasoning is in stock and costs more than 3.00
    Grandma's Boysenberry Spread is in stock and costs more than 3.00

### linq4: Where - Drilldown
```csharp
//c#
public void Linq4()
{
    List<Customer> customers = GetCustomerList();

    var waCustomers =
        from c in customers
        where c.Region == "WA"
        select c;

    Console.WriteLine("Customers from Washington and their orders:");
    foreach (var customer in waCustomers)
    {
        Console.WriteLine("Customer {0}: {1}", customer.CustomerID, customer.CompanyName);
        foreach (var order in customer.Orders)
        {
            Console.WriteLine("  Order {0}: {1}", order.OrderID, order.OrderDate);
        }
    }
}
```
```elixir
# elixir
test "linq4: Where - Drilldown" do
  customers = get_customer_list()

  wa_customers = customers |> Enum.filter(fn x -> x.region == "WA" end)

  IO.puts "Customers from Washington and their orders:"
  for customer <- wa_customers do
    IO.puts "Customer #{customer["id"]}: #{customer["name"]}"
    for order <- customer["orders"]["order"], do: IO.puts "\tOrder #{order["id"]}: #{order["orderdate"]}"
  end

  assert 3 == length(wa_customers)
end
```
#### Output

    Customers from Washington and their orders:
    Customer LAZYK :  Lazy K Kountry Store :
        Order 10482 : #<DateTime 1997-03-21T00:00:00.000-05:00>
        Order 10545 : #<DateTime 1997-05-22T00:00:00.000-04:00>
    Customer TRAIH :  Trail's Head Gourmet Provisioners :
        Order 10574 : #<DateTime 1997-06-19T00:00:00.000-04:00>
        Order 10577 : #<DateTime 1997-06-23T00:00:00.000-04:00>
        Order 10822 : #<DateTime 1998-01-08T00:00:00.000-05:00>
    ...

### linq5: Where - Indexed
```csharp
//c#
public void Linq5()
{
    string[] digits = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };

    var shortDigits = digits.Where((digit, index) => digit.Length < index);

    Console.WriteLine("Short digits:");
    foreach (var d in shortDigits)
    {
        Console.WriteLine("The word {0} is shorter than its value.", d);
    }
}
```
```elixir
# elixir
test "linq5: Where - Indexed" do
  digits = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

  short_digits = digits
  |> Stream.with_index
  |> Stream.filter(fn {entry, index} -> String.length(entry) < index end)
  |> Stream.map(fn {x,_} -> x end)
  |> Enum.to_list

  for n <- short_digits, do: IO.puts "The word #{n} is shorter than its value"

  assert length(short_digits) == 5
end
```
#### Output

    Short digits:
    The word five is shorter than its value
    The word six is shorter than its value
    The word seven is shorter than its value
    The word eight is shorter than its value
    The word nine is shorter than its value

LINQ - Projection Operators
---------------------------
### linq6: Select - Simple 1
```csharp
//c#
public void Linq6()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    var numsPlusOne =
        from n in numbers
        select n + 1;

    Console.WriteLine("Numbers + 1:");
    foreach (var i in numsPlusOne)
    {
        Console.WriteLine(i);
    }
}
```
```elixir
# elixir
test "linq6: Select - Simple 1" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0];
  num_plus_one = numbers |> Enum.map(&(&1+1))

  IO.puts "Numbers + 1:"
  for n <- num_plus_one, do: IO.puts n

  assert [6 ,5 ,2 ,4 ,10 ,9 ,7 ,8 ,3 ,1] == num_plus_one
end
```
#### Output

    Numbers + 1:
    6
    5
    2
    4
    10
    9
    7
    8
    3
    1

### linq7: Select - Simple 2
```csharp
//c#
public void Linq7()
{
    List<Product> products = GetProductList();

    var productNames =
        from p in products
        select p.ProductName;

    Console.WriteLine("Product Names:");
    foreach (var productName in productNames)
    {
        Console.WriteLine(productName);
    }
}
```
```elixir
# elixir
test "linq7: Select - Simple 2" do
  products = get_product_list()

  product_names = products |> Enum.map(&(&1.product_name))

  IO.puts "Product Names:"
  for n <- product_names, do: IO.puts n

  assert Enum.all?(product_names, &is_binary/1)
end
```
#### Output

    Product Names:
    Chai
    Chang
    Aniseed Syrup
    Chef Anton's Cajun Seasoning
    Chef Anton's Gumbo Mix
    ...

### linq8: Select - Transformation
```csharp
//c#
public void Linq8()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };
    string[] strings = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };

    var textNums =
        from n in numbers
        select strings[n];

    Console.WriteLine("Number strings:");
    foreach (var s in textNums)
    {
        Console.WriteLine(s);
    }
}
```
```elixir
# elixir
test "linq8: Select - Transformation" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0];
  strings = {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};

  text_nums = numbers |> Enum.map(&(elem(strings,&1)))

  IO.puts "Number strings:"
  for n <- text_nums, do: IO.puts n

  assert Enum.all?(text_nums, &is_binary/1)
end
```
#### Output

    Number strings:
    five
    four
    one
    three
    nine
    eight
    six
    seven
    two
    zero

### linq9: Select - Anonymous Types 1
```csharp
//c#
public void Linq9()
{
    string[] words = { "aPPLE", "BlUeBeRrY", "cHeRry" };

    var upperLowerWords =
        from w in words
        select new { Upper = w.ToUpper(), Lower = w.ToLower() };

    foreach (var ul in upperLowerWords)
    {
        Console.WriteLine("Uppercase: {0}, Lowercase: {1}", ul.Upper, ul.Lower);
    }
}
```
```elixir
# elixir
test "linq9: Select - Anonymous Types 1" do
  words = ["aPPLE", "BlUeBeRrY", "cHeRry"]

  upper_lower_words = words |> Enum.map(fn x -> %{lower: String.downcase(x), upper: String.upcase(x)} end)

  for n <- upper_lower_words, do: IO.puts "Uppercase: #{n.upper}, Lowercase: #{n.lower}" end

  assert hd(upper_lower_words) == %{lower: "apple", upper: "APPLE"}
end
```
#### Output

    Uppercase: APPLE , Lowercase: apple
    Uppercase: BLUEBERRY , Lowercase: blueberry
    Uppercase: CHERRY , Lowercase: cherry

### linq10: Select - Anonymous Types 2
```csharp
//c#
public void Linq10()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };
    string[] strings = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };

    var digitOddEvens =
        from n in numbers
        select new { Digit = strings[n], Even = (n % 2 == 0) };

    foreach (var d in digitOddEvens)
    {
        Console.WriteLine("The digit {0} is {1}.", d.Digit, d.Even ? "even" : "odd");
    }
}
```
```elixir
# elixir
test "linq10: Select - Anonymous Types 2" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]
  strings = {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"}

  digit_odd_evens = numbers |> Enum.map(fn x -> %{digit: elem(strings, x), even: rem(x, 2) == 0} end)

  for n <- digit_odd_evens, do: IO.puts "The digit #{n.digit} is #{n.even && "even" || "odd"}."

  assert Enum.count(digit_odd_evens, &(&1.even)) == 5
end
```
#### Output

    The digit five is odd
    The digit four is even
    The digit one is odd
    The digit three is odd
    The digit nine is odd
    The digit eight is even
    The digit six is even
    The digit seven is odd
    The digit two is even
    The digit zero is even

### linq11: Select - Anonymous Types 3
```csharp
//c#
public void Linq11()
{
    List<Product> products = GetProductList();

    var productInfos =
        from p in products
        select new { p.ProductName, p.Category, Price = p.UnitPrice };

    Console.WriteLine("Product Info:");
    foreach (var productInfo in productInfos)
    {
        Console.WriteLine("{0} is in the category {1} and costs {2} per unit.", productInfo.ProductName, productInfo.Category, productInfo.Price);
    }
}
```
```elixir
# elixir
test "linq11: Select - Anonymous Types 3" do
  products = get_product_list()

  product_infos = products |> Enum.map(fn x -> %{product_name: x.product_name, category: x.category, price: x.unit_price} end)

  for n <- product_infos, do: IO.puts "#{n.product_name} is in the category #{n.category} and costs #{n.price} per unit."

  assert Enum.all?(product_infos, fn x -> is_number(x.price) end)
end
```
#### Output

    Product Info:
    Chai is in the category Beverages and costs 18.0
    Chang is in the category Beverages and costs 19.0
    Aniseed Syrup is in the category Condiments and costs 10.0
    ...

### linq12: Select - Indexed
```csharp
//c#
public void Linq12()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    var numsInPlace = numbers.Select((num, index) => new { Num = num, InPlace = (num == index) });

    Console.WriteLine("Number: In-place?");
    foreach (var n in numsInPlace)
    {
        Console.WriteLine("{0}: {1}", n.Num, n.InPlace);
    }
}
```
```elixir
# elixir
test "linq12: Select - Indexed" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  nums_in_place = numbers
  |> Stream.with_index
  |> Stream.map(fn {x,idx} -> %{num: x, in_place: x == idx} end)
  |> Enum.to_list

  IO.puts "Number: In-place?"
  for n <- nums_in_place, do: IO.puts "#{n.num}: #{n.in_place}"

  assert 3 = Enum.count(nums_in_place, fn x -> x.in_place end)
end
```
#### Output

    Number: In-place?
    5 : false
    4 : false
    1 : false
    3 : true
    9 : false
    8 : false
    6 : true
    7 : true
    2 : false
    0 : false

### linq13: Select - Filtered
```csharp
//c#
public void Linq13()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };
    string[] digits = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };

    var lowNums =
        from n in numbers
        where n < 5
        select digits[n];

    Console.WriteLine("Numbers < 5:");
    foreach (var num in lowNums)
    {
        Console.WriteLine(num);
    }
}
```
```elixir
# elixir
test "linq13: Select - Filtered" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]
  strings = {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"}

  low_nums = for n <- numbers, n < 5, do: elem(strings, n)

  IO.puts "Numbers < 5:"
  for n <- low_nums, do: IO.puts n

  assert 5 = length(low_nums)
end
```
#### Output

    Numbers < 5:
    four
    one
    three
    two
    zero

### linq14: SelectMany - Compound from 1
```csharp
//c#
public void Linq14()
{
    int[] numbersA = { 0, 2, 4, 5, 6, 8, 9 };
    int[] numbersB = { 1, 3, 5, 7, 8 };

    var pairs =
        from a in numbersA
        from b in numbersB
        where a < b
        select new { a, b };

    Console.WriteLine("Pairs where a < b:");
    foreach (var pair in pairs)
    {
        Console.WriteLine("{0} is less than {1}", pair.a, pair.b);
    }
}
```
```elixir
# elixir
test "linq14: SelectMany - Compound from 1" do
  numbers_a = [0, 2, 4, 5, 6, 8, 9]
  numbers_b = [1, 3, 5, 7, 8]

  pairs = for a <- numbers_a, b <- numbers_b, a < b, do: %{a: a, b: b}

  IO.puts "Pairs where a < b:"
  for n <- pairs, do: IO.puts "#{n.a} is less than #{n.b}"

  assert 16 == length(pairs)
end
```
#### Output

    Pairs where a < b:
    0 is less than 1
    0 is less than 3
    0 is less than 5
    0 is less than 7
    0 is less than 8
    2 is less than 3
    2 is less than 5
    2 is less than 7
    2 is less than 8
    4 is less than 5
    4 is less than 7
    4 is less than 8
    5 is less than 7
    5 is less than 8
    6 is less than 7
    6 is less than 8

### linq15: SelectMany - Compound from 2
```csharp
//c#
public void Linq15()
{
    List<Customer> customers = GetCustomerList();

    var orders =
        from c in customers
        from o in c.Orders
        where o.Total < 500.00M
        select new { c.CustomerID, o.OrderID, o.Total };

    ObjectDumper.Write(orders);
}
```
```elixir
# elixir
test "linq15: SelectMany - Compound from 2" do
  customers = get_customer_list()

  orders =
    for c <- customers,
        o <- c.orders,
        do: %{customer_id: c.id, order_id: o.id, total: o.total}

  IO.inspect orders

  assert length(orders) == 830
end
```
#### Output

    {:customer-id ALFKI, :order-id 10702, :total 330.00M}
    {:customer-id ALFKI, :order-id 10952, :total 471.20M}
    {:customer-id ANATR, :order-id 10308, :total 88.80M}
    {:customer-id ANATR, :order-id 10625, :total 479.75M}
    ...

### linq16: SelectMany - Compound from 3
```csharp
//c#
public void Linq16()
{
    List<Customer> customers = GetCustomerList();

    var orders =
        from c in customers
        from o in c.Orders
        where o.OrderDate >= new DateTime(1998, 1, 1)
        select new { c.CustomerID, o.OrderID, o.OrderDate };

    ObjectDumper.Write(orders);
}
```
```elixir
# elixir
test "linq16: SelectMany - Compound from 3" do
  customers = get_customer_list()

  orders =
    for c <- customers,
        o <- c.orders,
        Date.compare(o.orderdate, Date.from_erl!({1998, 1, 1})) in [:gt, :eq],
        do: %{customer_id: c.id, order_id: o.id, total: o.total}

  IO.inspect orders

  assert length(orders) == 270
end
```
#### Output

    {:customer-id ALFKI, :order-id 10835, :order-date #<DateTime 1998-01-15T00:00:00.000-05:00>}
    {:customer-id ALFKI, :order-id 10952, :order-date #<DateTime 1998-03-16T00:00:00.000-05:00>}
    {:customer-id ALFKI, :order-id 11011, :order-date #<DateTime 1998-04-09T00:00:00.000-04:00>}
    {:customer-id ANATR, :order-id 10926, :order-date #<DateTime 1998-03-04T00:00:00.000-05:00>}
    {:customer-id ANTON, :order-id 10856, :order-date #<DateTime 1998-01-28T00:00:00.000-05:00>}
    ...

### linq17: SelectMany - from Assignment
```csharp
//c#
public void Linq17()
{
    List<Customer> customers = GetCustomerList();

    var orders =
        from c in customers
        from o in c.Orders
        where o.Total >= 2000.0M
        select new { c.CustomerID, o.OrderID, o.Total };

    ObjectDumper.Write(orders);
}
```
```elixir
# elixir
test "linq17: SelectMany - from Assignment" do
  customers = get_customer_list()

  orders =
    for c <- customers,
        o <- c.orders,
        elem(Float.parse(o.total), 0) >= 2000.0,
        do: %{customer_id: c.id, order_id: o.id, total: o.total}

  IO.inspect orders

  assert length(orders) == 185
end
```
#### Output

    {:customer-id ANTON, :order-id 10573, :total 2082.00M}
    {:customer-id AROUT, :order-id 10558, :total 2142.90M}
    {:customer-id AROUT, :order-id 10953, :total 4441.25M}
    {:customer-id BERGS, :order-id 10384, :total 2222.40M}
    {:customer-id BERGS, :order-id 10524, :total 3192.65M}
    ...

### linq18: SelectMany - Multiple from
```csharp
//c#
public void Linq18()
{
    List<Customer> customers = GetCustomerList();

    DateTime cutoffDate = new DateTime(1997, 1, 1);

    var orders =
        from c in customers
        where c.Region == "WA"
        from o in c.Orders
        where o.OrderDate >= cutoffDate
        select new { c.CustomerID, o.OrderID };

    ObjectDumper.Write(orders);
}
```
```elixir
# elixir
test "linq18: SelectMany - Multiple from" do
  customers = get_customer_list()

  cutoff_date = Date.from_erl!({1997, 1, 1})

  orders =
    for c <- customers,
        o <- c.orders,
        c.region == "WA",
        Date.compare(o.orderdate, cutoff_date) in [:gt, :eq],
        do: %{customer_id: c.id, order_id: o.id, total: o.total, orderdate: o.orderdate}

  IO.inspect orders

  assert length(orders) == 17
end
```
#### Output

    {:customer-id LAZYK, :order-id 10482}
    {:customer-id LAZYK, :order-id 10545}
    {:customer-id TRAIH, :order-id 10574}
    {:customer-id TRAIH, :order-id 10577}
    {:customer-id TRAIH, :order-id 10822}
    {:customer-id WHITC, :order-id 10469}
    {:customer-id WHITC, :order-id 10483}
    {:customer-id WHITC, :order-id 10504}
    {:customer-id WHITC, :order-id 10596}
    {:customer-id WHITC, :order-id 10693}
    {:customer-id WHITC, :order-id 10696}
    {:customer-id WHITC, :order-id 10723}
    {:customer-id WHITC, :order-id 10740}
    {:customer-id WHITC, :order-id 10861}
    {:customer-id WHITC, :order-id 10904}
    {:customer-id WHITC, :order-id 11032}
    {:customer-id WHITC, :order-id 11066}

### linq19: SelectMany - Indexed
```csharp
//c#
public void Linq19()
{
    List<Customer> customers = GetCustomerList();

    var customerOrders =
        customers.SelectMany(
            (cust, custIndex) =>
            cust.Orders.Select(o => "Customer #" + (custIndex + 1) +
                                    " has an order with OrderID " + o.OrderID));

    ObjectDumper.Write(customerOrders);
}
```
```elixir
# elixir
test "linq19: SelectMany - Indexed" do
  customers = get_customer_list()

  customerOrders =
    for {c, idx} <- Enum.with_index(customers),
        o <- c.orders,
        do: "Customer ##{idx + 1} has an order with OrderId #{o.id}"

  IO.inspect customerOrders

  assert customerOrders |> Enum.at(0) == "Customer #1 has an order with OrderId 10643"
  assert customerOrders |> Enum.at(-1) == "Customer #91 has an order with OrderId 11044"
  assert length(customerOrders) == 830
end
```
#### Output

    Customer #1 has an order with OrderID 10643
    Customer #1 has an order with OrderID 10692
    Customer #1 has an order with OrderID 10702
    Customer #1 has an order with OrderID 10835
    Customer #1 has an order with OrderID 10952
    Customer #1 has an order with OrderID 11011
    Customer #2 has an order with OrderID 10308
    Customer #2 has an order with OrderID 10625
    Customer #2 has an order with OrderID 10759
    Customer #2 has an order with OrderID 10926
    ...
LINQ - Partitioning Operators
-----------------------------
### linq20: Take - Simple
```csharp
//c#
public void Linq20()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    var first3Numbers = numbers.Take(3);

    Console.WriteLine("First 3 numbers:");

    foreach (var n in first3Numbers)
    {
        Console.WriteLine(n);
    }
}
```
```elixir
# elixir
test "linq20: Take - Simple" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0];

  first_3_numbers = numbers |> Enum.take(3)

  IO.puts "First 3 numbers:"
  for n <- first_3_numbers, do: IO.puts n

  assert 3 == length(first_3_numbers)
end
```
#### Output

    First 3 numbers:
    5
    4
    1

### linq21: Take - Nested
```csharp
//c#
public void Linq21()
{
    List<Customer> customers = GetCustomerList();

    var first3WAOrders = (
        from c in customers
        from o in c.Orders
        where c.Region == "WA"
        select new { c.CustomerID, o.OrderID, o.OrderDate })
        .Take(3);

    Console.WriteLine("First 3 orders in WA:");
    foreach (var order in first3WAOrders)
    {
        ObjectDumper.Write(order);
    }
}
```
```elixir
# elixir
test "linq21: Take - Nested" do
  customers = get_customer_list()

  first_3_wa_orders =
    (for c <- customers,
         o <- c.orders,
         c.region == "WA",
         do: %{customer_id: c.id, order_id: o.id, order_date: o.orderdate})
    |> Enum.take(3)

  IO.puts "First 3 orders in WA:"
  for o <- first_3_wa_orders, do: IO.inspect(o)

  assert 3 == length(first_3_wa_orders)
end
```
#### Output

    First 3 orders in WA:
    {:customer-id LAZYK, :order-id 10482, :order-date #<DateTime 1997-03-21T00:00:00.000-05:00>}
    {:customer-id LAZYK, :order-id 10545, :order-date #<DateTime 1997-05-22T00:00:00.000-04:00>}
    {:customer-id TRAIH, :order-id 10574, :order-date #<DateTime 1997-06-19T00:00:00.000-04:00>}

### linq22: Skip - Simple
```csharp
//c#
public void Linq22()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    var allButFirst4Numbers = numbers.Skip(4);

    Console.WriteLine("All but first 4 numbers:");
    foreach (var n in allButFirst4Numbers)
    {
        Console.WriteLine(n);
    }
}
```
```elixir
# elixir
test "linq22: Skip - Simple" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  all_but_first_4_numbers = numbers |> Enum.drop(4)

  IO.puts "All but first 4 numbers:"
  for n <- numbers, do: IO.puts n

  assert 6 == length(all_but_first_4_numbers)
end
```
#### Output

    All but first 4 numbers:
    9
    8
    6
    7
    2
    0

### linq23: Skip - Nested
```csharp
//c#
public void Linq23()
{
    List<Customer> customers = GetCustomerList();

    var waOrders =
        from c in customers
        from o in c.Orders
        where c.Region == "WA"
        select new { c.CustomerID, o.OrderID, o.OrderDate };

    var allButFirst2Orders = waOrders.Skip(2);

    Console.WriteLine("All but first 2 orders in WA:");
    foreach (var order in allButFirst2Orders)
    {
        ObjectDumper.Write(order);
    }
}
```
```elixir
# elixir
test "linq23: Skip - Nested" do
  customers = get_customer_list()

  wa_orders =
    for c <- customers,
        o <- c.orders,
        c.region == "WA",
        do: %{customer_id: c.id, order_id: o.id, order_date: o.orderdate}

  all_but_first_2_orders = wa_orders |> Enum.drop(2)

  IO.puts "All but first 2 orders in WA:"
  for o <- all_but_first_2_orders, do: IO.inspect o

  assert 17 == length all_but_first_2_orders
end
```
#### Output

    All but first 2 orders in WA:
    {:customer-id TRAIH, :order-id 10574, :order-date #<DateTime 1997-06-19T00:00:00.000-04:00>}
    {:customer-id TRAIH, :order-id 10577, :order-date #<DateTime 1997-06-23T00:00:00.000-04:00>}
    {:customer-id TRAIH, :order-id 10822, :order-date #<DateTime 1998-01-08T00:00:00.000-05:00>}
    {:customer-id WHITC, :order-id 10269, :order-date #<DateTime 1996-07-31T00:00:00.000-04:00>}
    {:customer-id WHITC, :order-id 10344, :order-date #<DateTime 1996-11-01T00:00:00.000-05:00>}
    {:customer-id WHITC, :order-id 10469, :order-date #<DateTime 1997-03-10T00:00:00.000-05:00>}
    {:customer-id WHITC, :order-id 10483, :order-date #<DateTime 1997-03-24T00:00:00.000-05:00>}
    {:customer-id WHITC, :order-id 10504, :order-date #<DateTime 1997-04-11T00:00:00.000-04:00>}
    {:customer-id WHITC, :order-id 10596, :order-date #<DateTime 1997-07-11T00:00:00.000-04:00>}
    {:customer-id WHITC, :order-id 10693, :order-date #<DateTime 1997-10-06T00:00:00.000-04:00>}
    {:customer-id WHITC, :order-id 10696, :order-date #<DateTime 1997-10-08T00:00:00.000-04:00>}
    {:customer-id WHITC, :order-id 10723, :order-date #<DateTime 1997-10-30T00:00:00.000-05:00>}
    {:customer-id WHITC, :order-id 10740, :order-date #<DateTime 1997-11-13T00:00:00.000-05:00>}
    {:customer-id WHITC, :order-id 10861, :order-date #<DateTime 1998-01-30T00:00:00.000-05:00>}
    {:customer-id WHITC, :order-id 10904, :order-date #<DateTime 1998-02-24T00:00:00.000-05:00>}
    {:customer-id WHITC, :order-id 11032, :order-date #<DateTime 1998-04-17T00:00:00.000-04:00>}
    {:customer-id WHITC, :order-id 11066, :order-date #<DateTime 1998-05-01T00:00:00.000-04:00>}

### linq24: TakeWhile - Simple
```csharp
//c#
public void Linq24()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    var firstNumbersLessThan6 = numbers.TakeWhile(n => n < 6);

    Console.WriteLine("First numbers less than 6:");
    foreach (var n in firstNumbersLessThan6)
    {
        Console.WriteLine(n);
    }
}
```
```elixir
# elixir
test "linq24: TakeWhile - Simple" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  first_numbers_less_than_6 = numbers |> Enum.take_while(fn x -> x < 6 end)

  IO.puts "First numbers less than 6:"
  for n <- first_numbers_less_than_6, do: IO.puts n

  assert 4 == length(first_numbers_less_than_6)
end
```
#### Output

    First numbers less than 6:
    5
    4
    1
    3

### linq25: TakeWhile - Indexed
```csharp
//c#
public void Linq25()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    var firstSmallNumbers = numbers.TakeWhile((n, index) => n >= index);

    Console.WriteLine("First numbers not less than their position:");
    foreach (var n in firstSmallNumbers)
    {
        Console.WriteLine(n);
    }
}
```
```elixir
# elixir
test "linq25: TakeWhile - Indexed" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  first_small_numbers = numbers
  |> Enum.with_index
  |> Enum.take_while(fn {n, index} -> n >= index end)
  |> Enum.map(fn {x,_} -> x end)

  IO.puts "First numbers not less than their position:"
  for n <- first_small_numbers, do: IO.puts n

  assert 2 == length(first_small_numbers)
end
```
#### Output

    First numbers not less than their position:
    5
    4

### linq26: SkipWhile - Simple
```csharp
//c#
public void Linq26()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    var allButFirst3Numbers = numbers.SkipWhile(n => n % 3 != 0);

    Console.WriteLine("All elements starting from first element divisible by 3:");
    foreach (var n in allButFirst3Numbers)
    {
        Console.WriteLine(n);
    }
}
```
```elixir
# elixir
test "linq26: SkipWhile - Simple" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  all_but_first_3_numbers = numbers |> Enum.drop_while(fn x -> rem(x, 3) != 0 end)

  IO.puts "All elements starting from first element divisible by 3:"
  for n <- all_but_first_3_numbers, do: IO.puts n

  assert 7 == length(all_but_first_3_numbers)
end
```
#### Output

    All elements starting from first element divisible by 3:
    3
    9
    8
    6
    7
    2
    0

### linq27: SkipWhile - Indexed
```csharp
//c#
public void Linq27()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    var laterNumbers = numbers.SkipWhile((n, index) => n >= index);

    Console.WriteLine("All elements starting from first element less than its position:");
    foreach (var n in laterNumbers)
    {
        Console.WriteLine(n);
    }
}
```
```elixir
# elixir
test "linq27: SkipWhile - Indexed" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  later_numbers = numbers
  |> Enum.with_index
  |> Enum.drop_while(fn {n, index} -> n >= index end)
  |> Enum.map(fn {x,_} -> x end)

  IO.puts "All elements starting from first element less than its position:"
  for n <- later_numbers, do: IO.puts n

  assert 8 == length(later_numbers)
end
```
#### Output

    All elements starting from first element less than its position:
    1
    3
    9
    8
    6
    7
    2
    0

LINQ - Ordering Operators
-------------------------
### C# utils added

```csharp
public class CaseInsensitiveComparer : IComparer<string>
{
    public int Compare(string x, string y)
    {
        return string.Compare(x, y, StringComparison.OrdinalIgnoreCase);
    }
}
```

### linq28: OrderBy - Simple 1
```csharp
//c#
public void Linq28()
{
    string[] words = { "cherry", "apple", "blueberry" };

    var sortedWords =
        from w in words
        orderby w
        select w;

    Console.WriteLine("The sorted list of words:");
    foreach (var w in sortedWords)
    {
        Console.WriteLine(w);
    }
}
```
```elixir
# elixir
test "linq28: OrderBy - Simple 1" do
  words = ["cherry", "apple", "blueberry"]
  sorted_words = Enum.sort(words)

  IO.puts "The sorted list of words:"
  for w <- words, do: IO.puts w

  assert ["apple", "blueberry", "cherry"] == sorted_words
end
```
#### Output

    The sorted list of words:
    apple
    blueberry
    cherry

### linq29: OrderBy - Simple 2
```csharp
//c#
public void Linq29()
{
    string[] words = { "cherry", "apple", "blueberry" };

    var sortedWords =
        from w in words
        orderby w.Length
        select w;

    Console.WriteLine("The sorted list of words (by length):");
    foreach (var w in sortedWords)
    {
        Console.WriteLine(w);
    }
}
```
```elixir
# elixir
test "linq29: OrderBy - Simple 2" do
  words = ["cherry", "apple", "blueberry"]
  sorted_words = words |> Enum.sort_by(&String.length/1)

  IO.puts "The sorted list of words (by length):"
  for w <- words, do: IO.puts w

  assert ["apple", "cherry", "blueberry"] == sorted_words
end
```
#### Output

    The sorted list of words (by length):
    apple
    cherry
    blueberry

### linq30: OrderBy - Simple 3
```csharp
//c#
public void Linq30()
{
    List<Product> products = GetProductList();

    var sortedProducts =
        from p in products
        orderby p.ProductName
        select p;

    ObjectDumper.Write(sortedProducts);
}
```
```elixir
# elixir
test "linq30: OrderBy - Simple 3" do
  products = get_product_list()

  sorted_products = products
  |> Enum.sort_by(fn x -> x.product_name end)

  IO.inspect sorted_products

  assert 17 == hd(sorted_products).product_id
end
```
#### Output

    #clj_linq.data.Product{:product-id 17, :product-name Alice Mutton, :category Meat/Poultry, :unit-price 39.0, :units-in-stock 0}
    #clj_linq.data.Product{:product-id 3, :product-name Aniseed Syrup, :category Condiments, :unit-price 10.0, :units-in-stock 13}
    #clj_linq.data.Product{:product-id 40, :product-name Boston Crab Meat, :category Seafood, :unit-price 18.4, :units-in-stock 123}
    #clj_linq.data.Product{:product-id 60, :product-name Camembert Pierrot, :category Dairy Products, :unit-price 34.0, :units-in-stock 19}
    #clj_linq.data.Product{:product-id 18, :product-name Carnarvon Tigers, :category Seafood, :unit-price 62.5, :units-in-stock 42}
    ...

### linq31: OrderBy - Comparer
```csharp
//c#
public void Linq31()
{
    string[] words = { "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" };

    var sortedWords = words.OrderBy(a => a, new CaseInsensitiveComparer());

    ObjectDumper.Write(sortedWords);
}
```
```elixir
# elixir
test "linq31: OrderBy - Comparer" do
  words = ["aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry"];

  sorted_words = words |> Enum.sort_by(&String.downcase/1)

  IO.inspect sorted_words

  assert "AbAcUs" == hd(sorted_words)
end
```
#### Output

    AbAcUs
    aPPLE
    BlUeBeRrY
    bRaNcH
    cHeRry
    ClOvEr

### linq32: OrderByDescending - Simple 1
```csharp
//c#
public void Linq32()
{
    double[] doubles = { 1.7, 2.3, 1.9, 4.1, 2.9 };

    var sortedDoubles =
        from d in doubles
        orderby d descending
        select d;

    Console.WriteLine("The doubles from highest to lowest:");
    foreach (var d in sortedDoubles)
    {
        Console.WriteLine(d);
    }
}
```
```elixir
# elixir
test "linq32: OrderByDescending - Simple 1" do
  doubles = [1.7, 2.3, 1.9, 4.1, 2.9]

  sorted_doubles = doubles |> Enum.sort |> Enum.reverse

  IO.puts "The doubles from highest to lowest:"
  for d <- sorted_doubles, do: IO.puts d

  assert 4.1 == hd(sorted_doubles)
end
```
#### Output

    The doubles from highest to lowest:
    4.1
    2.9
    2.3
    1.9
    1.7

### linq33: OrderByDescending - Simple 2
```csharp
//c#
public void Linq33()
{
    List<Product> products = GetProductList();

    var sortedProducts =
        from p in products
        orderby p.UnitsInStock descending
        select p;

    ObjectDumper.Write(sortedProducts);
}
```
```elixir
# elixir
test "linq33: OrderByDescending - Simple 2" do
  products = get_product_list()

  sorted_products = products |> Enum.sort(&(&1.units_in_stock >= &2.units_in_stock))

  IO.inspect sorted_products

  assert 75 == hd(sorted_products).product_id
end
```
#### Output

    #clj_linq.data.Product{:product-id 75, :product-name Rhönbräu Klosterbier, :category Beverages, :unit-price 7.75, :units-in-stock 125}
    #clj_linq.data.Product{:product-id 40, :product-name Boston Crab Meat, :category Seafood, :unit-price 18.4, :units-in-stock 123}
    #clj_linq.data.Product{:product-id 6, :product-name Grandma's Boysenberry Spread, :category Condiments, :unit-price 25.0, :units-in-stock 120}
    #clj_linq.data.Product{:product-id 55, :product-name Pâté chinois, :category Meat/Poultry, :unit-price 24.0, :units-in-stock 115}
    #clj_linq.data.Product{:product-id 61, :product-name Sirop d'érable, :category Condiments, :unit-price 28.5, :units-in-stock 113}
    ...

### linq34: OrderByDescending - Comparer
```csharp
//c#
public void Linq34()
{
    string[] words = { "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" };

    var sortedWords = words.OrderByDescending(a => a, new CaseInsensitiveComparer());

    ObjectDumper.Write(sortedWords);
}
```
```elixir
# elixir
test "linq34: OrderByDescending - Comparer" do
  words = ["aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry"]

  sorted_words = words |> Enum.sort(&(String.downcase(&1) >= String.downcase(&2)))

  IO.inspect sorted_words

  assert "ClOvEr" == hd(sorted_words)
end
```
#### Output

    ClOvEr
    cHeRry
    bRaNcH
    BlUeBeRrY
    aPPLE
    AbAcUs

### linq35: ThenBy - Simple
```csharp
//c#
public void Linq35()
{
    string[] digits = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };

    var sortedDigits =
        from d in digits
        orderby d.Length, d
        select d;

    Console.WriteLine("Sorted digits:");
    foreach (var d in sortedDigits)
    {
        Console.WriteLine(d);
    }
}
```
```elixir
# elixir
test "linq35: ThenBy - Simple" do
  digits = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

  sorted_digits = digits
  |> Enum.sort
  |> Enum.sort_by(fn x -> String.length(x) end)

  IO.puts "Sorted digits:"
  for d <- sorted_digits, do: IO.puts d

  assert ["one", "six", "two", "five", "four", "nine", "zero", "eight", "seven", "three"] == sorted_digits
end
```
#### Output

    Sorted digits:
    one
    six
    two
    five
    four
    nine
    zero
    eight
    seven
    three

### linq36: ThenBy - Comparer
```csharp
//c#
public void Linq36()
{
    string[] words = { "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" };

    var sortedWords =
        words.OrderBy(a => a.Length)
             .ThenBy(a => a, new CaseInsensitiveComparer());

    ObjectDumper.Write(sortedWords);
}
```
```elixir
# elixir
test "linq36: ThenBy - Comparer" do
  words = ["aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry"]

  sorted_words = words
  |> Enum.sort_by(&String.downcase/1)
  |> Enum.sort_by(&String.length/1)

  IO.inspect sorted_words

  assert ["aPPLE", "AbAcUs", "bRaNcH", "cHeRry", "ClOvEr", "BlUeBeRrY"] == sorted_words
end
```
#### Output

    aPPLE
    AbAcUs
    bRaNcH
    cHeRry
    ClOvEr
    BlUeBeRrY

### linq37: ThenByDescending - Simple
```csharp
//c#
public void Linq37()
{
    List<Product> products = GetProductList();

    var sortedProducts =
        from p in products
        orderby p.Category, p.UnitPrice descending
        select p;

    ObjectDumper.Write(sortedProducts);
}
```
```elixir
# elixir
test "linq37: ThenByDescending - Simple" do
  products = get_product_list()

  sorted_products = products
  |> Enum.sort(fn x,y -> x.unit_price >= y.unit_price end)
  |> Enum.sort_by(&(&1.category))

  IO.inspect sorted_products

  assert 38 == hd(sorted_products).product_id
end
```
#### Output

    #clj_linq.data.Product{:product-id 38, :product-name Côte de Blaye, :category Beverages, :unit-price 263.5, :units-in-stock 17}
    #clj_linq.data.Product{:product-id 43, :product-name Ipoh Coffee, :category Beverages, :unit-price 46.0, :units-in-stock 17}
    #clj_linq.data.Product{:product-id 2, :product-name Chang, :category Beverages, :unit-price 19.0, :units-in-stock 17}
    #clj_linq.data.Product{:product-id 1, :product-name Chai, :category Beverages, :unit-price 18.0, :units-in-stock 39}
    #clj_linq.data.Product{:product-id 35, :product-name Steeleye Stout, :category Beverages, :unit-price 18.0, :units-in-stock 20}
    #clj_linq.data.Product{:product-id 39, :product-name Chartreuse verte, :category Beverages, :unit-price 18.0, :units-in-stock 69}
    #clj_linq.data.Product{:product-id 76, :product-name Lakkalikööri, :category Beverages, :unit-price 18.0, :units-in-stock 57}
    #clj_linq.data.Product{:product-id 70, :product-name Outback Lager, :category Beverages, :unit-price 15.0, :units-in-stock 15}
    #clj_linq.data.Product{:product-id 34, :product-name Sasquatch Ale, :category Beverages, :unit-price 14.0, :units-in-stock 111}
    ...

### linq38: ThenByDescending - Comparer
```csharp
//c#
public void Linq38()
{
    string[] words = { "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" };

    var sortedWords =
        words.OrderBy(a => a.Length)
             .ThenByDescending(a => a, new CaseInsensitiveComparer());

    ObjectDumper.Write(sortedWords);
}
```
```elixir
# elixir
test "linq38: ThenByDescending - Comparer" do
  words = ["aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry"]

  sorted_words = words
  |> Enum.sort(fn x,y -> String.downcase(x) >= String.downcase(y) end)
  |> Enum.sort_by(&String.length/1)

  IO.inspect sorted_words

  assert ["aPPLE", "ClOvEr", "cHeRry", "bRaNcH", "AbAcUs", "BlUeBeRrY"] == sorted_words
end
```
#### Output

    aPPLE
    ClOvEr
    cHeRry
    bRaNcH
    AbAcUs
    BlUeBeRrY

### linq39: Reverse
```csharp
//c#
public void Linq39()
{
    string[] digits = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };

    var reversedIDigits = (
        from d in digits
        where d[1] == 'i'
        select d)
        .Reverse();

    Console.WriteLine("A backwards list of the digits with a second character of 'i':");
    foreach (var d in reversedIDigits)
    {
        Console.WriteLine(d);
    }
}
```
```elixir
# elixir
test "linq39: Reverse" do
  digits = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

  reversed_i_digits = digits
  |> Enum.filter(fn x -> String.at(x, 1) == "i" end)
  |> Enum.reverse

  IO.puts "A backwards list of the digits with a second character of 'i':"
  for d <- reversed_i_digits, do: IO.puts d

  assert ["nine", "eight", "six", "five"] == reversed_i_digits
end
```
#### Output

    A backwards list of the digits with a second character of 'i':
    nine
    eight
    six
    five
LINQ - Grouping Operators
-------------------------
### C# utils added

```csharp
public class AnagramEqualityComparer : IEqualityComparer<string>
{
    public bool Equals(string x, string y)
    {
        return getCanonicalString(x) == getCanonicalString(y);
    }

    public int GetHashCode(string obj)
    {
        return getCanonicalString(obj).GetHashCode();
    }

    private string getCanonicalString(string word)
    {
        char[] wordChars = word.ToCharArray();
        Array.Sort<char>(wordChars);
        return new string(wordChars);
    }
}
```

### linq40: GroupBy - Simple 1
```csharp
//c#
public void Linq40()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    var numberGroups =
        from n in numbers
        group n by n % 5 into g
        select new { Remainder = g.Key, Numbers = g };

    foreach (var g in numberGroups)
    {
        Console.WriteLine("Numbers with a remainder of {0} when divided by 5:", g.Remainder);
        foreach (var n in g.Numbers)
        {
            Console.WriteLine(n);
        }
    }
}
```
```elixir
# elixir
test "linq40: GroupBy - Simple 1" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  number_groups = numbers
  |> Enum.group_by(fn x -> rem(x, 5) end)
  |> Enum.map(fn {rem,num} -> %{remainder: rem, numbers: num} end)

  for g <- number_groups do
    IO.puts "Numbers with a remainder of #{g.remainder} when divided by 5:"
    for n <- g.numbers, do: IO.puts n
  end

  assert 5 == length(number_groups)
end
```
#### Output

    Numbers with a remainder of 0 when divided by 5:
    5
    0
    Numbers with a remainder of 4 when divided by 5:
    4
    9
    Numbers with a remainder of 1 when divided by 5:
    1
    6
    Numbers with a remainder of 3 when divided by 5:
    3
    8
    Numbers with a remainder of 2 when divided by 5:
    7
    2

### linq41: GroupBy - Simple 2
```csharp
//c#
public void Linq41()
{
    string[] words = { "blueberry", "chimpanzee", "abacus", "banana", "apple", "cheese" };

    var wordGroups =
        from w in words
        group w by w[0] into g
        select new { FirstLetter = g.Key, Words = g };

    foreach (var g in wordGroups)
    {
        Console.WriteLine("Words that start with the letter '{0}':", g.FirstLetter);
        foreach (var w in g.Words)
        {
            Console.WriteLine(w);
        }
    }
}
```
```elixir
# elixir
test "linq41: GroupBy - Simple 2" do
  words = ["blueberry", "chimpanzee", "abacus", "banana", "apple", "cheese"]

  word_groups = words
  |> Enum.group_by(fn x -> String.at(x, 0) end)
  |> Enum.map(fn {fl, words} -> %{first_letter: fl, words: words} end)

  for g <- word_groups do
    IO.puts "Words that start with the letter '#{g.first_letter}'"
    for w <- g.words, do: IO.puts w
  end

  assert 3 == length(word_groups)
end
```
#### Output

    Words that start with the letter:  b
    blueberry
    banana
    Words that start with the letter:  c
    chimpanzee
    cheese
    Words that start with the letter:  a
    abacus
    apple

### linq42: GroupBy - Simple 3
```csharp
//c#
public void Linq42()
{
    List<Product> products = GetProductList();

    var orderGroups =
        from p in products
        group p by p.Category into g
        select new { Category = g.Key, Products = g };

    ObjectDumper.Write(orderGroups, 1);
}
```
```elixir
# elixir
test "linq42: GroupBy - Simple 3" do
  products = get_product_list()

  order_groups = products
  |> Enum.group_by(fn x -> x.category end)
  |> Enum.map(fn {cat, prods} -> %{category: cat, products: prods} end)

  IO.inspect order_groups

  assert 8 == length(order_groups)
end
```
#### Output

    {:products [#clj_linq.data.Product{:product-id 1, :product-name Chai, :category Beverages, :unit-price 18.0, :units-in-stock 39} #clj_linq.data.Product{:product-id 2, :product-name Chang, :category Beverages, :unit-price 19.0, :units-in-stock 17} #clj_linq.data.Product{:product-id 24, :product-name Guaraná Fantástica, :category Beverages, :unit-price 4.5, :units-in-stock 20} #clj_linq.data.Product{:product-id 34, :product-name Sasquatch Ale, :category Beverages, :unit-price 14.0, :units-in-stock 111} #clj_linq.data.Product{:product-id 35, :product-name Steeleye Stout, :category Beverages, :unit-price 18.0, :units-in-stock 20} #clj_linq.data.Product{:product-id 38, :product-name Côte de Blaye, :category Beverages, :unit-price 263.5, :units-in-stock 17} #clj_linq.data.Product{:product-id 39, :product-name Chartreuse verte, :category Beverages, :unit-price 18.0, :units-in-stock 69} #clj_linq.data.Product{:product-id 43, :product-name Ipoh Coffee, :category Beverages, :unit-price 46.0, :units-in-stock 17} #clj_linq.data.Product{:product-id 67, :product-name Laughing Lumberjack Lager, :category Beverages, :unit-price 14.0, :units-in-stock 52} #clj_linq.data.Product{:product-id 70, :product-name Outback Lager, :category Beverages, :unit-price 15.0, :units-in-stock 15} #clj_linq.data.Product{:product-id 75, :product-name Rhönbräu Klosterbier, :category Beverages, :unit-price 7.75, :units-in-stock 125} #clj_linq.data.Product{:product-id 76, :product-name Lakkalikööri, :category Beverages, :unit-price 18.0, :units-in-stock 57}], :category Beverages}
    {:products [#clj_linq.data.Product{:product-id 3, :product-name Aniseed Syrup, :category Condiments, :unit-price 10.0, :units-in-stock 13} #clj_linq.data.Product{:product-id 4, :product-name Chef Anton's Cajun Seasoning, :category Condiments, :unit-price 22.0, :units-in-stock 53} #clj_linq.data.Product{:product-id 5, :product-name Chef Anton's Gumbo Mix, :category Condiments, :unit-price 21.35, :units-in-stock 0} #clj_linq.data.Product{:product-id 6, :product-name Grandma's Boysenberry Spread, :category Condiments, :unit-price 25.0, :units-in-stock 120} #clj_linq.data.Product{:product-id 8, :product-name Northwoods Cranberry Sauce, :category Condiments, :unit-price 40.0, :units-in-stock 6} #clj_linq.data.Product{:product-id 15, :product-name Genen Shouyu, :category Condiments, :unit-price 15.5, :units-in-stock 39} #clj_linq.data.Product{:product-id 44, :product-name Gula Malacca, :category Condiments, :unit-price 19.45, :units-in-stock 27} #clj_linq.data.Product{:product-id 61, :product-name Sirop d'érable, :category Condiments, :unit-price 28.5, :units-in-stock 113} #clj_linq.data.Product{:product-id 63, :product-name Vegie-spread, :category Condiments, :unit-price 43.9, :units-in-stock 24} #clj_linq.data.Product{:product-id 65, :product-name Louisiana Fiery Hot Pepper Sauce, :category Condiments, :unit-price 21.05, :units-in-stock 76} #clj_linq.data.Product{:product-id 66, :product-name Louisiana Hot Spiced Okra, :category Condiments, :unit-price 17.0, :units-in-stock 4} #clj_linq.data.Product{:product-id 77, :product-name Original Frankfurter grüne Soße, :category Condiments, :unit-price 13.0, :units-in-stock 32}], :category Condiments}

### linq43: GroupBy - Nested
```csharp
//c#
public void Linq43()
{
    List<Customer> customers = GetCustomerList();

    var customerOrderGroups =
        from c in customers
        select
            new
            {
                c.CompanyName,
                YearGroups =
                    from o in c.Orders
                    group o by o.OrderDate.Year into yg
                    select
                        new
                        {
                            Year = yg.Key,
                            MonthGroups =
                                from o in yg
                                group o by o.OrderDate.Month into mg
                                select new { Month = mg.Key, Orders = mg }
                        }
            };

    ObjectDumper.Write(customerOrderGroups, 3);
}
```
```elixir
# elixir
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

  IO.inspect customer_order_groups, limit: 10, pretty: true

  assert 91 == length(customer_order_groups)
end
```
#### Output

    {:company-name Alfreds Futterkiste, :year-groups ({:month-groups ({:month 8, :orders [#clj_linq.data.Order{:order-id 10643, :order-date #<DateTime 1997-08-25T00:00:00.000-04:00>, :total 814.50M}]} {:month 10, :orders [#clj_linq.data.Order{:order-id 10692, :order-date #<DateTime 1997-10-03T00:00:00.000-04:00>, :total 878.00M}]} {:month 10, :orders [#clj_linq.data.Order{:order-id 10702, :order-date #<DateTime 1997-10-13T00:00:00.000-04:00>, :total 330.00M}]} {:month 1, :orders [#clj_linq.data.Order{:order-id 10835, :order-date #<DateTime 1998-01-15T00:00:00.000-05:00>, :total 845.80M}]} {:month 3, :orders [#clj_linq.data.Order{:order-id 10952, :order-date #<DateTime 1998-03-16T00:00:00.000-05:00>, :total 471.20M}]} {:month 4, :orders [#clj_linq.data.Order{:order-id 11011, :order-date #<DateTime 1998-04-09T00:00:00.000-04:00>, :total 933.50M}]}), :year nil})}

### linq44: GroupBy - Comparer
```csharp
//c#
public void Linq44()
{
    string[] anagrams = { "from   ", " salt", " earn ", "  last   ", " near ", " form  " };

    var orderGroups = anagrams.GroupBy(w => w.Trim(), new AnagramEqualityComparer());

    ObjectDumper.Write(orderGroups, 1);
}
```
```elixir
# elixir
test "linq44: GroupBy - Comparer" do
  anagrams = ["from   ", " salt", " earn ", "  last   ", " near ", " form  "]

  order_groups = anagrams
  |> Enum.group_by(fn x -> x
    |> String.trim
    |> String.downcase
    |> String.codepoints
    |> Enum.sort
  end)

  for g <- order_groups, do: IO.inspect elem(g, 1)

  assert 3 == Map.size(order_groups)
end
```
#### Output

    [from     form  ]
    [ salt   last   ]
    [ earn   near ]

### linq45: GroupBy - Comparer, Mapped
```csharp
//c#
public void Linq45()
{
    string[] anagrams = { "from   ", " salt", " earn ", "  last   ", " near ", " form  " };

    var orderGroups = anagrams.GroupBy(
                w => w.Trim(),
                a => a.ToUpper(),
                new AnagramEqualityComparer()
                );

    ObjectDumper.Write(orderGroups, 1);
}
```
```elixir
# elixir
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

  for g <- order_groups, do: IO.inspect g

  assert 3 == length(order_groups)
end
```
#### Output

    [FROM     FORM  ]
    [ SALT   LAST   ]
    [ EARN   NEAR ]

LINQ - Set Operators
--------------------
### linq46: Distinct - 1
```csharp
//c#
public void Linq46()
{
    int[] factorsOf300 = { 2, 2, 3, 5, 5 };

    var uniqueFactors = factorsOf300.Distinct();

    Console.WriteLine("Prime factors of 300:");
    foreach (var f in uniqueFactors)
    {
        Console.WriteLine(f);
    }
}
```
```elixir
# elixir
test "linq46: Distinct - 1" do
  factors_of_300 = [2, 2, 3, 5, 5]

  unique_factors = Enum.uniq(factors_of_300)

  IO.puts "Prime factors of 300:"
  for f <- unique_factors, do: IO.puts f

  assert [2,3,5] == unique_factors
end
```
#### Output

    Prime factors of 300:
    2
    3
    5

### linq47: Distinct - 2
```csharp
//c#
public void Linq47()
{
    List<Product> products = GetProductList();

    var categoryNames = (
        from p in products
        select p.Category)
        .Distinct();

    Console.WriteLine("Category names:");
    foreach (var n in categoryNames)
    {
        Console.WriteLine(n);
    }
}
```
```elixir
# elixir
test "linq47: Distinct - 2" do
  products = get_product_list()

  category_names = products |> Enum.map(fn x -> x.category end) |> Enum.uniq

  IO.puts "Category names:"
  for c <- category_names, do: IO.puts c

  assert 8 == length(category_names)
end
```
#### Output

    Category names:
    Beverages
    Condiments
    Produce
    Meat/Poultry
    Seafood
    Dairy Products
    Confections
    Grains/Cereals

### linq48: Union - 1
```csharp
//c#
public void Linq48()
{
    int[] numbersA = { 0, 2, 4, 5, 6, 8, 9 };
    int[] numbersB = { 1, 3, 5, 7, 8 };

    var uniqueNumbers = numbersA.Union(numbersB);

    Console.WriteLine("Unique numbers from both arrays:");
    foreach (var n in uniqueNumbers)
    {
        Console.WriteLine(n);
    }
}
```
```elixir
# elixir
test "linq48: Union - 1" do
  numbers_a = [0, 2, 4, 5, 6, 8, 9]
  numbers_b = [1, 3, 5, 7, 8]

  unique_numbers = MapSet.union(Enum.into(numbers_a, MapSet.new), Enum.into(numbers_b, MapSet.new)) |> Enum.sort

  IO.puts "Unique numbers from both arrays:"
  for n <- unique_numbers, do: IO.puts n

  assert 10 == length(unique_numbers)
end
```
#### Output

    Unique numbers from both arrays:
    0
    1
    2
    3
    4
    5
    6
    7
    8
    9

### linq49: Union - 2
```csharp
//c#
public void Linq49()
{
    List<Product> products = GetProductList();
    List<Customer> customers = GetCustomerList();

    var productFirstChars =
        from p in products
        select p.ProductName[0];
    var customerFirstChars =
        from c in customers
        select c.CompanyName[0];

    var uniqueFirstChars = productFirstChars.Union(customerFirstChars);

    Console.WriteLine("Unique first letters from Product names and Customer names:");
    foreach (var ch in uniqueFirstChars)
    {
        Console.WriteLine(ch);
    }
}
```
```elixir
# elixir
test "linq49: Union - 2" do
  products = get_product_list()
  customers = get_customer_list()

  product_first_chars = products
  |> Enum.map(fn x -> String.at(x.product_name, 0) end)

  customer_first_chars = customers
  |> Enum.map(fn x -> String.at(x.name, 0) end)

  unique_first_chars = MapSet.union(Enum.into(product_first_chars, MapSet.new), Enum.into(customer_first_chars, MapSet.new)) |> Enum.sort

  IO.puts "Unique first letters from Product names and Customer names:"
  for c <- unique_first_chars, do: IO.puts c

  assert 24 == length(unique_first_chars)
end
```
#### Output

    Unique first letters from Product names and Customer names:
    A
    B
    C
    D
    E
    F
    G
    H
    I
    J
    K
    L
    M
    N
    O
    P
    Q
    R
    S
    T
    U
    V
    W
    Z

### linq50: Intersect - 1
```csharp
//c#
public void Linq50()
{
    int[] numbersA = { 0, 2, 4, 5, 6, 8, 9 };
    int[] numbersB = { 1, 3, 5, 7, 8 };

    var commonNumbers = numbersA.Intersect(numbersB);

    Console.WriteLine("Common numbers shared by both arrays:");
    foreach (var n in commonNumbers)
    {
        Console.WriteLine(n);
    }
}
```
```elixir
# elixir
test "linq50: Intersect - 1" do
  numbers_a = [0, 2, 4, 5, 6, 8, 9]
  numbers_b = [1, 3, 5, 7, 8]

  common_numbers = MapSet.intersection(Enum.into(numbers_a, MapSet.new), Enum.into(numbers_b, MapSet.new)) |> Enum.sort

  IO.puts "Common numbers shared by both arrays:"
  for n <- common_numbers, do: IO.puts n

  assert 2 == length(common_numbers)
end
```
#### Output

    Common numbers shared by both arrays:
    5
    8

### linq51: Intersect - 2
```csharp
//c#
public void Linq51()
{
    List<Product> products = GetProductList();
    List<Customer> customers = GetCustomerList();

    var productFirstChars =
        from p in products
        select p.ProductName[0];
    var customerFirstChars =
        from c in customers
        select c.CompanyName[0];

    var commonFirstChars = productFirstChars.Intersect(customerFirstChars);

    Console.WriteLine("Common first letters from Product names and Customer names:");
    foreach (var ch in commonFirstChars)
    {
        Console.WriteLine(ch);
    }
}
```
```elixir
# elixir
test "linq51: Intersect - 2" do
  products = get_product_list()
  customers = get_customer_list()

  product_first_chars = products
  |> Enum.map(fn x -> String.at(x.product_name, 0) end)

  customer_first_chars = customers
  |> Enum.map(fn x -> String.at(x.name, 0) end)

  common_first_chars = MapSet.intersection(Enum.into(product_first_chars, MapSet.new), Enum.into(customer_first_chars, MapSet.new)) |> Enum.sort

  IO.puts "Common first letters from Product names and Customer names:"
  for c <- common_first_chars, do: IO.puts c

  assert 19 == length(common_first_chars)
end
```
#### Output

    Common first letters from Product names and Customer names:
    A
    B
    C
    E
    F
    G
    I
    K
    L
    M
    N
    O
    P
    Q
    R
    S
    T
    V
    W

### linq52: Except - 1
```csharp
//c#
public void Linq52()
{
    int[] numbersA = { 0, 2, 4, 5, 6, 8, 9 };
    int[] numbersB = { 1, 3, 5, 7, 8 };

    IEnumerable<int> aOnlyNumbers = numbersA.Except(numbersB);

    Console.WriteLine("Numbers in first array but not second array:");
    foreach (var n in aOnlyNumbers)
    {
        Console.WriteLine(n);
    }
}
```
```elixir
# elixir
test "linq52: Except - 1" do
  numbers_a = [0, 2, 4, 5, 6, 8, 9]
  numbers_b = [1, 3, 5, 7, 8]

  a_only_numbers = MapSet.difference(Enum.into(numbers_a, MapSet.new), Enum.into(numbers_b, MapSet.new)) |> Enum.sort

  IO.puts "Numbers in first array but not second array:"
  for n <- a_only_numbers, do: IO.puts n

  assert 5 == length(a_only_numbers)
end
```
#### Output

    Numbers in first array but not second array:
    0
    2
    4
    6
    9

### linq53: Except - 2
```csharp
//c#
public void Linq53()
{
    List<Product> products = GetProductList();
    List<Customer> customers = GetCustomerList();

    var productFirstChars =
        from p in products
        select p.ProductName[0];
    var customerFirstChars =
        from c in customers
        select c.CompanyName[0];

    var productOnlyFirstChars = productFirstChars.Except(customerFirstChars);

    Console.WriteLine("First letters from Product names, but not from Customer names:");
    foreach (var ch in productOnlyFirstChars)
    {
        Console.WriteLine(ch);
    }
}
```
```elixir
# elixir
test "linq53: Except - 2" do
  products = get_product_list()
  customers = get_customer_list()

  product_first_chars = products
  |> Enum.map(fn x -> String.at(x.product_name, 0) end)

  customer_first_chars = customers
  |> Enum.map(fn x -> String.at(x.name, 0) end)

  product_only_first_chars = MapSet.difference(Enum.into(product_first_chars, MapSet.new), Enum.into(customer_first_chars, MapSet.new)) |> Enum.sort

  IO.puts "First letters from Product names, but not from Customer names:"
  for c <- product_only_first_chars, do: IO.puts c

  assert 3 == length(product_only_first_chars)
end
```
#### Output

    First letters from Product names, but not from Customer names:
    J
    U
    Z

LINQ - Conversion Operators
---------------------------
### linq54: ToArray
```csharp
//c#
public void Linq54()
{
    double[] doubles = { 1.7, 2.3, 1.9, 4.1, 2.9 };

    var sortedDoubles =
        from d in doubles
        orderby d descending
        select d;
    var doublesArray = sortedDoubles.ToArray();

    Console.WriteLine("Every other double from highest to lowest:");
    for (int d = 0; d < doublesArray.Length; d += 2)
    {
        Console.WriteLine(doublesArray[d]);
    }
}
```
```elixir
# elixir
test "linq54: ToArray" do
  doubles = [1.7, 2.3, 1.9, 4.1, 2.9];

  sorted_doubles = doubles |> Enum.sort(& &1 > &2)

  IO.puts "Every other double from highest to lowest:"
  for d <- (sorted_doubles |> Enum.take_every(2)), do: IO.puts d

  assert [4.1, 2.3, 1.7] == (sorted_doubles |> Enum.take_every(2))
end
```
#### Output

    Every other double from highest to lowest:
    4.1
    2.3
    1.7

### linq55: ToList
```csharp
//c#
public void Linq55()
{
    string[] words = { "cherry", "apple", "blueberry" };

    var sortedWords =
        from w in words
        orderby w
        select w;
    var wordList = sortedWords.ToList();

    Console.WriteLine("The sorted word list:");
    foreach (var w in wordList)
    {
        Console.WriteLine(w);
    }
}
```
```elixir
# elixir
test "linq55: ToList" do
  # LINQ uses lazy evaluation.
  # The best comparison here would be using a Stream.
  # But Stream doesn't have a sort method,
  # and it makes sense, since sorting traverses the whole list anyway.
  # For reference see: http://elixir-lang.org/getting-started/enumerables-and-streams.html

  words = ["cherry", "apple", "blueberry"]

  sorted_words = Enum.sort(words)

  word_list = sorted_words

  IO.puts "The sorted word list:"
  for w <- word_list, do: IO.puts w

  assert ["apple", "blueberry", "cherry"] == word_list
end
```
#### Output

    The sorted word list:
    apple
    blueberry
    cherry

### linq56: ToDictionary
```csharp
//c#
public void Linq56()
{
    var scoreRecords = new[] { new {Name = "Alice", Score = 50},
                                new {Name = "Bob"  , Score = 40},
                                new {Name = "Cathy", Score = 45}
                            };

    var scoreRecordsDict = scoreRecords.ToDictionary(sr => sr.Name);

    Console.WriteLine("Bob's score: {0}", scoreRecordsDict["Bob"]);
}
```
```elixir
# elixir
test "linq56: ToDictionary" do
  score_records = [%{name: "Alice", score: 50},
                   %{name: "Bob", score: 40},
                   %{name: "Cathy", score: 45}]

  score_records_dict = score_records |> Enum.map(fn x -> {x.name, x.score} end) |> Enum.into(%{})

  # If using Erlang 17, use HashDicts because https://gist.github.com/BinaryMuse/bb9f2cbf692e6cfa4841
  # score_records_dict = score_records |> Enum.map(fn x -> {x.name, x} end) |> Enum.into(HashDict.new)

  IO.puts ~s(Bob's Score: #{score_records_dict["Bob"]})

  assert 40 == score_records_dict["Bob"]
end
```
#### Output

    Bob's score: 40

### linq57: OfType
```csharp
//c#
public void Linq57()
{
    object[] numbers = { null, 1.0, "two", 3, "four", 5, "six", 7.0 };

    var doubles = numbers.OfType<double>();

    Console.WriteLine("Numbers stored as doubles:");
    foreach (var d in doubles)
    {
        Console.WriteLine(d);
    }
}
```
```elixir
# elixir
test "linq57: OfType" do
  numbers = [nil, 1.0, "two", 3, "four", 5, "six", 7.0]

  doubles = numbers |> Enum.filter(&is_float/1)

  IO.puts "Numbers stored as doubles:"
  for d <- doubles, do: IO.puts d

  assert [1.0, 7.0] == doubles
end
```
#### Output

    Numbers stored as doubles:
    1.0
    7.0

LINQ - Element Operators
------------------------

### linq58: First - Simple
```csharp
//c#
public void Linq58()
{
    List<Product> products = GetProductList();

    Product product12 = (
        from p in products
        where p.ProductID == 12
        select p)
        .First();

    ObjectDumper.Write(product12);
}
```
```elixir
# elixir
test "linq58: First - Simple" do
  products = get_product_list()

  product12 = products |> Enum.filter(fn x -> x.product_id == 12 end) |> Enum.at(0)

  IO.inspect product12

  assert "Queso Manchego La Pastora" == product12.product_name
end
```
#### Output

    #clj_linq.data.Product{:product-id 12, :product-name Queso Manchego La Pastora, :category Dairy Products, :unit-price 38.0, :units-in-stock 86}

### linq59: First - Condition
```csharp
//c#
public void Linq59()
{
    string[] strings = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };

    string startsWithO = strings.First(s => s[0] == 'o');

    Console.WriteLine("A string starting with 'o': {0}", startsWithO);
}
```
```elixir
# elixir
test "linq59: First - Condition" do
  strings = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

  starts_with_o = strings |> Enum.find(fn x -> String.at(x, 0) == "o" end)

  IO.puts "A string starting with 'o': #{starts_with_o}"

  assert "one" == starts_with_o
end
```
#### Output

    A string starting with 'o': one

### linq61: FirstOrDefault - Simple
```csharp
//c#
public void Linq61()
{
    int[] numbers = { };

    int firstNumOrDefault = numbers.FirstOrDefault();

    Console.WriteLine(firstNumOrDefault);
}
```
```elixir
# elixir
test "linq61: FirstOrDefault - Simple" do
  numbers = []

  first_num_or_default = numbers |> Enum.at(0, 0)

  IO.puts first_num_or_default

  assert 0 == first_num_or_default
end
```
#### Output

    0

### linq62: FirstOrDefault - Condition
```csharp
//c#
public void Linq62()
{
    List<Product> products = GetProductList();

    Product product789 = products.FirstOrDefault(p => p.ProductID == 789);

    Console.WriteLine("Product 789 exists: {0}", product789 != null);
}
```
```elixir
# elixir
test "linq62: FirstOrDefault - Condition" do
  products = get_product_list()

  product789 = products |> Enum.find(fn x -> x.product_id == 789 end)

  IO.puts "Product 789 exists: #{product789 != nil}"

  assert product789 == nil
end
```
#### Output

    Product 789 exists: false

### linq64: ElementAt
```csharp
//c#
public void Linq64()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    int fourthLowNum = (
        from n in numbers
        where n > 5
        select n)
        .ElementAt(1);  // second number is index 1 because sequences use 0-based indexing

    Console.WriteLine("Second number > 5: {0}", fourthLowNum);
}
```
```elixir
# elixir
test "linq64: ElementAt" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  fourth_low_num = numbers
  |> Enum.filter(fn x -> x > 5 end)
  |> Enum.at(1)

  IO.puts "Second number > 5: #{fourth_low_num}"

  assert 8 == fourth_low_num
end
```
#### Output

    Second number > 5: 8


LINQ - Generation Operators
---------------------------

### linq65: Range
```csharp
//c#
public void Linq65()
{
    var numbers =
        from n in Enumerable.Range(100, 50)

        select new { Number = n, OddEven = n % 2 == 1 ? "odd" : "even" };

    foreach (var n in numbers)
    {
        Console.WriteLine("The number {0} is {1}.", n.Number, n.OddEven);
    }
}
```
```elixir
# elixir
test "linq65: Range" do
  require Integer

  numbers = 100..151
  |> Enum.map(fn x -> %{number: x, odd_even: if(Integer.is_odd(x), do: "odd", else: "even")} end)

  for n <- numbers, do: IO.puts "The number #{n.number} is #{n.odd_even}"

  assert "even" == hd(numbers).odd_even && "odd" == Enum.at(numbers, 1).odd_even
end
```
#### Output

    The number 100 is even
    The number 101 is odd
    The number 102 is even
    The number 103 is odd
    The number 104 is even
    The number 105 is odd
    The number 106 is even
    The number 107 is odd
    The number 108 is even
    The number 109 is odd
    The number 110 is even
    ...

### linq66: Repeat
```csharp
//c#
public void Linq66()
{
    var numbers = Enumerable.Repeat(7, 10);

    foreach (var n in numbers)
    {
        Console.WriteLine(n);
    }
}
```
```elixir
# elixir
test "linq66: Repeat" do
  numbers = List.duplicate(7, 10)

  for n <- numbers, do: IO.puts n

  assert 10 == length(numbers)
end
```
#### Output

    7
    7
    7
    7
    7
    7
    7
    7
    7
    7


LINQ - Quantifiers
------------------

### linq67: Any - Simple
```csharp
//c#
public void Linq67()
{
    string[] words = { "believe", "relief", "receipt", "field" };

    bool iAfterE = words.Any(w => w.Contains("ei"));

    Console.WriteLine("There is a word that contains in the list that contains 'ei': {0}", iAfterE);
}
```
```elixir
# elixir
test "linq67: Any - Simple" do
  words = ["believe", "relief", "receipt", "field"]

  i_after_e = words |> Enum.any?(fn x -> String.contains?(x, "ei") end)

  IO.puts "There is a word that contains in the list that contains 'ei': #{i_after_e != nil}"

  assert nil != i_after_e
end
```
#### Output

    There is a word that contains in the list that contains 'ei': true

### linq69: Any - Grouped
```csharp
//c#
public void Linq69()
{
    List<Product> products = GetProductList();
    var productGroups =
        from p in products
        group p by p.Category into g
        where g.Any(p => p.UnitsInStock == 0)
        select new { Category = g.Key, Products = g };

    ObjectDumper.Write(productGroups, 1);
}
```
```elixir
# elixir
test "linq69: Any - Grouped" do
  products = get_product_list()

  product_groups = products
  |> Enum.group_by(fn x -> x.category end)
  |> Enum.filter(fn {_,prods} -> prods |> Enum.any?(fn p -> p.units_in_stock == 0 end) end)
  |> Enum.map(fn {cat, prods} -> %{category: cat, products: prods} end)

  IO.inspect product_groups

  assert 3 == length(product_groups)
  first_group = product_groups|> Enum.at(0)
  assert first_group.category == "Condiments"
  assert first_group.products |> Enum.count == 12
end
```
#### Output

    {:category Condiments, :products [#clj_linq.data.Product{:product-id 3, :product-name Aniseed Syrup, :category Condiments, :unit-price 10.0, :units-in-stock 13} #clj_linq.data.Product{:product-id 4, :product-name Chef Anton's Cajun Seasoning, :category Condiments, :unit-price 22.0, :units-in-stock 53} #clj_linq.data.Product{:product-id 5, :product-name Chef Anton's Gumbo Mix, :category Condiments, :unit-price 21.35, :units-in-stock 0} #clj_linq.data.Product{:product-id 6, :product-name Grandma's Boysenberry Spread, :category Condiments, :unit-price 25.0, :units-in-stock 120} #clj_linq.data.Product{:product-id 8, :product-name Northwoods Cranberry Sauce, :category Condiments, :unit-price 40.0, :units-in-stock 6} #clj_linq.data.Product{:product-id 15, :product-name Genen Shouyu, :category Condiments, :unit-price 15.5, :units-in-stock 39} #clj_linq.data.Product{:product-id 44, :product-name Gula Malacca, :category Condiments, :unit-price 19.45, :units-in-stock 27} #clj_linq.data.Product{:product-id 61, :product-name Sirop d'érable, :category Condiments, :unit-price 28.5, :units-in-stock 113} #clj_linq.data.Product{:product-id 63, :product-name Vegie-spread, :category Condiments, :unit-price 43.9, :units-in-stock 24} #clj_linq.data.Product{:product-id 65, :product-name Louisiana Fiery Hot Pepper Sauce, :category Condiments, :unit-price 21.05, :units-in-stock 76} #clj_linq.data.Product{:product-id 66, :product-name Louisiana Hot Spiced Okra, :category Condiments, :unit-price 17.0, :units-in-stock 4} #clj_linq.data.Product{:product-id 77, :product-name Original Frankfurter grüne Soße, :category Condiments, :unit-price 13.0, :units-in-stock 32}]}
    ...

### linq70: All - Simple
```csharp
//c#
public void Linq70()
{
    int[] numbers = { 1, 11, 3, 19, 41, 65, 19 };

    bool onlyOdd = numbers.All(n => n % 2 == 1);

    Console.WriteLine("The list contains only odd numbers: {0}", onlyOdd);
}
```
```elixir
# elixir
test "linq70: All - Simple" do
  require Integer
  numbers = [1, 11, 3, 19, 41, 65, 19]
  only_odd = numbers |> Enum.all?(fn x -> Integer.is_odd(x) end)

  IO.puts "The list contains only odd numbers: #{only_odd}"

  assert only_odd == true
end
```
#### Output

    The list contains only odd numbers: true

### linq72: All - Grouped
```csharp
//c#
public void Linq72()
{
    List<Product> products = GetProductList();

    var productGroups =
        from p in products
        group p by p.Category into g
        where g.All(p => p.UnitsInStock > 0)
        select new { Category = g.Key, Products = g };

    ObjectDumper.Write(productGroups, 1);
}
```
```elixir
# elixir
test "linq72: All - Grouped" do
  products = get_product_list()

  product_groups = products
  |> Enum.group_by(fn x -> x.category end)
  |> Enum.filter(fn {_,prods} -> prods |> Enum.all?(fn p -> p.units_in_stock > 0 end) end)
  |> Enum.map(fn {cat, prods} -> %{category: cat, products: prods} end)

  IO.inspect product_groups

  first_group = product_groups |> Enum.at(0)
  assert first_group.category == "Beverages"
  assert 12 == length(first_group.products)
  assert 5 == length(product_groups)
end
```
#### Output

    {:category Beverages, :products [#clj_linq.data.Product{:product-id 1, :product-name Chai, :category Beverages, :unit-price 18.0, :units-in-stock 39} #clj_linq.data.Product{:product-id 2, :product-name Chang, :category Beverages, :unit-price 19.0, :units-in-stock 17} #clj_linq.data.Product{:product-id 24, :product-name Guaraná Fantástica, :category Beverages, :unit-price 4.5, :units-in-stock 20} #clj_linq.data.Product{:product-id 34, :product-name Sasquatch Ale, :category Beverages, :unit-price 14.0, :units-in-stock 111} #clj_linq.data.Product{:product-id 35, :product-name Steeleye Stout, :category Beverages, :unit-price 18.0, :units-in-stock 20} #clj_linq.data.Product{:product-id 38, :product-name Côte de Blaye, :category Beverages, :unit-price 263.5, :units-in-stock 17} #clj_linq.data.Product{:product-id 39, :product-name Chartreuse verte, :category Beverages, :unit-price 18.0, :units-in-stock 69} #clj_linq.data.Product{:product-id 43, :product-name Ipoh Coffee, :category Beverages, :unit-price 46.0, :units-in-stock 17} #clj_linq.data.Product{:product-id 67, :product-name Laughing Lumberjack Lager, :category Beverages, :unit-price 14.0, :units-in-stock 52} #clj_linq.data.Product{:product-id 70, :product-name Outback Lager, :category Beverages, :unit-price 15.0, :units-in-stock 15} #clj_linq.data.Product{:product-id 75, :product-name Rhönbräu Klosterbier, :category Beverages, :unit-price 7.75, :units-in-stock 125} #clj_linq.data.Product{:product-id 76, :product-name Lakkalikööri, :category Beverages, :unit-price 18.0, :units-in-stock 57}]}
    ...


LINQ - Aggregate Operators
--------------------------

### Elixir utils added
```elixir
def average(list) do
  sum_and_count = list
    |> Enum.reduce({0,0}, fn x, {acc, count} -> {acc + x, count + 1} end)
  elem(sum_and_count, 0) / elem(sum_and_count, 1)
end
```

### linq73: Count - Simple
```csharp
//c#
public void Linq73()
{
    int[] factorsOf300 = { 2, 2, 3, 5, 5 };

    int uniqueFactors = factorsOf300.Distinct().Count();

    Console.WriteLine("There are {0} unique factors of 300.", uniqueFactors);
}
```
```elixir
# elixir
test "linq73: Count - Simple" do
  factors_of_300 = [2, 2, 3, 5, 5]

  unique_factors = factors_of_300
  |> Enum.uniq
  |> Enum.count

  IO.puts "There are #{unique_factors} unique factors of 300."

  assert 3 == unique_factors
end
```
#### Output

    There are 3 unique factors of 300.

### linq74: Count - Conditional
```csharp
//c#
public void Linq74()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    int oddNumbers = numbers.Count(n => n % 2 == 1);

    Console.WriteLine("There are {0} odd numbers in the list.", oddNumbers);
}
```
```elixir
# elixir
test "linq74: Count - Conditional" do
  require Integer
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  odd_numbers = numbers |> Enum.count(fn x -> Integer.is_odd(x) end)

  IO.puts "There are #{odd_numbers} odd numbers in the list."

  assert 5 == odd_numbers
end
```
#### Output

    There are 5 odd numbers in the list.

### linq76: Count - Nested
```csharp
//c#
public void Linq76()
{
    List<Customer> customers = GetCustomerList();

    var orderCounts =
        from c in customers
        select new { c.CustomerID, OrderCount = c.Orders.Count() };

    ObjectDumper.Write(orderCounts);
}
```
```elixir
# elixir
test "linq76: Count - Nested" do
  customers = get_customer_list()

  order_counts = customers |> Enum.map(fn x -> %{customer_id: x.id, order_count: x.orders |> Enum.count } end)

  IO.inspect order_counts

  assert 6 == hd(order_counts).order_count
end
```
#### Output

    {:customer-id ALFKI, :order-count 6}
    {:customer-id ANATR, :order-count 4}
    {:customer-id ANTON, :order-count 7}
    {:customer-id AROUT, :order-count 13}
    {:customer-id BERGS, :order-count 18}
    {:customer-id BLAUS, :order-count 7}
    {:customer-id BLONP, :order-count 11}
    ...

### linq77: Count - Grouped
```csharp
//c#
public void Linq77()
{
    List<Product> products = GetProductList();

    var categoryCounts =
        from p in products
        group p by p.Category into g
        select new { Category = g.Key, ProductCount = g.Count() };

    ObjectDumper.Write(categoryCounts
}
```
```elixir
# elixir
test "linq77: Count - Grouped" do
  products = get_product_list()

  category_counts = products
  |> Enum.group_by(fn x -> x.category end)
  |> Enum.map(fn {cat, prods} -> %{category: cat, product_count: prods |> Enum.count} end)

  IO.inspect category_counts

  assert 12 == hd(category_counts).product_count
end
```
#### Output

    {:category Beverages, :product-count 12}
    {:category Condiments, :product-count 12}
    {:category Produce, :product-count 5}
    {:category Meat/Poultry, :product-count 6}
    {:category Seafood, :product-count 12}
    {:category Dairy Products, :product-count 10}
    {:category Confections, :product-count 13}
    {:category Grains/Cereals, :product-count 7}

### linq78: Sum - Simple
```csharp
//c#
public void Linq78()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    double numSum = numbers.Sum();

    Console.WriteLine("The sum of the numbers is {0}.", numSum);
}
```
```elixir
# elixir
test "linq78: Sum - Simple" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  num_sum = Enum.sum(numbers)

  IO.puts "The sum of the numbers is #{num_sum}"

  assert 45 = num_sum
end
```
#### Output

    The sum of the numbers is  45

### linq79: Sum - Projection
```csharp
//c#
public void Linq79()
{
    string[] words = { "cherry", "apple", "blueberry" };

    double totalChars = words.Sum(w => w.Length);

    Console.WriteLine("There are a total of {0} characters in these words.", totalChars);
}
```
```elixir
# elixir
test "linq79: Sum - Projection" do
  words = ["cherry", "apple", "blueberry"]

  total_chars = words
  |> Enum.map(&String.length/1)
  |> Enum.sum

  IO.puts "There are a total of #{total_chars} characters in these words."

  assert 20 == total_chars
end
```
#### Output

    There are a total of 20 characters in these words.

### linq80: Sum - Grouped
```csharp
//c#
public void Linq80()
{
    List<Product> products = GetProductList();

    var categories =
        from p in products
        group p by p.Category into g
        select new { Category = g.Key, TotalUnitsInStock = g.Sum(p => p.UnitsInStock) };

    ObjectDumper.Write(categories);
}
```
```elixir
# elixir
test "linq80: Sum - Grouped" do
  products = get_product_list()

  categories = products
  |> Enum.group_by(fn x -> x.category end)
  |> Enum.map(fn {cat, prods} ->
    %{
      category: cat,
      total_units_in_stock: prods
      |> Enum.map(fn p -> p.units_in_stock end)
      |> Enum.sum
    }
  end)

  IO.inspect categories

  assert 559 == hd(categories).total_units_in_stock
end
```
#### Output

    {:category Beverages, :total-units-in-stock 559}
    {:category Condiments, :total-units-in-stock 507}
    {:category Produce, :total-units-in-stock 100}
    {:category Meat/Poultry, :total-units-in-stock 165}
    {:category Seafood, :total-units-in-stock 701}
    {:category Dairy Products, :total-units-in-stock 393}
    {:category Confections, :total-units-in-stock 386}
    {:category Grains/Cereals, :total-units-in-stock 308}

### linq81: Min - Simple
```csharp
//c#
public void Linq81()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    int minNum = numbers.Min();

    Console.WriteLine("The minimum number is {0}.", minNum);
}
```
```elixir
# elixir
test "linq81: Min - Simple" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  min_num = Enum.min(numbers)

  IO.puts "The minimum number is #{min_num}"

  assert 0 == min_num
end
```
#### Output

    The minimum number is 0

### linq82: Min - Projection
```csharp
//c#
public void Linq82()
{
    string[] words = { "cherry", "apple", "blueberry" };

    int shortestWord = words.Min(w => w.Length);

    Console.WriteLine("The shortest word is {0} characters long.", shortestWord);
}
```
```elixir
# elixir
test "linq82: Min - Projection" do
  words = ["cherry", "apple", "blueberry"]

  shortest_word = words |> Enum.map(&String.length/1) |> Enum.min

  IO.puts "The shortest word is #{shortest_word} characters long."

  assert 5 == shortest_word
end
```
#### Output

    The shortest word is 5 characters long.

### linq83: Min - Grouped
```csharp
//c#
public void Linq83()
{
    List<Product> products = GetProductList();

    var categories =
        from p in products
        group p by p.Category into g
        select new { Category = g.Key, CheapestPrice = g.Min(p => p.UnitPrice) };

    ObjectDumper.Write(categories);
}
```
```elixir
# elixir
test "linq83: Min - Grouped" do
  products = get_product_list()

  categories = products
  |> Enum.group_by(fn x -> x.category end)
  |> Enum.map(fn {cat, prods} ->
    %{
      category: cat,
      cheapest_price: prods
      |> Enum.map(fn p -> p.unit_price end)
      |> Enum.min
    }
  end)

  IO.inspect categories

  assert 4.5 == hd(categories).cheapest_price
end
```
#### Output

    {:category Beverages, :cheapest-price 4.5}
    {:category Condiments, :cheapest-price 10.0}
    {:category Produce, :cheapest-price 10.0}
    {:category Meat/Poultry, :cheapest-price 7.45}
    {:category Seafood, :cheapest-price 6.0}
    {:category Dairy Products, :cheapest-price 2.5}
    {:category Confections, :cheapest-price 9.2}
    {:category Grains/Cereals, :cheapest-price 7.0}

### linq84: Min - Elements
```csharp
//c#
public void Linq84()
{
    List<Product> products = GetProductList();

    var categories =
        from p in products
        group p by p.Category into g
        let minPrice = g.Min(p => p.UnitPrice)
        select new { Category = g.Key, CheapestProducts = g.Where(p => p.UnitPrice == minPrice) };

    ObjectDumper.Write(categories, 1);
}
```
```elixir
# elixir
test "linq84: Min - Elements" do
  products = get_product_list()

  categories = products
  |> Enum.group_by(fn x -> x.category end)
  |> Enum.map(fn {cat, prods} ->
    min_price = prods
    |> Enum.map(fn p -> p.unit_price end)
    |> Enum.min

    %{
      category: cat,
      cheapest_products: prods
      |> Enum.filter(fn p -> p.unit_price == min_price end)
    }
  end)

  IO.inspect categories

  assert 24 == categories |> hd |> Map.get(:cheapest_products) |> hd |> Map.get(:product_id)
end
```
#### Output

    {:category Beverages, :cheapest-products (#clj_linq.data.Product{:product-id 24, :product-name Guaraná Fantástica, :category Beverages, :unit-price 4.5, :units-in-stock 20})}
    {:category Condiments, :cheapest-products (#clj_linq.data.Product{:product-id 3, :product-name Aniseed Syrup, :category Condiments, :unit-price 10.0, :units-in-stock 13})}
    {:category Produce, :cheapest-products (#clj_linq.data.Product{:product-id 74, :product-name Longlife Tofu, :category Produce, :unit-price 10.0, :units-in-stock 4})}
    {:category Meat/Poultry, :cheapest-products (#clj_linq.data.Product{:product-id 54, :product-name Tourtière, :category Meat/Poultry, :unit-price 7.45, :units-in-stock 21})}
    {:category Seafood, :cheapest-products (#clj_linq.data.Product{:product-id 13, :product-name Konbu, :category Seafood, :unit-price 6.0, :units-in-stock 24})}
    {:category Dairy Products, :cheapest-products (#clj_linq.data.Product{:product-id 33, :product-name Geitost, :category Dairy Products, :unit-price 2.5, :units-in-stock 112})}
    {:category Confections, :cheapest-products (#clj_linq.data.Product{:product-id 19, :product-name Teatime Chocolate Biscuits, :category Confections, :unit-price 9.2, :units-in-stock 25})}
    {:category Grains/Cereals, :cheapest-products (#clj_linq.data.Product{:product-id 52, :product-name Filo Mix, :category Grains/Cereals, :unit-price 7.0, :units-in-stock 38})}

### linq85: Max - Simple
```csharp
//c#
public void Linq85()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    int maxNum = numbers.Max();

    Console.WriteLine("The maximum number is {0}.", maxNum);
}
```
```elixir
# elixir
test "linq85: Max - Simple" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  max_num = Enum.max(numbers)

  IO.puts "The maximum number is #{max_num}"

  assert 9 == max_num
end
```
#### Output

    The maximum number is 9

### linq86: Max - Projection
```csharp
//c#
public void Linq86()
{
    string[] words = { "cherry", "apple", "blueberry" };

    int longestLength = words.Max(w => w.Length);

    Console.WriteLine("The longest word is {0} characters long.", longestLength);
}
```
```elixir
# elixir
test "linq86: Max - Projection" do
  words = ["cherry", "apple", "blueberry"]

  longest_word = words |> Enum.map(&String.length/1) |> Enum.max

  IO.puts "The longest word is #{longest_word} characters long."

  assert 9 == longest_word
end
```
#### Output

    The longest word is 9 characters long.

### linq87: Max - Grouped
```csharp
//c#
public void Linq87()
{
    List<Product> products = GetProductList();

    var categories =
        from p in products
        group p by p.Category into g
        select new { Category = g.Key, MostExpensivePrice = g.Max(p => p.UnitPrice) };

    ObjectDumper.Write(categories);
}
```
```elixir
# elixir
test "linq87: Max - Grouped" do
  products = get_product_list()

  categories = products
  |> Enum.group_by(fn x -> x.category end)
  |> Enum.map(fn {cat, prods} ->
    %{
      category: cat,
      most_expensive_price: prods
      |> Enum.map(fn p -> p.unit_price end)
      |> Enum.max
    }
  end)

  IO.inspect categories

  assert 263.5 == hd(categories).most_expensive_price
end
```
#### Output

    {:category Beverages, :most-expensive-price 263.5}
    {:category Condiments, :most-expensive-price 43.9}
    {:category Produce, :most-expensive-price 53.0}
    {:category Meat/Poultry, :most-expensive-price 123.79}
    {:category Seafood, :most-expensive-price 62.5}
    {:category Dairy Products, :most-expensive-price 55.0}
    {:category Confections, :most-expensive-price 81.0}
    {:category Grains/Cereals, :most-expensive-price 38.0}

### linq88: Max - Elements
```csharp
//c#
public void Linq88()
{
    List<Product> products = GetProductList();

    var categories =
        from p in products
        group p by p.Category into g
        let maxPrice = g.Max(p => p.UnitPrice)
        select new { Category = g.Key, MostExpensiveProducts = g.Where(p => p.UnitPrice == maxPrice) };

    ObjectDumper.Write(categories, 1);
}
```
```elixir
# elixir
test "linq88: Max - Elements" do
  products = get_product_list()

  categories = products
  |> Enum.group_by(fn x -> x.category end)
  |> Enum.map(fn {cat, prods} ->
    max_price = prods
    |> Enum.map(fn p -> p.unit_price end)
    |> Enum.max

    %{
      category: cat,
      most_expensive_products: prods
      |> Enum.filter(fn p -> p.unit_price == max_price end)
    }
  end)

  IO.inspect categories

  assert 38 == categories |> hd |> Map.get(:most_expensive_products) |> hd |> Map.get(:product_id)
end
```
#### Output

    {:category Beverages, :most-expensive-products (#clj_linq.data.Product{:product-id 38, :product-name Côte de Blaye, :category Beverages, :unit-price 263.5, :units-in-stock 17})}
    {:category Condiments, :most-expensive-products (#clj_linq.data.Product{:product-id 63, :product-name Vegie-spread, :category Condiments, :unit-price 43.9, :units-in-stock 24})}
    {:category Produce, :most-expensive-products (#clj_linq.data.Product{:product-id 51, :product-name Manjimup Dried Apples, :category Produce, :unit-price 53.0, :units-in-stock 20})}
    {:category Meat/Poultry, :most-expensive-products (#clj_linq.data.Product{:product-id 29, :product-name Thüringer Rostbratwurst, :category Meat/Poultry, :unit-price 123.79, :units-in-stock 0})}
    {:category Seafood, :most-expensive-products (#clj_linq.data.Product{:product-id 18, :product-name Carnarvon Tigers, :category Seafood, :unit-price 62.5, :units-in-stock 42})}
    {:category Dairy Products, :most-expensive-products (#clj_linq.data.Product{:product-id 59, :product-name Raclette Courdavault, :category Dairy Products, :unit-price 55.0, :units-in-stock 79})}
    {:category Confections, :most-expensive-products (#clj_linq.data.Product{:product-id 20, :product-name Sir Rodney's Marmalade, :category Confections, :unit-price 81.0, :units-in-stock 40})}
    {:category Grains/Cereals, :most-expensive-products (#clj_linq.data.Product{:product-id 56, :product-name Gnocchi di nonna Alice, :category Grains/Cereals, :unit-price 38.0, :units-in-stock 21})}

### linq89: Average - Simple
```csharp
//c#
public void Linq89()
{
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    double averageNum = numbers.Average();

    Console.WriteLine("The average number is {0}.", averageNum);
}
```
```elixir
# elixir
test "linq89: Average - Simple" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  average_num = numbers |> average()

  IO.puts "The average number is #{average_num}"

  assert 4.5 == average_num
end
```
#### Output

    The average number is 9/2

### linq90: Average - Projection
```csharp
//c#
public void Linq90()
{
    string[] words = { "cherry", "apple", "blueberry" };

    double averageLength = words.Average(w => w.Length);

    Console.WriteLine("The average word length is {0} characters.", averageLength);
}
```
```elixir
# elixir
test "linq90: Average - Projection" do
  words = ["cherry", "apple", "blueberry"]

  average_length = words
  |> Enum.map(&String.length/1)
  |> average()

  IO.puts "Average word length is #{average_length} characters."

  assert 20/3 == average_length
end
```
#### Output

    The average word length is 20/3 characters.

### linq91: Average - Grouped
```csharp
//c#
public void Linq91()
{
    List<Product> products = GetProductList();

    var categories =
        from p in products
        group p by p.Category into g
        select new { Category = g.Key, AveragePrice = g.Average(p => p.UnitPrice) };

    ObjectDumper.Write(categories);
}
```
```elixir
# elixir
test "linq91: Average - Grouped" do
  products = get_product_list()

  categories = products
  |> Enum.group_by(fn x -> x.category end)
  |> Enum.map(fn {cat, prods} ->
    %{
      category: cat,
      average_price: prods
      |> Enum.map(fn p -> p.unit_price end)
      |> average
    }
  end)

  IO.inspect categories

  assert 37.979166666666664 == hd(categories).average_price
end
```
#### Output

    {:category Beverages, :average-price 37.979166666666664}
    {:category Condiments, :average-price 23.0625}
    {:category Produce, :average-price 32.37}
    {:category Meat/Poultry, :average-price 54.00666666666667}
    {:category Seafood, :average-price 20.6825}
    {:category Dairy Products, :average-price 28.73}
    {:category Confections, :average-price 25.16}
    {:category Grains/Cereals, :average-price 20.25}

### linq92: Aggregate - Simple
```csharp
//c#
public void Linq92()
{
    double[] doubles = { 1.7, 2.3, 1.9, 4.1, 2.9 };

    double product = doubles.Aggregate((runningProduct, nextFactor) => runningProduct * nextFactor);

    Console.WriteLine("Total product of all numbers: {0}", product);
}
```
```elixir
# elixir
test "linq92: Aggregate - Simple" do
  doubles = [1.7, 2.3, 1.9, 4.1, 2.9]

  product = doubles |> Enum.reduce(fn x, acc -> x * acc end)

  IO.puts "Total product of all numbers: #{product}"

  assert 88.33080999999999 == product
end
```
#### Output

    Total product of all numbers: 88.33080999999999

### linq93: Aggregate - Seed
```csharp
//c#
public void Linq93()
{
    double startBalance = 100.0;

    int[] attemptedWithdrawals = { 20, 10, 40, 50, 10, 70, 30 };

    double endBalance =
        attemptedWithdrawals.Aggregate(startBalance,
            (balance, nextWithdrawal) =>
                ((nextWithdrawal <= balance) ? (balance - nextWithdrawal) : balance));

    Console.WriteLine("Ending balance: {0}", endBalance);
}
```
```elixir
# elixir
test "linq93: Aggregate - Seed" do
  startBalance = 100.0

  attempted_withdrawals = [20, 10, 40, 50, 10, 70, 30]

  end_balance = attempted_withdrawals
  |> Enum.reduce(startBalance, fn next_withdrawal, balance ->
    if next_withdrawal <= balance, do: balance - next_withdrawal, else: balance
  end)

  IO.puts "Ending balance: #{end_balance}"

  assert 20 == end_balance
end
```
#### Output

    Ending balance: 20


LINQ - Miscellaneous Operators
------------------------------

### linq94: Concat - 1
```csharp
//c#
public void Linq94()
{
    int[] numbersA = { 0, 2, 4, 5, 6, 8, 9 };
    int[] numbersB = { 1, 3, 5, 7, 8 };

    var allNumbers = numbersA.Concat(numbersB);

    Console.WriteLine("All numbers from both arrays:");
    foreach (var n in allNumbers)
    {
        Console.WriteLine(n);
    }
}
```
```elixir
# elixir
test "linq94: Concat - 1" do
  numbers_a = [0, 2, 4, 5, 6, 8, 9]
  numbers_b = [1, 3, 5, 7, 8]

  all_numbers = numbers_a ++ numbers_b

  IO.puts "All numbers from both arrays:"
  for n <- all_numbers, do: IO.puts n

  assert 12 == length(all_numbers)
end
```
#### Output

    All numbers from both arrays:
    0
    2
    4
    5
    6
    8
    9
    1
    3
    5
    7
    8

### linq95: Concat - 2
```csharp
//c#
public void Linq95()
{
    List<Customer> customers = GetCustomerList();
    List<Product> products = GetProductList();

    var customerNames =
        from c in customers
        select c.CompanyName;
    var productNames =
        from p in products
        select p.ProductName;

    var allNames = customerNames.Concat(productNames);

    Console.WriteLine("Customer and product names:");
    foreach (var n in allNames)
    {
        Console.WriteLine(n);
    }
}
```
```elixir
# elixir
test "linq95: Concat - 2" do
  customers = get_customer_list()
  products = get_product_list()

  customer_names = customers |> Enum.map(fn x -> x.name end)
  product_names = products |> Enum.map(fn x -> x.product_name end)

  all_names = customer_names ++ product_names

  IO.puts "Customer and product names:"
  for n <- all_names, do: IO.puts n

  assert 168 == length(all_names)
end
```
#### Output

    Customer and product names:
    Alfreds Futterkiste
    Ana Trujillo Emparedados y helados
    Antonio Moreno Taquería
    Around the Horn
    Berglunds snabbköp
    Blauer See Delikatessen
    ...

### linq96: EqualAll - 1
```csharp
//c#
public void Linq96()
{
    var wordsA = new string[] { "cherry", "apple", "blueberry" };
    var wordsB = new string[] { "cherry", "apple", "blueberry" };

    bool match = wordsA.SequenceEqual(wordsB);

    Console.WriteLine("The sequences match: {0}", match);
}
```
```elixir
# elixir
test "linq96: EqualAll - 1" do
  words_a = ["cherry", "apple", "blueberry"]
  words_b = ["cherry", "apple", "blueberry"]

  IO.puts "The sequences match: #{words_a == words_b}"

  assert words_a == words_b
end
```
#### Output

    The sequences match: true

### linq97: EqualAll - 2
```csharp
//c#
public void Linq97()
{
    var wordsA = new string[] { "cherry", "apple", "blueberry" };
    var wordsB = new string[] { "apple", "blueberry", "cherry" };

    bool match = wordsA.SequenceEqual(wordsB);

    Console.WriteLine("The sequences match: {0}", match);
}
```
```elixir
# elixir
test "linq97: EqualAll - 2" do
  words_a = ["cherry", "apple", "blueberry"]
  words_b = ["apple", "blueberry", "cherry"]

  match = words_a == words_b

  IO.puts "The sequences match: #{match}"

  refute match
end
```
#### Output

    The sequences match: false


LINQ - Query Operators
----------------------

### Elixir utils added
```elixir
defmodule Counter do
  def start_link(n) do
    Agent.start_link(fn -> n end)
  end

  def get(pid) do
    Agent.get(pid, fn x -> x end)
  end

  def inc(pid) do
    Agent.get_and_update(pid, fn x -> {x + 1, x + 1} end)
  end
end
```

### linq99: Deferred Execution
```csharp
//c#
public void Linq99()
{
    // Sequence operators form first-class queries that
    // are not executed until you enumerate over them.

    int[] numbers = new int[] { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    int i = 0;
    var q =
        from n in numbers
        select ++i;

    // Note, the local variable 'i' is not incremented
    // until each element is evaluated (as a side-effect):
    foreach (var v in q)
    {
        Console.WriteLine("v = {0}, i = {1}", v, i);
    }
}
```
```elixir
# elixir
test "linq99: Deferred Execution", %{counter_agent: pid} do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  # Since Elixir's variables are immutable
  # I'm using an Agent to hold state
  # and mimic the behavior seen in LINQ
  q = numbers |> Stream.map(fn _ -> Counter.inc(pid) end)

  values = "#{Counter.get(pid)} #{Enum.count(q)} #{Counter.get(pid)}" 
  |> IO.puts

  assert "0 10 10" == values
end
```
#### Output

    0 10 10

### linq100: Immediate Execution
```csharp
//c#
public void Linq100()
{
    // Methods like ToList() cause the query to be
    // executed immediately, caching the results.

    int[] numbers = new int[] { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

    int i = 0;
    var q = (
        from n in numbers
        select ++i)
        .ToList();

    // The local variable i has already been fully
    // incremented before we iterate the results:
    foreach (var v in q)
    {
        Console.WriteLine("v = {0}, i = {1}", v, i);
    }
}
```
```elixir
# elixir
test "linq100: Immediate Execution", %{counter_agent: pid} do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  # Since Elixir's variables are immutable
  # I'm using an Agent to hold state
  # and mimic the behavior seen in LINQ
  q = numbers |> Enum.map(fn _ -> Counter.inc(pid) end)

  values = "#{Counter.get(pid)} #{Enum.count(q)} #{Counter.get(pid)}" 
  |> IO.puts

  assert "10 10 10" == values
end
```
#### Output

    10 10 10

### linq101: Query Reuse
```csharp
//c#
public void Linq101()
{
    // Deferred execution lets us define a query once
    // and then reuse it later after data changes.

    int[] numbers = new int[] { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };
    var lowNumbers =
        from n in numbers
        where n <= 3
        select n;

    Console.WriteLine("First run numbers <= 3:");
    foreach (int n in lowNumbers)
    {
        Console.WriteLine(n);
    }

    for (int i = 0; i < 10; i++)
    {
        numbers[i] = -numbers[i];
    }

    // During this second run, the same query object,
    // lowNumbers, will be iterating over the new state
    // of numbers[], producing different results:
    Console.WriteLine("Second run numbers <= 3:");
    foreach (int n in lowNumbers)
    {
        Console.WriteLine(n);
    }
}
```
```elixir
# elixir
test "linq101: Query Reuse" do
  numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]

  # We use agents to hold mutable state
  {:ok, pid} = Agent.start_link(fn -> numbers end)

  # And use functions for query reuse
  low_numbers = fn -> Agent.get(pid, & &1) |> Enum.filter(& &1 <= 3) end

  IO.puts "First run numbers <= 3:"
  for n <- low_numbers.(), do: IO.puts n

  Agent.update(pid, fn x -> x |> Enum.map(& -&1) end)

  IO.puts "Second run numbers <= 3:"
  for n <- low_numbers.(), do: IO.puts n

  assert [-5, -4, -1, -3, -9, -8, -6, -7, -2, 0] == low_numbers.()
end
```
#### Output

    First run numbers <= 3:
    1
    3
    2
    0
    Second run numbers <= 3
    -5
    -4
    -1
    -3
    -9
    -8
    -6
    -7
    -2
    0

It's possible to showcase Query Reuse without functions using Streams, but it's uglier. An example can be found [here](https://gist.github.com/omnibs/c662c677517905f57424).

LINQ - Join Operators
---------------------

### Elixir utils added
```elixir
def left_outer_join(list1, list2, equality, mapper1 \\ & &1, mapper2 \\ & &1) do
  Enum.reduce(list1, [], fn a, acc -> 
    matches = list2 |> Enum.filter(fn b -> equality.(a,b) end)
    if Enum.empty?(matches) do
      [{mapper1.(a), nil} | acc]
    else
      mapped_a = mapper1.(a);
      entries = matches |> Enum.map(& {mapped_a, mapper2.(&1)})
      entries ++ acc
    end
  end) 
    |> Enum.reverse
end
```

### linq102: Cross Join
```csharp
//c#
public void Linq102()
{
    string[] categories = new string[]{
        "Beverages",
        "Condiments",
        "Vegetables",
        "Dairy Products",
        "Seafood" };

    List<Product> products = GetProductList();

    var q =
        from c in categories
        join p in products on c equals p.Category
        select new { Category = c, p.ProductName };

    foreach (var v in q)
    {
        Console.WriteLine(v.ProductName + ": " + v.Category);
    }
}
```
```elixir
# elixir
test "linq102: Cross Join" do
  categories = ["Beverages",
    "Condiments",
    "Vegetables",
    "Dairy Products",
    "Seafood"]

  products = get_product_list()

  q =
    for c <- categories,
        p <- products,
        p.category == c,
        do: %{category: c, product_name: p.product_name}

  for v <- q, do: IO.puts "#{v.product_name}: #{v.category}"

  assert length(q) < length(products)
end
```
#### Output

    Chai : Beverages
    Chang : Beverages
    Guaraná Fantástica : Beverages
    Sasquatch Ale : Beverages
    Steeleye Stout : Beverages
    Côte de Blaye : Beverages
    Chartreuse verte : Beverages
    Ipoh Coffee : Beverages
    ...

### linq103: Group Join
```csharp
//c#
public void Linq103()
{
    string[] categories = new string[]{
        "Beverages",
        "Condiments",
        "Vegetables",
        "Dairy Products",
        "Seafood" };

    List<Product> products = GetProductList();

    var q =
        from c in categories
        join p in products on c equals p.Category into ps
        select new { Category = c, Products = ps };

    foreach (var v in q)
    {
        Console.WriteLine(v.Category + ":");
        foreach (var p in v.Products)
        {
            Console.WriteLine("   " + p.ProductName);
        }
    }
}
```
```elixir
# elixir
test "linq103: Group Join" do
  categories = ["Beverages",
    "Condiments",
    "Vegetables",
    "Dairy Products",
    "Seafood"]

  products = get_product_list()

  q = for c <- categories,
          {cat, prod} <- Enum.group_by(products, fn x -> x.category end),
          c == cat,
          do: %{category: c, products: prod}

  for v <- q do
    IO.puts v.category <> ":"
    for p <- v.products, do: IO.puts "   #{p.product_name}"
  end

  assert 4 == length(q)
end
```
#### Output

    Beverages
      Chai
      Chang
      Guaraná Fantástica
      Sasquatch Ale
      Steeleye Stout
      Côte de Blaye
      Chartreuse verte
      Ipoh Coffee
      Laughing Lumberjack Lager
      Outback Lager
      Rhönbräu Klosterbier
      Lakkalikööri
    Condiments
      Aniseed Syrup
      Chef Anton's Cajun Seasoning
      Chef Anton's Gumbo Mix
      Grandma's Boysenberry Spread
      Northwoods Cranberry Sauce
      Genen Shouyu
      Gula Malacca
      Sirop d'érable
      Vegie-spread
      Louisiana Fiery Hot Pepper Sauce
      Louisiana Hot Spiced Okra
      Original Frankfurter grüne Soße
    ...

### linq104: Cross Join with Group Join
```csharp
//c#
public void Linq104()
{
    string[] categories = new string[]{
        "Beverages",
        "Condiments",
        "Vegetables",
        "Dairy Products",
        "Seafood" };

    List<Product> products = GetProductList();

    var q =
        from c in categories
        join p in products on c equals p.Category into ps
        from p in ps
        select new { Category = c, p.ProductName };

    foreach (var v in q)
    {
        Console.WriteLine(v.ProductName + ": " + v.Category);
    }
}
```
```elixir
# elixir
test "linq104: Cross Join with Group Join" do
  categories = ["Beverages",
    "Condiments",
    "Vegetables",
    "Dairy Products",
    "Seafood"]

  products = get_product_list()

  q = for c <- categories,
          {cat, prods} <- Enum.group_by(products, fn x -> x.category end),
          p <- prods,
          c == cat,
          do: %{category: c, product_name: p.product_name}

  for v <- q, do: IO.puts "#{v.product_name}: #{v.category}"

  assert length(q) < length(products)
end
```
#### Output

    Chai : Beverages
    Chang : Beverages
    Guaraná Fantástica : Beverages
    Sasquatch Ale : Beverages
    Steeleye Stout : Beverages
    Côte de Blaye : Beverages
    Chartreuse verte : Beverages
    Ipoh Coffee : Beverages
    Laughing Lumberjack Lager : Beverages
    Outback Lager : Beverages
    Rhönbräu Klosterbier : Beverages
    Lakkalikööri : Beverages
    Aniseed Syrup : Condiments
    Chef Anton's Cajun Seasoning : Condiments
    Chef Anton's Gumbo Mix : Condiments
    ...

### linq105: Left Outer Join
```csharp
//c#
public void Linq105()
{
    string[] categories = new string[]{
        "Beverages",
        "Condiments",
        "Vegetables",
        "Dairy Products",
        "Seafood" };

    List<Product> products = GetProductList();

    var q =
        from c in categories
        join p in products on c equals p.Category into ps
        from p in ps.DefaultIfEmpty()
        select new { Category = c, ProductName = p == null ? "(No products)" : p.ProductName };

    foreach (var v in q)
    {
        Console.WriteLine(v.ProductName + ": " + v.Category);
    }
}
```
```elixir
# elixir
test "linq105: Left Outer Join" do
  categories = ["Beverages",
    "Condiments",
    "Vegetables",
    "Dairy Products",
    "Seafood"]

  products = get_product_list()

  q = left_outer_join(categories, products, & &1 == &2.category, & &1, & &1.product_name)
  |> Enum.map(fn {cat, prod} -> %{category: cat, product_name: prod || "(No products)"} end)

  for v <- q, do: IO.puts "#{v.product_name}: #{v.category}"

  assert length(q) < length(products)
end
```
#### Output

    Chai: Beverages
    Chang: Beverages
    Guaraná Fantástica: Beverages
    Sasquatch Ale: Beverages
    Steeleye Stout: Beverages
    Côte de Blaye: Beverages
    Chartreuse verte: Beverages
    Ipoh Coffee: Beverages
    Laughing Lumberjack Lager: Beverages
    Outback Lager: Beverages
    Rhönbräu Klosterbier: Beverages
    Lakkalikööri: Beverages
    Aniseed Syrup: Condiments
    Chef Anton's Cajun Seasoning: Condiments
    Chef Anton's Gumbo Mix: Condiments
    Grandma's Boysenberry Spread: Condiments
    Northwoods Cranberry Sauce: Condiments
    Genen Shouyu: Condiments
    Gula Malacca: Condiments
    Sirop d'érable: Condiments
    Vegie-spread: Condiments
    Louisiana Fiery Hot Pepper Sauce: Condiments
    Louisiana Hot Spiced Okra: Condiments
    Original Frankfurter grüne Soße: Condiments
    (No products): Vegetables
    ...


### Contributors

  - [omnibs](https://github.com/omnibs) (Juliano Bortolozzo Solanho)
defmodule Mix.Tasks.Readme do
  use Mix.Task

  @shortdoc "Populates examples in the Readme.MD with current code"
  def run(_) do
    IO.puts("Generating readme.md...")
    t = File.read!("README.template.md")

    files =
      Regex.scan(~r/LINQ - (?<name>[a-zA-Z]+)( Operators|.*$)/m, t, capture: :all_names)
      |> List.flatten()
      |> Enum.map(&String.downcase/1)

    segments = String.split(t, ~r/^LINQ - ([a-zA-Z]+)( Operators|.*$)/m)

    readme =
      Enum.zip(["none"] ++ files, segments)
      |> Enum.map(&process_file/1)
      |> Enum.join()

    File.write!(
      "README.md",
      Regex.replace(~r/(Quantifiers|Query Execution) Operators/, readme, "\\1")
    )
  end

  defp process_file({"none", text}) do
    text
  end

  defp process_file({fname, text}) do
    case File.read("test/#{fname}_test.exs") do
      {:ok, test_file} ->
        # get tests in file using regex
        # format [[test, name], ...]
        # then we map it to { "name" => "test", ... }
        tests_and_names =
          Regex.scan(~r/  test "([^"]+)".+\n  end/Us, test_file)
          |> Enum.reduce(%{}, fn [test, name], acc -> Map.put(acc, name, test) end)

        # get examples placeholders using regex
        # format [[whole_block, csharp_block, test_name, clojure_block, output_block]]
        # match them up in the dict we created above
        examples =
          Regex.replace(
            ~r/(### (linq\d+[^\r\n]+)\r?\n.+)(```clojure.+```.+)(#### Output.+)(?=###|$)/Us,
            text,
            fn whole_block, csharp_block, test_name, clojure_block, output_block ->
              elixir_example = "```elixir\r\n# elixir\r\n#{tests_and_names[test_name]}\r\n```\r\n"
              elixir_example = Regex.replace(~r/^  /m, elixir_example, "")
              elixir_example = Regex.replace(~r/^( +)# ?/m, elixir_example, "\\g{1}")

              Enum.join([csharp_block, elixir_example, output_block])
            end
          )

        # remember to add "LINQ - whatever Operators" to the beginning of the segment
        "LINQ - #{String.capitalize(fname)} Operators" <> examples

      _ ->
        ""
    end
  end
end

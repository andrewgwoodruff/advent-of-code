defmodule Day1 do
  def result(data) do
    result = Enum.reduce(data, { :whatever, 0 }, fn num, { prev, acc } ->
      if num > prev do
        { num, acc + 1 }
      else
        { num, acc }
      end
    end)

    Integer.to_string(elem(result, 1))
  end
end

formatted_data = File.read!("input.txt")
                 |> String.split("\n", trim: true)
                 |> Enum.map(fn string -> String.to_integer(string) end)

# PART 1
result_part_one = Day1.result(formatted_data)

# PART 2
rolling_data = Enum.chunk_every(formatted_data, 3, 1, :discard)
               |> Enum.map(fn [a, b, c] -> a + b + c end)

result_part_two = Day1.result(rolling_data)

IO.puts("PART 1 RESULT: " <> result_part_one)
IO.puts("PART 2 RESULT: " <> result_part_two)

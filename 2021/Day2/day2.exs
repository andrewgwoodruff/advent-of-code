formatted_data = File.read!("input.txt")
                 |> String.split("\n", trim: true)
                 |> Enum.map(fn x -> String.split(x, " ", trim: true) end)

# PART 1
final_destination = Enum.reduce(formatted_data, { 0, 0 }, fn [a, b], { horizontal_position, depth } ->
                      case a do
                        "forward" ->
                          { horizontal_position + String.to_integer(b), depth }
                        "up" ->
                          { horizontal_position, depth - String.to_integer(b) }
                        "down" ->
                          { horizontal_position, depth + String.to_integer(b) }
                      end
                    end)

result_part_one = elem(final_destination, 0) * elem(final_destination, 1)

# PART 2
final_destination = Enum.reduce(formatted_data, { 0, 0, 0 }, fn [a, b], { horizontal_position, depth, aim } ->
                      case a do
                        "forward" ->
                          amount = String.to_integer(b)
                          { horizontal_position + amount, depth + (aim * amount), aim }
                        "up" ->
                          { horizontal_position, depth, aim - String.to_integer(b) }
                        "down" ->
                          { horizontal_position, depth, aim + String.to_integer(b) }
                      end
                    end)

result_part_two = elem(final_destination, 0) * elem(final_destination, 1)

IO.puts("RESULT PART 1: " <> Integer.to_string(result_part_one))
IO.puts("RESULT PART 2: " <> Integer.to_string(result_part_two))

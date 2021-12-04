formatted_data = File.read!("input.txt")
                 |> String.split("\n", trim: true)
                 |> Enum.map(fn x -> String.split(x, "", trim: true) end)

gamma = Enum.zip_with(formatted_data, &Enum.frequencies/1)
        |> Enum.map(fn map ->
             zero_count = Map.get(map, "0")
             one_count = Map.get(map, "1")
             zero_count > one_count
           end)
        |> Enum.map(fn bool ->
             if bool do
               "0"
             else
               "1"
             end
           end)

epsilon = Enum.map(gamma, fn bit ->
            case bit do
              "0" ->
                "1"
              "1" ->
                "0"
            end
          end)

gamma_int = Enum.join(gamma)
            |> String.to_integer(2)

epsilon_int = Enum.join(epsilon)
              |> String.to_integer(2)

IO.puts(gamma_int * epsilon_int)

tuple = File.read!("input.txt")
        |> String.split("\n", trim: true)
        |> Enum.map(fn string -> String.to_integer(string) end)
        |> Enum.reduce({ :whatever, 0 }, fn num, { prev, acc } ->
             if num > prev do
               { num, acc + 1 }
             else
               { num, acc }
             end
           end)

IO.puts(elem(tuple, 1))
defmodule FizzBuzz do
  def run(n) do
    1..n |> Enum.map(&fizzbuzz/1) |> Enum.join(", ")
  end

  defp fizzbuzz(n) do
    case {rem(n, 3) == 0, rem(n, 5) == 0} do
      {true, true} -> "FizzBuzz"
      {true, false} -> "Fizz"
      {false, true} -> "Buzz"
      _ -> Integer.to_string(n)
    end
  end
end

100 |> FizzBuzz.run() |> IO.puts()

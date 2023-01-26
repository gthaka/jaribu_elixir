# Elixir used by
# Discord -> Masive Concurrency User
# Pinterest -> Notification System engine
# Motorolla -> fault tolerant calls
# Phoenix -- fullstack(websites)

# Variable declaration Note:parenthesis are optional
hello = "Hi 😉!"
IO.puts(hello)

# Atom - Value is its own name
IO.puts(:hi_mother)

# First class functions
add_five = fn n -> n + 5 end
# Shorthand
add_ten = &(&1 + 10)

# Nested function
IO.puts(add_ten.(add_five.(23)))
# Use pipe eg below.. alternative to nesting - pass the value of one expression to the next
23 |> add_five.() |> add_ten.() |> IO.puts()

# list
list = [1, 2, 3]
# map - represent key-value pairs
map = %{:a => 1, :b => 2, :c => 3}

# match operator (= sign) -- functional pattern matching -- it has to match the pattern, else error
[a, b, c] = [1, 2, 3]

# conditional logic
if true do
  IO.puts("do it 💯!")
end

unless false do
  IO.puts("do it 😐")
end

# case -- match value against multiple patterns - until we find a matching one
# if variable is not meant to be used prefix with _ e.g. _x
case {1, 2, 3} do
  {1, 2, 3} -> "No Match"
  {1, _x, 3} -> "Bind x to 2"
  _ -> "Match any value"
end

# application code can be shared within a module
# modules example
defmodule Human do
  def walk() do
    IO.puts("walking .... 🚶🏽")
  end

  # concurrency module example
  def listen do
    receive do
      {:yo} -> IO.puts("message received 💌")
    end

    listen()
  end
end

Human.walk()
# // Concurrency
pid = spawn(Human, :listen, [])
# can send multiple - concurrent isolated instances
# fault tolerant
send(pid, {:yo})
send(pid, {:yo})
send(pid, {:yo})
send(pid, {:yo})
send(pid, {:yo})

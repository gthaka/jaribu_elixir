defmodule Person do
  def name do
    name = IO.gets("What is your name?")
    IO.puts("Your name is #{name}")
  end

  def age do
    age = IO.gets("What is your age?")
    IO.puts("Your age is #{age}")
  end
end

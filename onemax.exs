require Elixireo
import Elixireo

defmodule Maxones do
  def time

  def f(iterations, length) when iterations == 0 do
    indi = random_chromosome(length)
    fitness = compute_fitness( indi )
  end

  def f(iterations, length) do
    indi = random_chromosome(length)
    fitness = compute_fitness( indi )
    f(iterations-1, length)
  end


  def call_f(iterations, length, top_length) when length == top_length do
      time = :timer.tc(Maxones,:f, [iterations,length])
      IO.puts("Elixir-List "<>to_string(length)<>" "<>to_string(elem(time,0)/1000000))
      length = length*2
  end


  def call_f(iterations, length, top_length) when length < top_length do
    time = :timer.tc(Maxones,:f, [iterations,length])
    IO.puts("Elixir-List "<>to_string(length)<>" "<>to_string(elem(time,0)/1000000))
    length = length*2
    call_f(iterations, length,top_length)
  end
end

length = 16
iterations = 100000
top_length = 32768
:random.seed(:erlang.now())
Maxones.call_f(iterations, length,top_length)

require Elixireo
import Elixireo


defmodule Maxones do
  def time

  def f(iterations, indi,indi2) when iterations == 0 do
    mutie = crossover( indi,indi2 )
  end

  def f(iterations, indi,indi2) do
    mutie = crossover( indi,indi2 )
    f(iterations-1, indi,indi2)
  end

def call_f(iterations, length, top_length) when length == top_length do
      indi = random_chromosome(length)
      indi2 = random_chromosome(length)
      time = :timer.tc(Maxones,:f, [iterations,indi,indi2])
      IO.puts("Elixir-List "<>to_string(length)<>" "<>to_string(elem(time,0)/1000000))
      length = length*2
    end



def call_f(iterations, length, top_length) when length < top_length do
    indi = random_chromosome(length)
    indi2 = random_chromosome(length)
    time = :timer.tc(Maxones,:f, [iterations,indi,indi2])
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

defmodule Elixireo do
  def random_chromosome(length) do
    Enum.map(List.duplicate(1, length),  fn(x) -> if :random.uniform<0.5 do 0 else 1 end end)
  end

  def compute_fitness(chromosome) do
    Enum.sum(chromosome)
  end

  def mutate1(chromosome) do
    mutation_point = round((Enum.count(chromosome)-1)*:random.uniform)
    if Enum.at(chromosome,mutation_point) == 0 do
      List.replace_at(chromosome,mutation_point,1)
    else
      List.replace_at(chromosome,mutation_point,0)
    end
  end

  def crossover(chrom1,chrom2) do
    length = Enum.count(chrom1)
    xover_point = round((length-1)*:random.uniform)
    scope = 1 + round(:random.uniform * (length - xover_point - 1))

    temp1 = Enum.split(chrom1,xover_point)
    temp2 = Enum.split(chrom2,xover_point)

    temp11 = Enum.split(elem(temp1,1),scope)
    temp12 = Enum.split(elem(temp2,1),scope)

    new_chrom1 = Enum.concat(Enum.concat(elem(temp1,0), elem(temp12,0)), elem(temp11,1))
    new_chrom2 = Enum.concat(Enum.concat(elem(temp2,0), elem(temp11,0)), elem(temp12,1))

  end

end

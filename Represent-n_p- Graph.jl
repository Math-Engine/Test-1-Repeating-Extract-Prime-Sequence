using Plots
using Base64

param_n = parse(Int, ARGS[1])

function is_prime(n::Int)
  if n <= 1
      return false
  elseif n <= 3
      return true
  end
  if n % 2 == 0 || n % 3 == 0
      return false
  end
  i = 5
  while i * i <= n
      if n % i == 0 || n % (i + 2) == 0
          return false
      end
      i = i + 6
  end
  return true
end

graph_x = []
graph_y = []

for loop_n in 2:param_n
  global graph_x
  global graph_y
  All_Prime_Sequence = []
  Prime_Sequence = []
  
  for i in 1:loop_n
    # global Prime_Sequence
    if is_prime(i) == true
      push!(Prime_Sequence, i)
    end
  end
  
  push!(All_Prime_Sequence, Prime_Sequence)
  # println(string(Prime_Sequence) * "\n")
  
  while true
    # global Prime_Sequence
    # global All_Prime_Sequence
    if length(Prime_Sequence) == 1
      push!(graph_x, loop_n)
      push!(graph_y, Prime_Sequence[1])
      break
    end
    new_prime_sequence = []
    for i in 1:length(Prime_Sequence)
      if is_prime(i) == true
        push!(new_prime_sequence, Prime_Sequence[i])
      end
    end
    Prime_Sequence = new_prime_sequence
    push!(All_Prime_Sequence, Prime_Sequence)
    # println(string(Prime_Sequence) * "\n")
  end
end

println("========================================================================================")

# println("The Number Of Sequences : " * string(length(All_Prime_Sequence)))

# for i in 1:length(All_Prime_Sequence)
#   print(string(length(All_Prime_Sequence[i])) * " ")
# end

plot(graph_x, graph_y,
    marker = :circle,
    linestyle = :solid,
    label = "n과 p에 대한 그래프",
    title = "n과 p에 대한 그래프",
    xlabel = "n ( 소수 범위 n )",
    ylabel = "Last Prime Number ( 마지막 소수 )")

savefig("n_p-graph.png")

graph_image = read("n_p-graph.png")
encoded_graph_image = base64encode(graph_image)
data_url = "data:image/png;base64,$encoded_graph_image"

println("========================================================================================")

println(data_url)

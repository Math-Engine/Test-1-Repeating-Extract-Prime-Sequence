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

All_Prime_Sequence = []
Prime_Sequence = []

for i in 1:param_n
  global Prime_Sequence
  if is_prime(i) == true
    push!(Prime_Sequence, i)
  end
end

push!(All_Prime_Sequence, Prime_Sequence)
println(string(Prime_Sequence) * "\n")

while true
  global Prime_Sequence
  global All_Prime_Sequence
  new_prime_sequence = []
  for i in 1:length(Prime_Sequence)
    if is_prime(i) == true
      push!(new_prime_sequence, Prime_Sequence[i])
    end
  end
  Prime_Sequence = new_prime_sequence
  push!(All_Prime_Sequence, Prime_Sequence)
  println(string(Prime_Sequence) * "\n")
  if length(Prime_Sequence) == 1
    break
  end
end

println("========================================================================================")

for i in 1:length(All_Prime_Sequence)
  println("The Number Of Sequences : " + string(length(All_Prime_Sequence)))
  print(string(length(All_Prime_Sequence[i])) + " ")
end

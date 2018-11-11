# Kacper Pieniążek, 236606

# Testowane typy liczb
types = [Float16, Float32, Float64]

for idx in eachindex(types)
    @printf("---------------\n%s\n", types[idx])
    println("val: ", 3 * (types[idx](4/3) - 1) - 1)
    println("expected: ", eps(types[idx]))
end

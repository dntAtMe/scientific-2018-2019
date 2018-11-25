module Test
include("functions.jl")

println(Third.mbisekcji(x -> x^(-1) - 2^x, 
                     0.0, 
                     1.0, 
                     10^(-9), 
                     10^(-9), 
                     100))

println(Third.mstycznych(x -> x^(-1) - 2^x,
                      x -> -(1/x^2) - 2^x * log(2),
                      0.5, 10^(-9), 10^(-9), 100))

println(Third.msiecznych(x -> x^(-1) - 2^x, 
                     0.2, 
                     0.8, 
                     10^(-9), 
                     10^(-9), 
                     100))

end
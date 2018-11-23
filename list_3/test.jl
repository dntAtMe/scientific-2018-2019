module Test
include("zad1.jl")


show(Third.mbisekcji(x -> x^(-1) - 2^x, 
                     0.0, 
                     1.0, 
                     10^(-9), 
                     10^(-9), 
                     100))

end
module Calculations
include("functions.jl")

## 
#   4.
##
println("4.")
println("Metoda bisekcji: ", Third.mbisekcji(x -> sin(x) - ((1/2)x)^2,
                                       1.5,
                                       2.0,
                                       1/2 * 10^(-5),
                                       1/2 * 10^(-5),
                                       100))

println("Metoda Newtona(stycznych): ", Third.mstycznych(x -> sin(x) - ((1/2)x)^2,
                                                        x -> cos(x) - x/2,
                                                        1.5,
                                                        1/2 * 10^(-5),
                                                        1/2 * 10^(-5),
                                                        100))

println("Metoda siecznych: ", Third.mbisekcji(x -> sin(x) - ((1/2)x)^2,
                                        1.0,
                                        2.0,
                                        1/2 * 10^(-5),
                                        1/2 * 10^(-5),
                                        100))


##
#   5.
##
println("\n5.")
println("Metoda bisekcji: ", Third.mbisekcji(x -> 3x - ℯ^x,
                                       0.0,
                                       1.0,
                                       10^(-4),
                                       10^(-4),
                                       100))

println("Metoda bisekcji: ", Third.mbisekcji(x -> 3x - ℯ^x,
                                       1.0,
                                       2.0,
                                       10^(-4),
                                       10^(-4),
                                       100))

##
#   6.
##

end
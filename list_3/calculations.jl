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
println("\n6.")

functions = [x-> ℯ^(1-x) - 1, x-> x*ℯ^(-x)]
pfunctions = [x-> -ℯ^(1 - x) * log(ℯ), x-> -ℯ^(-x)*(x - 1)]
δ = 10^(-5)
ϵ = 10^(-5)
println("ℯ^(1-x) - 1")
println("Metoda bisekcji: ", Third.mbisekcji( functions[1],
                                            0.0,
                                            3.0,
                                            δ, ϵ,
                                            50))

println("Metoda Newtona: ", Third.mstycznych( functions[1],
                                            pfunctions[1],
                                            0.0,
                                            δ, ϵ,
                                            50))

println("Metoda siecznych: ", Third.mbisekcji( functions[1],
                                            1.0,
                                            2.0,
                                            δ, ϵ,
                                            50))
println("xℯ^(-x)")
println("Metoda bisekcji: ", Third.mbisekcji( functions[2],
                                            0.0,
                                            3.0,
                                            δ, ϵ,
                                            50))

println("Metoda Newtona: ", Third.mstycznych( functions[2],
                                            pfunctions[2],
                                            200.0,
                                            δ, ϵ,
                                            50))

println("Metoda siecznych: ", Third.mbisekcji( functions[2],
                                            -1.0,
                                            2.0,
                                            δ, ϵ,
                                            50))

end
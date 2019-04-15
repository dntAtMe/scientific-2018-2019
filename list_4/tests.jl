## Kacper Pieniążek, 236606
using Test

include("zad1.jl")
include("zad2.jl")
include("zad3.jl")

xs = [1.0, 2.0]
fxs = [2.0, 1.0]

@test dividedDifferences(xs, fxs) == [2.0, -1.0]
@test natural(xs, [2.0, -1.0]) == [3.0, -1.0]
@test valNewton(xs, [2.0, -1.0], 1.5) == 1.5

xs = [1.0, 2.0, 3.0, 4.0]
fxs = [1.0, 4.0, 9.0, 16.0]
t = 2.0
@test dividedDifferences(xs , fxs) == [1.0, 3.0, 1.0, 0.0]
@test valNewton(xs, [1.0, 3.0, 1.0, 0.0], t) == t*t
@test natural(xs, [1.0, 3.0, 1.0, 0.0]) == [0.0, 0.0, 1.0, 0.0]

xs = [-1.0, 0.0, 1.0, 2.0]
fxs = [-1.0, 0.0, -1.0, 2.0]
println( natural(xs, dividedDifferences(xs, fxs)) )

using Test

include("zad1.jl")
include("zad2.jl")
include("zad3.jl")

@test natural([1.0, 2.0], [2.0, -1.0]) == [3.0, -1.0]
@test dividedDifferences([1.0, 2.0], [2.0, 1.0]) == [2.0, -1.0]

@test dividedDifferences([1.0, 2.0, 3.0, 4.0], [1.0, 4.0, 9.0, 16.0]) == [1.0, 3.0, 1.0, 0.0]
@test valNewton([1.0, 2.0, 3.0, 4.0], [1.0, 3.0, 1.0, 0.0], 2.0) == 4.0
@test natural([1.0, 2.0, 3.0, 4.0], [1.0, 3.0, 1.0, 0.0]) == [0.0, 0.0, 1.0, 0.0]
## Kacper Pieniążek, 236606

using PyPlot
include("zad1.jl")
include("zad2.jl")
##
# Interpoluje funkcję f(x) w zadanym przedziale
# za pomocą wielomianu interpolacyjnego Newtona.
# 
# Wejście: 
# @f - zadana funkcja
# @a - początek przedziału interpolacji
# @b - koniec przedziału interpolacji
# @n - stopień wielomianu interpolacyjnego
#
##

function drawNnfx(f::Function, a::Float64, b::Float64, n::Int)

    h = (b - a) / n
    xs = [a + k*h for k in 0:n]
    h = (b - a) / 100.0
    args = [a + k*h for k in 1:100]

    fx = dividedDifferences(xs, [f(x) for x in xs])
    ys = [valNewton(xs, fx, t) for t in args]

    gs = [f(x) for x in args]
    println("ARGS: ", args)
    println("YS: ", ys)
    
    plot(args, ys, linestyle="--", linewidth = 2,  markersize=4)
    plot(args, gs, linestyle="--", linewidth = 1,  markersize=4)
    
    show()

end

drawNnfx(x -> ℯ^x, 0.0, 1.0, 5)
drawNnfx(x -> ℯ^x, 0.0, 1.0, 10)
drawNnfx(x -> ℯ^x, 0.0, 1.0, 15)
drawNnfx(x -> x^2 * sin(x), -1.0, 1.0, 5)
drawNnfx(x -> x^2 * sin(x), -1.0, 1.0, 10)
drawNnfx(x -> x^2 * sin(x), -1.0, 1.0, 15)

#drawNnfx(x -> abs(x), -1.0, 1.0, 5)
#drawNnfx(x -> abs(x), -1.0, 1.0, 10)
#drawNnfx(x -> abs(x), -1.0, 1.0, 15)
#drawNnfx(x -> 1/(1 + x^2), -5.0, 5.0, 5)
#drawNnfx(x -> 1/(1 + x^2), -5.0, 5.0, 10)
#drawNnfx(x -> 1/(1 + x^2), -5.0, 5.0, 15)

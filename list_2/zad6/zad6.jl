# Kacper Pieniążek

using PyPlot

# Początkowe wartości wyrażenia
xs = [1,   2,  1.5, 1, -1,  0.75,   0.25]

# Stałe wartości
cs = [-2, -2, -2,               -1, -1, -1,     -1   ]

for i in 1:7
    # Przetrzymuje wartości
    # kolejnych iteracji w celu późniejszej wizualizacji
    ys = Float64[]
    x0 = xs[i]
    c = cs[i]
    x = x0
    append!(ys, x0)
    println("c = ", c)
    println("x_0 = ", x0)
    for n in 1:40
        x = x * x + c
        append!(ys, x)
        println("x_", n, " = ", x)
    end
    plot([0:40...], ys, linestyle="--", linewidth = 0.3, marker="o", markersize=4)
    show()
    println()
end

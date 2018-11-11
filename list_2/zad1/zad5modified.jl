# Kacper Pieniążek, 236606

x = [2.718281828, -3.141592654,
     1.414213562,  0.577215664,
     0.301029995
    ]

y = [1486.2497, 878366.9879,
     -22.37492, 4773714.647,
     0.000185049

    ]

#dł. wektorów
n = 5

# I sposób
# fl - typ liczb
# xs, ys - wektory
# n - wymiar wektorów
function a(fl, xs, ys, n)
    S = fl(0.0)
    for i in 1:n
        S = S + fl(fl(xs[i]) * fl(ys[i]))
    end
    S
end

# II sposób
# fl - typ liczb
# xs, ys - wektory
# n - wymiar wektorów
function b(fl, xs, ys, n)
    S = fl(0.0)
    for i in n:-1:1
        S = S + fl(fl(xs[i]) * fl(ys[i]))
    end
    S
end

# Funkcja pomocnicza do sposobów III i IV
# fl - typ liczb
# xs, ys - wektory
# n - wymiar wektorów
function calculateHelper(fl, xs, ys, n)
    helper = [fl(0.0), fl(0.0), fl(0.0), fl(0.0), fl(0.0)]
    for i in 1:n
        helper[i] = fl(fl(xs[i]) * fl(ys[i]))
    end
    helper
end

# III sposób
# fl - typ liczb
# helper - tablicy iloczynów kolejnych elementów wektoró x, y
function c(fl, helper)
    partialSums = [fl(0.0), fl(0.0)]
    for i in 1:2
        partialSums[1] += helper[i]
    end
    for i in n:-1:3
        partialSums[2] += helper[i]
    end
    sum_kbn(partialSums)
end

# IV sposób
# fl - typ liczb
# helper - tablicy iloczynów kolejnych elementów wektoró x, y
function d(fl, helper)
    partialSums = [fl(0.0), fl(0.0)]
    for i in 2:-1:1
        partialSums[1] += helper[i]
    end
    for i in 3:n
        partialSums[2] += helper[i]
    end
    sum_kbn(partialSums)
end

#typy do testowani
types = [Float32, Float64]

for fl in types
    helper = calculateHelper(fl, x, y, n)
    println( a(fl, x, y, n) )
    println( b(fl, x, y, n) )
    println( d(fl, helper) )
    println( c(fl, helper) )
    println()
end

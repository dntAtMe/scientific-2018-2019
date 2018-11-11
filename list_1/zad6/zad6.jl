# Kacper Pieniążek, 236606

function f(x::Float64)
    √(x^2.0 + 1.0) - 1.0
end

function g(x::Float64)
    x^2.0 / ( √(x^2.0 + 1.0) + 1.0)
end

#ostatnia potęga argumentu
n = -12

#iteracja po kolejnych potęgach argumentu
for i in -1.0:-1.0:n
    x = 8^i
    #@printf("miara bliskości: %g\n", 1 - (1.0 / √(x^2.0 + 1.0) ) )
    println("f(8^", i, ")= ", f(x))
    println("g(8^", i, ")= ", g(x))
    println()
end

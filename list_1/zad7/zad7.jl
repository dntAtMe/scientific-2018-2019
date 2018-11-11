# Kacper Pieniążek, 236606

# ex. 0.11694228168

function f(x::Float64)
    sin(x) + cos(3x)
end

function derivative(f::Function, x0::Float64, h::Float64)
    (f(x0 + h) - f(x0)) / h
end

for n in 0.0:1.0:54.0
    h =  2.0^(-n)
    x0 = 1.0
    result = derivative(f, x0, h)
    println("(n= ", n, ") f'= ", result, " | ", abs(result - 0.11694228168))
end

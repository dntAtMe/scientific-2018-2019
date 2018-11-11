# Kacper Pieniążek, 236606

# min - początek zakresu szukania
# max - koniec zakresu szukania
function find(min, max)
    current = Float64(min)

    while current < max
        current = nextfloat(current)
        if (current * (1.0 / current) != 1.0)
            r = (current * ( (1.0 / current) ) )
            println (current, r)
        end
    end

end

(a, b) = find(-Inf, Inf)
println( bits(a), " ", a, " ", b )

(a, b) = find(1, 2)
println( bits(a), " ", a, " ", b )

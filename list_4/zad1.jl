## Kacper Pieniążek, 236606


##
# Zwraca ilorazy różnicowe interpolowanej funkcji f. 
#
# Wejście:
# @x - wektor długości n+1 zawierający węzły x_0, ..., x_n
# @f - wektor długości n+1 zawierający wartości interpolowanej 
# funkcji w węzłach f(x_0), ..., f(x_n)
# 
# Wyjście:
# @fx - wektor długości n+1 zawierający obliczone ilorazy różnicowe
##
function dividedDifferences(x::Vector{Float64}, f::Vector{Float64})

    fx = copy(f)
    len = length(fx)
    
    for k in 1:len-1
       # println("k: ", k)
        for i in len:-1:2+(k-1)
          # println("i: ", i)
            fx[i] = (fx[i] - fx[i-1]) / (x[i] - (x[i-k]) )
        end
       # println("fx: ", fx)
    end

    return fx
end


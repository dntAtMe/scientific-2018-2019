## Kacper Pieniążek, 236606

##
# Wyznacza współczynniki postaci naturalnej wielomianu
# interpolacyjnego. Czas działania: O(n^2)
#
# Wejście:
# @x - wektor długości n+1 zawierający węzły wielomianu
# @fx - wektor długości n+1 zawierający ilorazy różnicowe
#
# Wyjście:
# @a - wektor długości n + 1 zawierający obliczone 
# współczynniki postaci naturalnej
##
function natural(x::Vector{Float64}, fx::Vector{Float64})
    n = length(x)
    result = zeros(Float64, n)
    for i = n:-1:1
        result[i] = fx[i]
        for j = i:n-1
            result[j] -= x[i] * result[j+1]
        end
    end
    return result    
end


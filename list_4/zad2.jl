## Kacper Pieniążek, 236606

##
# Oblicza wielomian interpolacyjny stopnia n w postaci Newtona
# w punkcie t.
# Do obliczeń wykorzystany jest uogólniony algorytm Hornera.
#
# Wejście:
# @x - wektor długości n+1 zawierający węzły x_0, ..., x_n
# @fx - wektor długości n +1 zawierający ilorazy różnicowe
# @t - punkt, w którym należy obliczyć wartość wielomianu
#
# Wyjście:
# @nt - wartość wielomianu w punkcie t
##
function valNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
    
    result = last(fx)
    len = length(fx)

    for i in len-1:-1:1
        result = result * (t-x[i]) + fx[i]
    end

    result
end
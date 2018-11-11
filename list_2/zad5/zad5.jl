## Kacper Pieniążek, 236606

# Oblicza iteracyjnie wyrażenie p_n+1 = p_n + r*p_n(1 - p_n)
#
# Input:
# p0 - wartość początkowa
# r - stała
# n - ilość iteracji
# t - typ liczby
function rec(p0, r, n, t)
    p = t(p0)
    for i in 1: n
        p = p + r * p*(1 - p)
    end
    p
end

# Oblicza iteracyjnie wyrażenie p_n+1 = p_n + r*p_n(1 - p_n)
# przez daną ilość iteracji, następnie "obcina" wartość
# do danej ilości miejsc znaczących i kontynuuje obliczenia.

# Input:
# p0 - wartość początkowa
# r - stała
# n1 - ilość iteracji przed obcięciem  floor(p, flr)
# n2 - ilość iteracji po obcięciu  floor(p, flr)
# t - typ liczby
# flr - ilość cyfr znaczących po obcięciu
function recFloor(p0, r, n1, n2, t, flr)
    p = t(p0)
    p = rec(p, r, n1, t)
    p = floor(p, flr)
    rec(p, r, n2, t)
end

# początkowe wartości równania
p0 = 0.01
r = 3


println("I.  Float32  p= ", rec(p0, r, 40, Float32))
println("II. Float32  p= ", recFloor(p0, r, 10, 30, Float32, 3))
println("I.  Float64  p= ", rec(p0, r, 40, Float64))
println("II. Float64  p= ", recFloor(p0, r, 10, 30, Float64, 3))

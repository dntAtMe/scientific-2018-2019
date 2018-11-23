##
# Kacper Pieniążek, 236606
##

module Third
export mbisekcji, mstycznych, msiecznych

##
# Funkcja oblicza f(x) = 0 metodą bisekcji
#
# Parametry:
# f - funkcja której pierwiastek ma być znaleziony
# a, b - końce przedziału początkowego
# delta, epsilon - dokładności obliczeń
#
# Wyjście:
# (r, v ,it, err)
# r - przybliżenie x t. że f(x) = 0
# v - wartość f(x)
# it - liczba wykonanych iteracji
# err - błąd; 1 jeśli funkcja nie zmienia znaku w przedziale
#
##
function mbisekcji(f::Function, a::Float64,
                      b::Float64,
                      delta::Float64,
                      epsilon::Float64,
                      maxit::Int)
    u = f(a)
    v = f(b)
    e = b - a
    if sign(u) == sign(v)
        return (0, 0, 0, 1)
    end
    for k in range(1, stop=maxit)
        e = e / 2
        c = a + e
        w = f(c)
        if abs(e) < delta || abs(w) < epsilon
            return (c, w, k, 0)
        end
        if sign(w) != sign(u)
            b = c
            v = w
        else
            a = c
            u = w
        end
    end
    return (0, 0, 0, 2)
end

##
# Funkcja oblicza f(x) = 0 metodą Netwona
#
# Parametry:
# f - funkcja, której pierwiastek ma być znaleziony
# pf- pochodna funkcji f
# delta, epsilon - dokładności obliczeń
# maxit - maksymana dopuszczalna ilość iteracji
#
# Wyjście:
# (r, v, it, err)
# r - przybliżenie x t. że f(x) = 0
# v - wartość f(x)
# it - liczba wykonanych iteracji
# err - błąd; 0 - metoda zbieżna
#             1 - wartość zbyt niedokładna
#             2 - pochodna bliska zeru
#
##
function mstycznych(f::Function, pf::Function,
                                 x0::Float64,
                                 delta::Float64,
                                 epsilon::Float64,
                                 maxit::Int)
f(x0)
end

##
# Funkcja oblicza f(x) = 0 metodą siecznych
#
# Parametry:
# f - funkcja, której pierwiastek ma być znaleziony
# x0, x1 - początkowe przybliżenia
# delta, epsilon - dokładności obliczeń
# maxit - maksymalna dopuszczalna ilość iteracji
#
# Wyjście:
# (r, v, it, err)
# r - przybliżenie x t. że f(x) = 0
# v - wartość f(x)
# it - liczba wykonanych iteracji
# err - błąd; 0 - metoda zbieżna
#             1 - wartość zbyt niedokładna
#
##
function msiecznych(f::Function, x0::Float64,
                                 x1::Float64,
                                 delta::Float64,
                                 epsilon::Float64,
                                 maxit::Float64)
f(x0)
end


end
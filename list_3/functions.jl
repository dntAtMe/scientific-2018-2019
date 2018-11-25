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
# δ, ϵ - dokładności obliczeń
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
                      δ::Float64,
                      ϵ::Float64,
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
        if abs(e) < δ || abs(w) < ϵ
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
# δ, ϵ - dokładności obliczeń
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
                                 δ::Float64,
                                 ϵ::Float64,
                                 maxit::Int)
    v = f(x0)
    if abs(v) < ϵ
        return (x0, v, 0, 0)
    end
    for k in range(1, stop=maxit)
        if pf(x0) == 0
            return (0, 0, 0, 2)
        end
        x1 = x0 - v/pf(x0)
        v = f(x1)
        if abs(x1 - x0) < δ || abs(v) < ϵ
            return (x1, v, k, 0)
        end
        x0 = x1;
    end
    return (x0, v, maxit, 1)
end

##
# Funkcja oblicza f(x) = 0 metodą siecznych
#
# Parametry:
# f - funkcja, której pierwiastek ma być znaleziony
# x0, x1 - początkowe przybliżenia
# δ, ϵ - dokładności obliczeń
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
                                 δ::Float64,
                                 ϵ::Float64,
                                 maxit::Int)
    fa = f(x0)
    fb = f(x1)
    for k in range(1, stop=maxit)
        if abs(fa) > abs(fb)
            x0, x1 = x1, x0
            fa, fb = fb, fa
        end
        s = (x1 - x0) / (fb - fa)
        x1 = x0
        fb = fa
        x0 = x0 - fa * s
        fa = f(x0)
        if abs(x1 - x0) < δ || abs(fa) < ϵ
            return (x0, fa, k, 0)
        end
    end
    (x0, fa, maxit, 1)    
end


end
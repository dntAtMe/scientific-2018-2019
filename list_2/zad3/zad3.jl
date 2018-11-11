# Kacper Pieniążek, 236606

#  Funkcje dołączone do zadania
include("hilb.jl")
include("matcond.jl")

# Tworzy macierz Hilberta
#
# Input:
# n - rozmiar macierzy
function fh(n::Int, c::Int)
    hilb(n)
end

# Tworzy kwadratową macierz losow
#
# Input:
# n - rozmiar macierzy
# c - wskaźnik uwarunkowania macierzy
function fr(n::Int, c::Int)
    matcond(n, Float64(10^c))
end

# Oblicza wektor przez eliminację Gaussa
#
# Input:
# A - macierz kwadratowa
# b - prawy wektor
function gauss(A::Array{Float64,2}, b::Array{Float64,1})
    A \ b
end

# Oblicza wektor przez mnożenie odwrotności macierzy A
#
# Input:
# A - macierz kwadratowa
# b - prawy wektor
function inverted(A::Array{Float64, 2}, b::Array{Float64, 1})
    inv(A) * b
end

# Oblicza wektor x oraz błędy względne wykonanych obliczeń
#
# Input:
# ns - tablica rozmiarów macierzy
# cs - tablica wskaźników uwarunkowania (dla macierzy losowej)
# f - funkcja tworząca macierz kwadratową
# g - funkcja obliczająca x0
function calculate(ns::Array{Int}, cs::Array{Int}, f::Function, g::Function)
    for n in ns
        for c in cs
            A = f(n, c)
            b = A*ones(n)
            x0 = g(A, b)
            x = ones(n, 1)
            ex0 = norm(x - x0, 1) / norm(x, 1)
            con = cond(A)
            rnk = rank(A)
            println("n: ", n, "  cond= ", con, "  rank(A)= ", rnk, "  e_abs= ", ex0)
            #print(IOContext(STDOUT, :compact=>false), "  x0= " , x0)
            #println(IOContext(STDOUT, :compact=>true), "  e_abs= ", ex0)
        end
    end
end

println("Macierze Hilberta: ")
calculate([2:21...], [0], fh, gauss)
calculate([2:21...], [0], fh, inverted)

println()
println("Macierze losowe: ")
ns = [5, 10, 20]
cs = [0, 1, 3, 7, 12, 16]
calculate(ns, cs, fr, gauss)
calculate(ns, cs, fr, inverted)

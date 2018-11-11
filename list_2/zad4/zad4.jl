# Kacper Pieniążek, 236606

using Polynomials

# Oblicza i drukuje wyliczone wartości potrzebne do zadania
#
# Input:
# rootsArr - tablica obliczonych pierwiastków wielomianu
# p - wielomian w postaci iloczynowej
# P - wielomian w postaci normalnej
function calc(rootsArr, p, P )
      for k in 1:20
            root = rootsArr[k]
            Px = abs(polyval(P, root))
            px = abs(polyval(p, root))
            zkk = abs(root - k)
            println("k= ", k, "  |P(x)| = ", Px)
            println("k= ", k, "  |p(x)| = ", px)
            println("k= ", k, "  |z_k - k| = ", zkk )
            println()
            #open("./dataHilb", "a") do f
            #  write(f, "$k & $Px & $px & $zkk \\\\ \n \\hline \n")
            #end
      end
end

# tablica współczynników wielomianu Wilkinsona w postaci normalnej
vals=reverse([1, -210.0, 20615.0,-1256850.0,
      53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,
      11310276995381.0, -135585182899530.0,
      1307535010540395.0,     -10142299865511450.0,
      63030812099294896.0,     -311333643161390640.0,
      1206647803780373360.0,     -3599979517947607200.0,
      8037811822645051776.0,      -12870931245150988800.0,
      13803759753640704000.0,      -8752948036761600000.0,
      2432902008176640000.0])

# wielomian Wilkinsona w postaci normalnej
P = Poly(vals)

# wielomian Wilkinsona w postaci iloczynowej
p =   poly([1.0:20.0...])

# tablica pierwiastków wielomianu Wilkinsona P
rootsArr = reverse(roots(P))

Δ = -2.0^(-23)

calc(rootsArr, p, P)

# ponowienie obliczeń dla zmodyfikowanego wejścia
vals[19] += Δ
P = Poly(vals)
rootsArr = reverse(roots(P))
calc(rootsArr, p, P)

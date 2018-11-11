# Kacper Pieniążek, 236606

# Typy liczb, dla których wykonywane są testy
types = [Float16, Float32, Float64]

# il. bitów mantysy testowane w funkcji macheps, wykorzystywane w fnkcji max
bits = [0, 0, 0]

# Precyzja arytmetyki ma wpływ na to, ile cyfr znaczących jest
# reprezentowanych dokładnie
# macheps to najmniejsza dodatnia liczba t. że dodana do jedności
# da w wyniku liczbę > 1.0
# im mniejsza wartość machepsu, tym większa precyzja arytmetyki

#       macheps
function macheps(floatType, sigbits, idx)
    val = floatType(1.0)
    pow = 0
    while 1 + val / 2 != 1
        val /= 2
        pow += 1
    end
    sigbits[idx] = pow
    println("macheps: ")
    println("result: ", val, " | m = ", pow)
    println("expected: ", eps(floatType(1.0)))

end

#       eta
function eta(floatType)
    val = floatType(1.0)
    pow = 0
    while val / 2 > 0
        val /= 2
        pow += 1
    end
    println("eta:")
    println("result: ", val, " | ", pow)
    println("expected: ", nextfloat(floatType(0.0)))
end

# max
# sigbits - ilość bitów mantysy
function max(floatType, sigbits::Int64)
    # val - największa liczba x taka, że x < 1.0
    # mnożenie o 2, tj. przesuwanie bitów na prawo spowoduje, że
    # otrzymamy największą wartość przed kolejną potęgą 2.
    # To znaczy, że jeśli 2^k = Inf, to val^k = prevfloat(Inf)
    val = floatType(1.0 - 2.0^( -sigbits - 1) )
    pow = 0
    while !isinf( floatType(val * 2) )
        val = floatType(val *2)
        pow += 1
    end
    println("max:")
    println("result: ", val, " | pow: ", pow)
    println("expected: ", realmax(floatType) )
    println()
end

for idx in eachindex(types)
    @printf("-------------------------------------\n%s\n\n", types[idx])
    macheps(types[idx], bits, idx)
    println()
    eta(types[idx])
    println()
    max(types[idx], bits[idx])
end

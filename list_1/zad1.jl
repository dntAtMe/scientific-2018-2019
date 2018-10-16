types = [Float16, Float32, Float64]
sigbits = [0, 0, 0]

# Precyzja arytmetyki ma wpływ na to, ile cyfr znaczących jest
# reprezentowanych dokładnie
# macheps to najmniejsza dodatnia liczba t. że dodana do jedności
# da w wyniku liczbę > 1.0
# SUMMARUM: im mniejsza wartość machepsu, tym większa precyzja arytmetyki

#       macheps
for idx in eachindex(types)
    val = types[idx](2.0)
    pow = 0
    while 1 + val / 2 != 1
        val /= 2
        pow += 1
    end
    println(string(types[idx]))
    println("result: ", val, " | m = ", pow)
    sigbits[idx] = pow
    println("expected: ", eps(types[idx](1.0)))
end

println()

#       eta
for idx in eachindex(types)
    val = types[idx](1.0)
    pow = 0
    while val / 2 > 0
        val /= 2
        pow += 1
    end
    println(string(types[idx]))
    println("result: ", val, " | ", pow)
    println("expected: ", nextfloat(types[idx](0.0)))
end

println()

#       max
for idx in eachindex(types)
    val = types[idx](1.0 - (1/2)^sigbits[idx])
    pow = 0
    while !isinf(types[idx](val * 2))
        val  = types[idx](val *2)
        pow += 1
    end
    println(string(types[idx]))
    println("result: ", val, " | ", pow)
    println("expected: ", realmax(types[idx]))
end

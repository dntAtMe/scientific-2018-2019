# Kacper Pieniążek, 236606

# [min, max] - granice przedziału
# step - krok między kolejnymi liczbami
function iterateStepRng(min, max, step)
    current = min
    n = Int(1/step)-1
    for k in 1:n
        current = min + step * k
        println(k, " ", bits(current), " ", current)
    end
end

#step to eps F64
iterateStepRng(1.0, 2.0, 2.0^(-52))

# bity mantysy zwiększają się o 1, więc iterujemy po
# wszystkich wartościach, jakie dany typ może przedstawić.

 # dla [1/2, 1] wykładnik -53
 # dla [2, 4] wykładnik -51

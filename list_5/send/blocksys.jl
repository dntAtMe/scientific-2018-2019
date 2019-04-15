## Kacper Pieniążek, 236606
#
#
#

module blocksys
    include("utilities.jl")
    export gaussian_elimination, gaussian_elimination_with_p

    ##
    # Oblicza wektor x metodą eliminacji Gaussa bez wyboru elementu głównego
    # A - macierz rzadka blokowa
    # b - prawy wektor
    # n - wymiar macierzy
    # l - rozmiar bloków
    #
    function gaussian_elimination(A::SparseMatrixCSC, b::Array, n::Int64, l::Int64)
        for k = 1:n-1
            for i = k+1:k+l-k%l
                if abs(A[k, k]) <= eps(Float64)
                    error("Zero as the pivot")
                end
                z = A[i, k] / A[k, k]
                A[i, k] = 0
                for j = k+1:min(n, k+l)
                    A[i, j] = A[i, j] - z*A[k, j]
                end
                b[i] = b[i] - z * b[k]
            end
        end
        x = Vector{Float64}(n)
        for i = n:-1:1
            sum = 0
            for j = i+1:min(n, i+l)
                sum += A[i, j] * x[j]
            end
            x[i] = (b[i] - sum) / A[i, i]
        end
        return x
    end

    ##
    # Oblicza wektor x metodą eliminacji Gaussa z częściowym wyborem elementu głównego
    # A - macierz rzadka blokowa
    # b - prawy wektor
    # n - wymiar macierzy
    # l - rozmiar bloków
    #
    function gaussian_elimination_p(A::SparseMatrixCSC, b::Array, n::Int64, l::Int64)
        P = collect(1:n)
        for k = 1:n-1
            limit = min(k+2*l-k%l, n)
            for i = k+1:limit
                max = k
                max_value = abs(A[P[k],k])
                for m = i:limit
                    if abs(A[P[m],k]) > max_value
                        max = m
                        max_value = abs(A[P[m],k])
                    end
                end
                P[k], P[max] = P[max], P[k]

                z = A[P[i],k] / A[P[k],k]
                A[P[i],k] = 0
                for j = k+1:min(n, k+2*l)
                    A[P[i],j] = A[P[i],j] - z * A[P[k],j]
                end
                b[P[i]] = b[P[i]] - z * b[P[k]]
            end
        end
        x = Vector{Float64}(n)
        for i = n:-1:1
            sum = 0
            for j = i+1:min(n, i+2*l)
                sum += A[P[i], j] * x[j]
            end
            x[i] = (b[P[i]] - sum) / A[P[i], i]
        end
        return x
    end

end
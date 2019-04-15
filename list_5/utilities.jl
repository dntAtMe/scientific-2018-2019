## Kacper Pieniążek, 236606
#
#
    export read_matrix_from_file, read_vector_from_file, save_vector_to_file, save_vector_to_file_with_error,
            multiply_matrix_by_vector

    ## Odczytuje macierz z pliku według formatu z "blocksys.jl"
    #
    # path - ścieżka do pliku
    #
    function read_matrix_from_file(path::String)
        I, J, V = Int64[], Int64[], Float64[]
        n = Int64
        l = Int64
        open(path, "r") do f
            n, l = map(x -> parse(Int64, x), split(readline(f), ' '))
            for ln in eachline(f)
                i, j, v = split(ln, ' ')
                i, j, v = parse(Int64, i), parse(Int64, j), parse(Float64, v)
                push!(I, i)
                push!(J, j)
                push!(V, v)
            end
        end
        return sparse(I, J, V), n, l
    end

    ## Odczytuje wektor z pliku według formatu z "blocksys.jl"
    #
    # path - ścieżka do pliku
    #
    function read_vector_from_file(path::String)
        n = Int64
        v = Vector{Float64}
        open(path, "r") do f
            n = parse(Int64, readline(f))
            v = Vector{Float64}(n)
            for ln in enumerate(eachline(f))
                v[ln[1]] = parse(Float64, ln[2])
            end
        end
        return v, n
    end

    ## Zapisuje wektor do pliku "
    #
    # x - wektor do zapisu
    # path - ścieżka do pliku
    #
    function save_vector_to_file(x::Array, path::String)
        writedlm(path, x, "\n")
    end


    ## Zapisuje wektor do pliku uwzględniając błąd przybliżenia
    #
    # x - wektor do zapisu
    # r - wektor dokładnej wartości
    # path - ścieżka do pliku
    #
    function save_vector_to_file_with_error(x::Array, r::Array, path::String)
        open(path, "w") do f
            write(f, string(norm(x-r)/norm(x)), "\n")
            writedlm(f, x, "\n")
        end
    end

    ## Zwraca elementy niezerowe
    #
    function fetch_non_zero_elms(i::Int64, n::Int64, l::Int64)
        part = div(i-1, l) + 1
        start = (part - 1)*l

        if part == 1
            return vcat(start+1:start+l, start+l+(i-1)%l+1)
        elseif part == n/l
            return vcat(start:start+l)
        else
            return vcat(start:start+l, start+l+(i-1)%l+1)
        end
    end

    # Oblicza wektor b
    #
    # A - macierz rzadka blokowa
    # x - wektor
    # n - wymiar macierzy
    # l - rozmiar bloku
    #
    function multiply_matrix_by_vector(A::SparseMatrixCSC, x::Array, n::Int64, l::Int64)
        b = Vector{Float64}(n)
        for col = 1:n
            for row in fetch_non_zero_elms(col, n, l)
                b[col] += A[col, row] * x[row]
            end
        end
        return b
    end

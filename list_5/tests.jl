## Kacper Pieniążek, 236606
#
#

include("blocksys.jl")
include("matrixgen.jl")
include("utilities.jl")


#(A,n,l) = blocksys.read_matrix_from_file("A.txt")
#(b, n) = blocksys.read_vector_from_file("b.txt")
# println(gaussian_elimination_with_pivots(A, n, l, b))

#println(blocksys.gaussian_elimination_p(A,b, n, l))


(A,n,l) = blocksys.read_matrix_from_file("A.txt")
(b, n) = blocksys.read_vector_from_file("b.txt")

x = ones(n)

b = multiply_matrix_by_vector(A, x, n, l)
xp = (blocksys.gaussian_elimination_p(A,b, n, l))

println(norm(xp-x)/norm(xp))

(A,n,l) = blocksys.read_matrix_from_file("A.txt")
(b, n) = blocksys.read_vector_from_file("b.txt")

println(A \ b)

#println(norm(xp-x)/norm(xp))
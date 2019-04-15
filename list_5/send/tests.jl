## Kacper Pieniążek, 236606
#
#

include("blocksys.jl")
include("matrixgen.jl")


(A,n,l) = blocksys.read_matrix_from_file("A16")
(b, n) = blocksys.read_vector_from_file("b16")
# println(gaussian_elimination_with_pivots(A, n, l, b))

x = ones(n)

println(blocksys.gaussian_elimination_p(A,b, n, l))


(A,n,l) = blocksys.read_matrix_from_file("A16")
(b, n) = blocksys.read_vector_from_file("b16")

println(blocksys.gaussian_elimination(A,b, n, l))

#println(norm(xp-x)/norm(xp))

(A,n,l) = blocksys.read_matrix_from_file("A16")
(b, n) = blocksys.read_vector_from_file("b16")

println(A \ b)

#println(norm(xp-x)/norm(xp))
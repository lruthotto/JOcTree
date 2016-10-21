using JOcTree
using jInv.Mesh
using jInv.Vis
using Base.Test

println("\t--- test plotGrid for OcTreeMesh ---")
n = [8;8;8]
h = [1;1;1.]
S    = sparse3(n)

bsz  = zeros(tuple(n...))
k    = 1

bsz[1:2:end,1:2:end,1:2:end] = 2
bsz[1:2,1:2,1:2] = 1
bsz[1:end,1:end,5:end] = 0
bsz[1,1,5] = 4
bsz[5,1,5] = 4
bsz[1,5,5] = 4
bsz[5,5,5] = 4
S.SV = sparse(vec(bsz))
M = getOcTreeMeshFV(S,h);

plotGrid(M)
println("\t--- passed! ---")
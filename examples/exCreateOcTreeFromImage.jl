using JOcTree
using jInv.Mesh
using MultiScale
using DivSigGrad

include("/Users/lruthot/Dropbox/Projects/MultiScale.jl/src/getMultiScaleBasis3DOcTree.jl")

n     = [16;16;16];
# Img   = zeros(UInt8,tuple(n...));
# Img[20:40,10:20,4:8] = 1;
# tol   = .001;
# 
# S     = createOcTreeFromImage(Img,tol)

# generate OcTree that is equivalent to regular mesh
nCoarse = 4
S    = sparse3(n)
bsz  = zeros(tuple(n...))
bsz[1:nCoarse:end,1:nCoarse:end,1:nCoarse:end] = nCoarse
S.SV = sparse(vec(bsz))

h     = [1.0;1.0;1.0];
domain = zeros(6)
domain[2:2:end] = h.*n

Mcoarse  = getOcTreeMeshFV(S,h)
Mfine = getRegularMesh(domain,n)

m = ones(tuple(Mfine.n...))
m[4:6,5:7,6:9] = 10
m = vec(m)
k = 1

# test for some rhs
rhs = zeros(tuple(Mfine.n+1...))
rhs[4,3,end] = 1;
rhs[end-4,3,end] = -1;
rhs = vec(rhs);


println("computing multiscale basis")
tic()
P = getMultiScaleBasis3D( Mfine, Mcoarse, vec(m))
tMS=toq()
println("done in $tMS sec!")
A = getDivSigGradMatrix(vec(m), Mfine)
A_red = P'*A*P
src_red = P'*rhs
u_red = A_red\full(src_red)
uMS = P*u_red


uFine = A\rhs;

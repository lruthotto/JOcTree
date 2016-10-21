# JOcTree

Library for creating and manipulating OcTrees as well as creating differential operators discretized on OcTree meshes.

# Requirements

JOcTree is intended for use with Julia 0.4.x. Other dependencies are

1. [`jInv`](https://github.com/JuliaInv/jInv.jl) - package for PDE parameter estimation. JOcTree extends ```jInv.Mesh```.
2. [`PyPlot`](https://github.com/JuliaPy/PyPlot.jl) - visualization  (for visualization). 

# Installation

Since [`jInv`](https://github.com/JuliaInv/jInv.jl) is not a registered package, you can install it by typing:
```
Pkg.clone("https://github.com/JuliaInv/jInv.jl","jInv")
Pkg.test("jInv")

```

Having [`jInv`](https://github.com/JuliaInv/jInv.jl) installed, type:
```
Pkg.clone("https://github.com/JuliaInv/JOcTree.git","JOcTree")
Pkg.test("JOcTree")
```

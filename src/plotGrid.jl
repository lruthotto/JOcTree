import jInv.Vis.plotGrid

function plotGrid(M::OcTreeMesh;kwargs...)
	# get nodal axes of fine mesh
	domain   = getDomain(M)
	Mreg     = getRegularMesh(domain,M.n)
	xa,ya,za = getNodalAxes(Mreg)

	# get indices of OcTree
	i,j,k,bsz = find3(M.S)

	# plot each cell in OcTree
	for l=1:M.nc 
		# get origin and domain
	    x0Loc              = [xa[i[l]],ya[j[l]],za[k[l]]]
	    domainLoc          = zeros(6,1)
	    domainLoc[1:2:end] = x0Loc
	    domainLoc[2:2:end] = x0Loc + bsz[l] * M.h
		
		# get regular mesh with 1 cell
	     Mloc= getRegularMesh(domainLoc,ones(Int,3))

		# use plotGrid from jInv.Vis
	    plotGrid(Mloc;kwargs...)
	end
end


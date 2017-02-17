__precompile__()

"""
    Sorting networks that process 1,2,..25 values are given.  
    These sorting networks should minimize conditional swaps.  
    The first sixteen are known to minimize conditional swaps.  
    
    Functions are a sequence of internally parallelizable blocks.
    Functions are written using empty lines as block delmiters.

    `sort(x1::T, .., xn::T)::NTuple{n,T}`  
    `sort(tup::NTuple{n,T})::NTuple{n,T}`  
"""
module SortingNetworks

import Base:sort

include("sort.jl")

end # module

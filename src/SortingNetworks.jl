"""
    Sorting networks for 1,2,..16 and 17,18..25 values are given.  
    These sorting networks should minimize conditional swaps.  
    The first sixteen are known to minimize conditional swaps.  
    
    Functions are a sequence of internally parallelizable blocks.
    Functions are written using empty lines as block delmiters.

    `swapsort(x1::T, .., xn::T)::NTuple{n,T}`  
    `swapsort(tup::NTuple{n,T})::NTuple{n,T}`  
"""
module SortingNetworks


export swapsort, ExchangeSort

struct ExchangeSortAlg  <: Base.Sort.Algorithm end
const ExchangeSort  = ExchangeSortAlg()

include("swapsort.jl")
include("swapsort_17to25.jl")

end # module

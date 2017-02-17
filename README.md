# SortingNetworks.jl
Sort 1..25 values with conditional swaps.

    Sorting networks that process 1,2,..25 values are given.  
    These sorting networks should minimize conditional swaps.  
    The first sixteen are known to minimize conditional swaps.  
    
    Functions are written with groups of internally parallelizable.    
    statements given together and sequential steps are separated.  
    `sort(x1::T, .., xn::T)::NTuple{n,T}`  
    `sort(tup::NTuple{n,T})::NTuple{n,T}`  

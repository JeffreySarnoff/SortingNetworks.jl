# SortingNetworks.jl
Sort 1..25 values with conditional swaps.

Sorting networks that process 1,2,..25 values are given.  
These sorting networks should minimize conditional swaps.  
The first sixteen are known to minimize conditional swaps.  
    
    `sort(x1::T, .., xn::T)::NTuple{n,T}`  
    `sort(tup::NTuple{n,T})::NTuple{n,T}`  

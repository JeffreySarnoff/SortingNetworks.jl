# SortingNetworks.jl

Sort 1..25 values with conditional swaps.&nbsp;&nbsp; [![Build Status](https://travis-ci.org/JeffreySarnoff/SortingNetworks.jl.svg?branch=master)](https://travis-ci.org/JeffreySarnoff/SortingNetworks.jl)



##### Copyright ©2017 by Jeffrey Sarnoff.
------

Sorting networks that process 1,2,..25 values are given.  
These sorting networks should minimize conditional swaps.  
The first sixteen are known to minimize conditional swaps.  
    
Values may be given with the args  `swapsort(x1::T, .., xn::T)::NTuple{n,T}`  
Values may be given using a tuple  `swapsort(tup::NTuple{n,T})::NTuple{n,T}`  
These sorts return a tuple of values sorted in ascending order.  

#### Install
`Pkg.add("SortingNetworks")`

#### Use
```julia
using SortingNetworks

jumble = (5,3,1,4,2)
sorted = (1,2,3,4,5)

ascending = swapsort(5,3,1,4,2)
ascending == sorted

ascending == swapsort(jumble)
ascending == sorted
```

With v0.6-dev, timing sort([a,b,..]) relative to swapsort(a,b,...),   
I got 15x for 4 Ints, 11x for 8 Ints, 5.75x for 16 Ints

##### acknowlegement

Jan Weidner provided **provably correct** code to test each implementation.




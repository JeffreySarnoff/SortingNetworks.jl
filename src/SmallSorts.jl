module SmallSorts

export smallsort

#=
   networks from http://pages.ripco.net/~jgamble/nw.html
=#

smallsort(a::T) where T = a
smallsort(a::T, b::T) where T = minmax(a, b)
function smallsort(a::T, b::T, c::T) where T
    b, c = minmax(b, c)
    a, c = minmax(a, c)
    a, b = minmax(a, b)
    return a, b, c
end

#=
sorting 4 
[[1,2],[3,4]]   step 1, 2 ops can be simultaneous
[[1,3],[2,4]]   step 2, 2 ops can be simultaneous
[[2,3]]         step 3
=#

function smallsort(a::T, b::T, c::T, d::T) where T
    a, b = minmax(a, b)
    c, d = minmax(c, d)
    
    a, c = minmax(a, c)
    b, d = minmax(b, d)
    
    b, c = minmax(b, c)
    
    return a, b, c, d
end

#=
sort 5 values

There are 9 comparators in this network,
grouped into 6 parallel operations.

[[1,2],[4,5]]
[[3,5]]
[[3,4],[2,5]]
[[1,4]]
[[1,3],[2,4]]
[[2,3]]
=#

function smallsort(a::T, b::T, c::T, d::T, e::T) where T
    a, b = minmax(a, b)
    d, e = minmax(d, e)
    
    c, e = minmax(c, e)

    c, d = minmax(c, d)
    b, e = minmax(b, e)
    
    a, d = minmax(a, d)
    
    a, c = minmax(a, c)
    b, d = minmax(b, d)
    
    b, c = minmax(b, c)

    return a, b, c, d, e
end

#=
sort 6 values
There are 12 comparators in this network,
grouped into 6 parallel operations.

[[2,3],[5,6]]
[[1,3],[4,6]]
[[1,2],[4,5],[3,6]]
[[1,3],[2,5]]
[[3,5],[2,4]]
[[3,4]]
=#

function smallsort(a::T, b::T, c::T, d::T, e::T, f::T) where T
    b, c = minmax(b, c)
    e, f = minmax(e, f)
    
    a, c = minmax(a, c)
    d, f = minmax(d, f)

    a, b = minmax(a, b)
    d, e = minmax(d, e)
    c, f = minmax(c, f)
    
    a, c = minmax(a, c)
    b, e = minmax(b, e)
    
    c, e = minmax(c, e)
    b, d = minmax(b, d)
    
    c, d = minmax(c, d)

    return a, b, c, d, e, f
end

end # module SmallSorts

module TinySorts

import Base: sort

const MIN_ITEMS = 1
const MAX_ITEMS = 9

#=
   networks from http://pages.ripco.net/~jgamble/nw.html
=#

# sorting 1

sort(a::T) where T = a

#=
sorting 2

There are 1 comparators in this network,
  grouped into 1 parallel operations.

[[0,1]]
=#

sort(a::T, b::T) where T = minmax(a, b)

#=
sorting 3

There are 3 comparators in this network,
  grouped into 3 parallel operations.

[[2,3]]
[[1,3]]
[[1,2]]
=#

function sort(a::T, b::T, c::T) where T
    b, c = minmax(b, c)
    a, c = minmax(a, c)
    a, b = minmax(a, b)
    return a, b, c
end
      
#=
sorting 4

There are 5 comparators in this network,
  grouped into 3 parallel operations.

[[1,2],[3,4]]   step 1, 2 ops can be simultaneous
[[1,3],[2,4]]   step 2, 2 ops can be simultaneous
[[2,3]]         step 3
=#

function sort(a::T, b::T, c::T, d::T) where T
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

function sort(a::T, b::T, c::T, d::T, e::T) where T
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
[[1,4],[2,5]]
[[3,5],[2,4]]
[[3,4]]
=#

function sort(a::T, b::T, c::T, d::T, e::T, f::T) where T
    b, c = minmax(b, c)
    e, f = minmax(e, f)

    a, c = minmax(a, c)
    d, f = minmax(d, f)

    a, b = minmax(a, b)
    d, e = minmax(d, e)
    c, f = minmax(c, f)

    a, d = minmax(a, d)
    b, e = minmax(b, e)

    c, e = minmax(c, e)
    b, d = minmax(b, d)

    c, d = minmax(c, d)

    return a, b, c, d, e, f
end

#=
sort 7 values
re are 16 comparators in this network,
grouped into 7 parallel operations.

[[2,3],[4,5],[6,7]]
[[1,3],[4,6],[5,7]]
[[1,2],[5,6],[3,7]]
[[1,5],[2,6]]
[[1,4],[3,6]]
[[2,4],[3,5]]
[[3,4]]
=#

function sort(a::T, b::T, c::T, d::T, e::T, f::T, g::T) where T
    b, c = minmax(b, c)
    d, e = minmax(d, e)
    f, g = minmax(f, g)

    a, c = minmax(a, c)
    d, f = minmax(d, f)
    e, g = minmax(e, g)

    a, b = minmax(a, b)
    e, f = minmax(e, f)
    c, g = minmax(c, g)

    a, e = minmax(a, e)
    b, f = minmax(b, f)

    a, d = minmax(a, d)
    c, f = minmax(c, f)

    b, d = minmax(b, d)
    c, e = minmax(c, e)

    c, d = minmax(c, d)

    return a, b, c, d, e, f, g
end

#=
sort 8 values

There are 19 comparators in this network,
  grouped into 7 parallel operations.

[[1,2],[3,4],[5,6],[7,8]]
[[1,3],[2,4],[5,7],[6,8]]
[[2,3],[6,7],[1,5],[4,8]]
[[2,6],[3,7]]
[[2,5],[4,7]]
[[3,5],[4,6]]
[[4,5]]
=#

function sort(a::T, b::T, c::T, d::T, e::T, f::T, g::T, h::T) where T
    a, b = minmax(a, b)
    c, d = minmax(c, d)
    e, f = minmax(e, f)
    g, h = minmax(g, h)

    a, c = minmax(a, c)
    b, d = minmax(b, d)
    e, g = minmax(e, g)
    f, h = minmax(f, h)

    b, c = minmax(b, c)
    f, g = minmax(f, g)
    a, e = minmax(a, e)
    d, h = minmax(d, h)

    b, f = minmax(b, f)
    c, g = minmax(c, g)

    b, e = minmax(b, e)
    d, g = minmax(d, g)

    c, e = minmax(c, e)
    d, f = minmax(d, f)

    d, e = minmax(d, e)

    return a, b, c, d, e, f, g, h
end

#=
sort 9 values

There are 25 comparators in this network,
  grouped into 9 parallel operations.

[[1,2],[4,5],[7,8]]
[[2,3],[5,6],[8,9]]
[[1,2],[4,5],[7,8],[3,6]]
[[1,4],[2,5],[6,9]]
[[4,7],[5,8],[3,6]]
[[1,4],[2,5],[6,8],[3,7]]
[[2,4],[5,7]]
[[3,5],[6,7]]
[[3,4]]
=#

function sort(a::T, b::T, c::T, d::T, e::T,  
              f::T, g::T, h::T, i::T) where T

    a, b = minmax(a, b)
    d, e = minmax(d, e)
    g, h = minmax(g, h)

    b, c = minmax(b, c)
    e, f = minmax(e, f)
    h, i = minmax(h, i)

    a, b = minmax(a, b)
    d, e = minmax(d, e)
    g, h = minmax(g, h)
    c, f = minmax(c, f)

    a, d = minmax(a, d)
    b, e = minmax(b, e)
    f, i = minmax(f, i)

    d, g = minmax(d, g)
    e, h = minmax(e, h)
    c, f = minmax(c, f)

    a, d = minmax(a, d)
    b, e = minmax(b, e)
    f, h = minmax(f, h)
    c, g = minmax(c, g)

    b, d = minmax(b, d)
    e, g = minmax(e, g)

    c, e = minmax(c, e)
    f, g = minmax(f, g)

    c, d = minmax(c, d)

    return a, b, c, d, e, f, g, h, i
end


function sort(v::Vector{T}) where T
   return if MIN_ITEMS <= length(v) <= MAX_ITEMS
              sort(v...)
          else
              Base.sort(v)
          end
end

if isdefined(:StaticArrays)   
  function sort(sv::SVector)
     n = length(sv)
     MIN_ITEMS <= length(v) <= MAX_ITEMS || throw(DomainError())
     return SVector{n}( sort(x.data)... )
  end
end

for N in collect(MIN_ITEMS:MAX_ITEMS)
   @eval sort(x::NTuple{$N, T}) where T = sort(x...)
end   

#= 
   versions sorting from high values to low values
=#
function sort_reverse(a::T) where T
    return a
end      
function sort_reverse(a::T, b::T) where T
    a, b = minmax(a, b)
    return b, a
end      
function sort_reverse(a::T, b::T, c::T) where T
    a, b, c = sort(a, b, c)
    return c, b, a
end      
function sort_reverse(a::T, b::T, c::T, d::T) where T
    a ,b, c, d = sort(a, b, c, d)
    return d, c, b, a
end
function sort_reverse(a::T, b::T, c::T, d::T, e::T) where T
    a, b, c, d, e = sort(a, b, c, d, e)
    return e, d, c, b, a
end
function sort_reverse(a::T, b::T, c::T, d::T, e::T, f::T) where T
    a, b, c, d, e, f = sort(a, b, c, d, e, f)
    return f, e, d, c, b, a
end
function sort_reverse(a::T, b::T, c::T, d::T, e::T, f::T, g::T) where T
    a, b, c, d, e, f, g = sort(a, b, c, d, e, f, g)
    return g, f, e, d, c, b, a
end
function sort_reverse(a::T, b::T, c::T, d::T, e::T, f::T, g::T, h::T) where T
    a, b, c, d, e, f, g, h = sort(a, b, c, d, e, f, g, h)
    return h, g, f, e, d, c, b, a
end

#=
sort 3 values
[[2,3]]
[[1,3]]
[[1,2]]

sort 4 values
[[1,2],[3,4]]
[[1,3],[2,4]]
[[2,3]]

sort 5 vaiues
[[1,2],[4,5]]
[[3,5]]
[[3,4],[2,5]]
[[1,4]]
[[1,3],[2,4]]
[[2,3]]

sort 6 values
[[2,3],[5,6]]
[[1,3],[4,6]]
[[1,2],[4,5],[3,6]]
[[1,4],[2,5]]
[[3,5],[2,4]]
[[3,4]]

sort 7 values
[[2,3],[4,5],[6,7]]
[[1,3],[4,6],[5,7]]
[[1,2],[5,6],[3,7]]
[[1,5],[2,6]]
[[1,4],[3,6]]
[[2,4],[3,5]]
[[3,4]]

sort 8 values
[[1,2],[3,4],[5,6],[7,8]]
[[1,3],[2,4],[5,7],[6,8]]
[[2,3],[6,7],[1,5],[4,8]]
[[2,6],[3,7]]
[[2,5],[4,7]]
[[3,5],[4,6]]
[[4,5]]

sort 9 values
[[1,2],[4,5],[7,8]]
[[2,3],[5,6],[8,9]]
[[1,2],[4,5],[7,8],[3,6]]
[[1,4],[2,5],[6,9]]
[[4,7],[5,8],[3,6]]
[[1,4],[2,5],[6,8],[3,7]]
[[2,4],[5,7]]
[[3,5],[6,7]]
[[3,4]]

sort 10 values
[[5,10],[4,9],[3,8],[2,7],[1,6]]
[[2,5],[7,10],[1,4],[6,9]]
[[1,3],[4,7],[8,10]]
[[1,2],[3,5],[6,8],[9,10]]
[[2,3],[5,7],[8,9],[4,6]]
[[3,6],[7,9],[2,4],[5,8]]
[[3,4],[7,8]]
[[4,5],[6,7]]
[[5,6]]

sort 11 values
[[1,2],[3,4],[5,6],[7,8],[9,10]]
[[2,4],[6,8],[1,3],[5,7],[9,11]]
[[2,3],[6,7],[10,11],[1,5],[4,8]]
[[2,6],[7,11],[5,9]]
[[6,10],[3,7],[1,5],[4,9]]
[[2,6],[7,11],[3,4],[9,10]]
[[2,5],[8,11],[4,6],[7,9]]
[[3,5],[8,10],[6,7]]
[[4,5],[8,9]]

sort 12 values
[[1,2],[3,4],[5,6],[7,8],[9,10],[11,12]]
[[2,4],[6,8],[10,12],[1,3],[5,7],[9,11]]
[[2,3],[6,7],[10,11],[1,5],[8,12]]
[[2,6],[7,11],[4,8],[5,9]]
[[6,10],[3,7],[1,5],[8,12],[4,9]]
[[2,6],[7,11],[3,4],[9,10]]
[[2,5],[8,11],[4,6],[7,9]]
[[3,5],[8,10],[6,7]]
[[4,5],[8,9]]

sort 13 values
[[2,8],[10,12],[4,5],[6,9],[1,13],[3,7]]
[[1,2],[3,4],[5,7],[9,12],[8,13],[6,10]]
[[1,3],[4,8],[11,12],[2,5],[7,13]]
[[8,9],[12,13],[5,10],[7,11]]
[[4,5],[6,7],[9,10],[11,12],[2,8]]
[[3,7],[10,12],[2,4],[5,8],[9,11],[1,6]]
[[3,6],[7,9],[10,11]]
[[2,3],[4,6],[8,9],[5,7]]
[[3,4],[5,6],[7,8],[9,10]]
[[4,5],[6,7]]

sort 14 values
[[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14]]
[[1,3],[5,7],[9,11],[2,4],[6,8],[10,12]]
[[1,5],[9,13],[2,6],[10,14],[3,7],[4,8]]
[[1,9],[2,10],[3,11],[4,12],[5,13],[6,14]]
[[6,11],[7,10],[4,13],[8,12],[2,3],[5,9]]
[[2,5],[8,14],[3,9],[6,7],[10,11]]
[[3,5],[12,14],[4,9],[8,13]]
[[7,9],[11,13],[4,6],[8,10]]
[[4,5],[6,7],[8,9],[10,11],[12,13]]
[[7,8],[9,10]]

sort 15 values
[[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14]]
[[1,3],[5,7],[9,11],[13,15],[2,4],[6,8],[10,12]]
[[1,5],[9,13],[2,6],[10,14],[3,7],[11,15],[4,8]]
[[1,9],[2,10],[3,11],[4,12],[5,13],[6,14],[7,15]]
[[6,11],[7,10],[4,13],[14,15],[8,12],[2,3],[5,9]]
[[2,5],[8,14],[3,9],[12,15],[6,7],[10,11]]
[[3,5],[12,14],[4,9],[8,13]]
[[7,9],[11,13],[4,6],[8,10]]
[[4,5],[6,7],[8,9],[10,11],[12,13]]
[[7,8],[9,10]]

sort 16 values
[[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16]]
[[1,3],[5,7],[9,11],[13,15],[2,4],[6,8],[10,12],[14,16]]
[[1,5],[9,13],[2,6],[10,14],[3,7],[11,15],[4,8],[12,16]]
[[1,9],[2,10],[3,11],[4,12],[5,13],[6,14],[7,15],[8,16]]
[[6,11],[7,10],[4,13],[14,15],[8,12],[2,3],[5,9]]
[[2,5],[8,14],[3,9],[12,15],[6,7],[10,11]]
[[3,5],[12,14],[4,9],[8,13]]
[[7,9],[11,13],[4,6],[8,10]]
[[4,5],[6,7],[8,9],[10,11],[12,13]]
[[7,8],[9,10]]

=#

#=
sort 3 values
sort(a::T, b::T, c::T) where T
[[b,c]]
[[a,c]]
[[a,b]]

sort 4 values
sort(a::T, b::T, c::T, d::T) where T
[[a,b],[c,d]]
[[a,c],[b,d]]
[[b,c]]

sort 5 vaiues
sort(a::T, b::T, c::T, d::T, e::T) where T
[[a,b],[d,e]]
[[c,e]]
[[c,d],[b,e]]
[[a,d]]
[[a,c],[b,d]]
[[b,c]]

sort 6 values
sort(a::T, b::T, c::T, d::T, e::T, f::T) where T
[[b,c],[e,f]]
[[a,c],[d,f]]
[[a,b],[d,e],[c,f]]
[[a,d],[b,e]]
[[c,e],[b,d]]
[[c,d]]

sort 7 values
sort(a::T, b::T, c::T, d::T, e::T, f::T, g::T) where T
[[b,c],[d,e],[f,g]]
[[a,c],[d,f],[e,g]]
[[a,b],[e,f],[c,g]]
[[a,e],[b,f]]
[[a,d],[c,f]]
[[b,d],[c,e]]
[[c,d]]

sort 8 values
sort(a::T, b::T, c::T, d::T, e::T, f::T, g::T, h::T) where T
[[a,b],[c,d],[e,f],[g,h]]
[[a,c],[b,d],[e,g],[f,h]]
[[b,c],[f,g],[a,e],[d,h]]
[[b,f],[c,g]]
[[b,e],[d,g]]
[[c,e],[d,f]]
[[d,e]]

sort 9 values
sort(a::T, b::T, c::T, d::T, e::T, f::T, g::T, h::T, i::T) where T
[[a,b],[d,e],[g,h]]
[[b,c],[e,f],[h,i]]
[[a,b],[d,e],[g,h],[c,f]]
[[a,d],[b,e],[f,i]]
[[d,g],[e,h],[c,f]]
[[a,d],[b,e],[f,h],[c,g]]
[[b,d],[e,g]]
[[c,e],[f,g]]
[[c,d]]

sort 10 values
sort(a::T, b::T, c::T, d::T, e::T, f::T, g::T, h::T, i::T, j::T) where T
[[e,j],[d,i],[c,h],[b,g],[a,f]]
[[b,e],[g,j],[a,d],[f,i]]
[[a,c],[d,g],[h,j]]
[[a,b],[c,e],[f,h],[i,j]]
[[b,c],[e,g],[h,i],[d,f]]
[[c,f],[g,i],[b,d],[e,h]]
[[c,d],[g,h]]
[[d,e],[f,g]]
[[e,f]]

sort 11 values
sort(a::T, b::T, c::T, d::T, e::T, f::T, g::T, h::T, i::T, j::T, p::T) where T
[[a,b],[c,d],[e,f],[g,h],[i,j]]
[[b,d],[f,h],[a,c],[e,g],[i,p]]
[[b,c],[f,g],[j,p],[a,e],[d,h]]
[[b,f],[g,p],[e,i]]
[[f,j],[c,g],[a,e],[d,i]]
[[b,f],[g,p],[c,d],[i,j]]
[[b,e],[h,p],[d,f],[g,i]]
[[c,e],[h,j],[f,g]]
[[d,e],[h,i]]

sort 12 values
sort(a::T, b::T, c::T, d::T, e::T, f::T, g::T, h::T, i::T, j::T, p::T, q::T) where T
[[a,b],[c,d],[e,f],[g,h],[i,j],[p,q]]
[[b,d],[f,h],[j,q],[a,c],[e,g],[i,p]]
[[b,c],[f,g],[j,p],[a,e],[h,q]]
[[b,f],[g,p],[d,h],[e,i]]
[[f,j],[c,g],[a,e],[h,q],[d,i]]
[[b,f],[g,p],[c,d],[i,j]]
[[b,e],[h,p],[d,f],[g,i]]
[[c,e],[h,j],[f,g]]
[[d,e],[h,i]]

sort 13 values
sort(a::T, b::T, c::T, d::T, e::T, f::T, g::T, h::T, i::T, j::T, p::T, q::T, r::T) where T
[[b,h],[j,q],[d,e],[f,i],[a,r],[c,g]]
[[a,b],[c,d],[e,g],[i,q],[h,r],[f,j]]
[[a,c],[d,h],[p,q],[b,e],[g,r]]
[[h,i],[q,r],[e,j],[g,p]]
[[d,e],[f,g],[i,j],[p,q],[b,h]]
[[c,g],[j,q],[b,d],[e,h],[i,p],[a,f]]
[[c,f],[g,i],[j,p]]
[[b,c],[d,f],[h,i],[e,g]]
[[c,d],[e,f],[g,h],[i,j]]
[[d,e],[f,g]]

sort 14 values
sort(a::T, b::T, c::T, d::T, e::T, f::T, g::T, h::T, i::T, j::T, p::T, q::T, r::T, s::T) where T
[[a,b],[c,d],[e,f],[g,h],[i,j],[p,q],[r,s]]
[[a,c],[e,g],[i,p],[b,d],[f,h],[j,q]]
[[a,e],[i,r],[b,f],[j,s],[c,g],[d,h]]
[[a,i],[b,j],[c,p],[d,q],[e,r],[f,s]]
[[f,p],[g,j],[d,r],[h,q],[b,c],[e,i]]
[[b,e],[h,s],[c,i],[f,g],[j,p]]
[[c,e],[q,s],[d,i],[h,r]]
[[g,i],[p,r],[d,f],[h,j]]
[[d,e],[f,g],[h,i],[j,p],[q,r]]
[[g,h],[i,j]]

sort 15 values
sort(a::T, b::T, c::T, d::T, e::T, f::T, g::T, h::T, i::T, j::T, p::T, q::T, r::T, s::T, t::T) where T
[[a,b],[c,d],[e,f],[g,h],[i,j],[p,q],[r,s]]
[[a,c],[e,g],[i,p],[r,t],[b,d],[f,h],[j,q]]
[[a,e],[i,r],[b,f],[j,s],[c,g],[p,t],[d,h]]
[[a,i],[b,j],[c,p],[d,q],[e,r],[f,s],[g,t]]
[[f,p],[g,j],[d,r],[s,t],[h,q],[b,c],[e,i]]
[[b,e],[h,s],[c,i],[q,t],[f,g],[j,p]]
[[c,e],[q,s],[d,i],[h,r]]
[[g,i],[p,r],[d,f],[h,j]]
[[d,e],[f,g],[h,i],[j,p],[q,r]]
[[g,h],[i,j]]

sort 16 values
sort(a::T, b::T, c::T, d::T, e::T, f::T, g::T, h::T, i::T, j::T, p::T, q::T, r::T, s::T, t::T, u::T) where T
[[a,b],[c,d],[e,f],[g,h],[i,j],[p,q],[r,s],[t,u]]
[[a,c],[e,g],[i,p],[r,t],[b,d],[f,h],[j,q],[s,u]]
[[a,e],[i,r],[b,f],[j,s],[c,g],[p,t],[d,h],[q,u]]
[[a,i],[b,j],[c,p],[d,q],[e,r],[f,s],[g,t],[h,u]]
[[f,p],[g,j],[d,r],[s,t],[h,q],[b,c],[e,i]]
[[b,e],[h,s],[c,i],[q,t],[f,g],[j,p]]
[[c,e],[q,s],[d,i],[h,r]]
[[g,i],[p,r],[d,f],[h,j]]
[[d,e],[f,g],[h,i],[j,p],[q,r]]
[[g,h],[i,j]]

=#

end # module TinySorts

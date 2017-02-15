module TinySorts

import Base: minmax, sort

const MIN_ITEMS = 1
const MAX_ITEMS = 24

function minmax(a::T, b::T) where T<:Number
    return (b < a) ? (b, a) : (a, b)
end
function minmax(a::T, b::T) where T
    return isless(b, a) ? (b, a) : (a, b)
end

#=
   networks from http://pages.ripco.net/~jgamble/nw.html
=#

# sorting 1

(sort(a::T) where T) = a

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

#=
sort 10 values
=#

function sort(a::T,b::T,c::T,d::T,e::T,f::T,g::T,h::T,i::T,j::T) where T

    e, j = minmax(e, j)
    d, i = minmax(d, i)
    c, h = minmax(c, h)
    b, g = minmax(b, g)
    a, f = minmax(a, f)

    b, e = minmax(b, e)
    g, j = minmax(g, j)
    a, d = minmax(a, d)
    f, i = minmax(f, i)

    a, c = minmax(a, c)
    d, g = minmax(d, g)
    h, j = minmax(h, j)

    a, b = minmax(a, b)
    c, e = minmax(c, e)
    f, h = minmax(f, h)
    i, j = minmax(i, j)

    b, c = minmax(b, c)
    e, g = minmax(e, g)
    h, i = minmax(h, i)
    d, f = minmax(d, f)

    c, f = minmax(c, f)
    g, i = minmax(g, i)
    b, d = minmax(b, d)
    e, h = minmax(e, h)

    c, d = minmax(c, d)
    g, h = minmax(g, h)

    d, e = minmax(d, e)
    f, g = minmax(f, g)

    e, f = minmax(e, f)

    return a,b,c,d,e,f,g,h,i,j
end

#=
sort 11 values
=#


#=
sort 12 values
=#

function sort(a::T,b::T,c::T,d::T,e::T,f::T,g::T,h::T,i::T,j::T) where T

    a, b = minmax(a, b)
    c, d = minmax(c, d)
    e, f = minmax(e, f)
    g, h = minmax(g, h)
    i, j = minmax(i, j)
    k, l = minmax(k, l)

    b, d = minmax(b, d)
    f, h = minmax(f, h)
    j, l = minmax(j, l)
    a, c = minmax(a, c)
    e, g = minmax(e, g)
    i, k = minmax(i, k)

    b, c = minmax(b, c)
    f, g = minmax(f, g)
    j, k = minmax(j, k)
    a, e = minmax(a, e)
    h, l = minmax(h, l)

    b, f = minmax(b, f)
    g, k = minmax(g, k)
    d, h = minmax(d, h)
    e, i = minmax(e, i)

    f, j = minmax(f, j)
    c, g = minmax(c, g)
    a, e = minmax(a, e)
    h, l = minmax(h, l)
    d, i = minmax(d, i)

    b, f = minmax(b, f)
    g, k = minmax(g, k)
    c, d = minmax(c, d)
    i, j = minmax(i, j)

    b, e = minmax(b, e)
    h, k = minmax(h, k)
    d, f = minmax(d, f)
    g, i = minmax(g, i)

    c, e = minmax(c, e)
    h, j = minmax(h, j)
    f, g = minmax(f, g)

    d, e = minmax(d, e)
    h, i = minmax(h, i)

    return a,b,c,d,e,f,g,h,i,j
end

#=
sort 13 values
=#


#=
sort 14 values
=#

function sort(a::T,b::T,c::T,d::T,e::T,f::T,g::T,h::T,i::T,j::T,k::T) where T

    a, b = minmax(a, b)
    c, d = minmax(c, d)
    e, f = minmax(e, f)
    g, h = minmax(g, h)
    i, j = minmax(i, j)
    k, l = minmax(k, l)
    m, n = minmax(m, n)

    a, c = minmax(a, c)
    e, g = minmax(e, g)
    i, k = minmax(i, k)
    b, d = minmax(b, d)
    f, h = minmax(f, h)
    j, l = minmax(j, l)

    a, e = minmax(a, e)
    i, m = minmax(i, m)
    b, f = minmax(b, f)
    j, n = minmax(j, n)
    c, g = minmax(c, g)
    d, h = minmax(d, h)

    a, i = minmax(a, i)
    b, j = minmax(b, j)
    c, k = minmax(c, k)
    d, l = minmax(d, l)
    e, m = minmax(e, m)
    f, n = minmax(f, n)

    f, k = minmax(f, k)
    g, j = minmax(g, j)
    d, m = minmax(d, m)
    h, l = minmax(h, l)
    b, c = minmax(b, c)
    e, i = minmax(e, i)

    b, e = minmax(b, e)
    h, n = minmax(h, n)
    c, i = minmax(c, i)
    f, g = minmax(f, g)
    j, k = minmax(j, k)

    c, e = minmax(c, e)
    l, n = minmax(l, n)
    d, i = minmax(d, i)
    h, m = minmax(h, m)

    g, i = minmax(g, i)
    k, m = minmax(k, m)
    d, f = minmax(d, f)
    h, j = minmax(h, j)

    d, e = minmax(d, e)
    f, g = minmax(f, g)
    h, i = minmax(h, i)
    j, k = minmax(j, k)
    l, m = minmax(l, m)

    g, h = minmax(g, h)
    i, j = minmax(i, j)

    return a,b,c,d,e,f,g,h,i,j,k
end

#=
sort 15 values
=#


#=
sort 16 values
=#

function sort(a::T,b::T,c::T,d::T,e::T,f::T,g::T,h::T,i::T,j::T,k::T) where T

    a, b = minmax(a, b)
    c, d = minmax(c, d)
    e, f = minmax(e, f)
    g, h = minmax(g, h)
    i, j = minmax(i, j)
    k, l = minmax(k, l)
    m, n = minmax(m, n)
    o, p = minmax(o, p)

    a, c = minmax(a, c)
    e, g = minmax(e, g)
    i, k = minmax(i, k)
    m, o = minmax(m, o)
    b, d = minmax(b, d)
    f, h = minmax(f, h)
    j, l = minmax(j, l)
    n, p = minmax(n, p)

    a, e = minmax(a, e)
    i, m = minmax(i, m)
    b, f = minmax(b, f)
    j, n = minmax(j, n)
    c, g = minmax(c, g)
    k, o = minmax(k, o)
    d, h = minmax(d, h)
    l, p = minmax(l, p)

    a, i = minmax(a, i)
    b, j = minmax(b, j)
    c, k = minmax(c, k)
    d, l = minmax(d, l)
    e, m = minmax(e, m)
    f, n = minmax(f, n)
    g, o = minmax(g, o)
    h, p = minmax(h, p)

    f, k = minmax(f, k)
    g, j = minmax(g, j)
    d, m = minmax(d, m)
    n, o = minmax(n, o)
    h, l = minmax(h, l)
    b, c = minmax(b, c)
    e, i = minmax(e, i)

    b, e = minmax(b, e)
    h, n = minmax(h, n)
    c, i = minmax(c, i)
    l, o = minmax(l, o)
    f, g = minmax(f, g)
    j, k = minmax(j, k)

    c, e = minmax(c, e)
    l, n = minmax(l, n)
    d, i = minmax(d, i)
    h, m = minmax(h, m)

    g, i = minmax(g, i)
    k, m = minmax(k, m)
    d, f = minmax(d, f)
    h, j = minmax(h, j)

    d, e = minmax(d, e)
    f, g = minmax(f, g)
    h, i = minmax(h, i)
    j, k = minmax(j, k)
    l, m = minmax(l, m)

    g, h = minmax(g, h)
    i, j = minmax(i, j)

    return a,b,c,d,e,f,g,h,i,j,k
end

#=
sort 17 values
=#

#=
sort 18 values
=#

function sort(a::T,b::T,c::T,d::T,e::T,f::T,g::T,h::T,i::T,j::T,
              k::T,l::T,m::T,n::T,o::T,p::T,q::T,r::T,s::T,t::T,
              u::T) where T

    a, b = minmax(a, b)
    c, d = minmax(c, d)
    e, f = minmax(e, f)
    h, i = minmax(h, i)
    j, k = minmax(j, k)
    l, m = minmax(l, m)
    n, o = minmax(n, o)
    q, r = minmax(q, r)

    a, c = minmax(a, c)
    b, d = minmax(b, d)
    g, i = minmax(g, i)
    j, l = minmax(j, l)
    k, m = minmax(k, m)
    p, r = minmax(p, r)

    b, c = minmax(b, c)
    g, h = minmax(g, h)
    f, i = minmax(f, i)
    k, l = minmax(k, l)
    p, q = minmax(p, q)
    o, r = minmax(o, r)

    e, h = minmax(e, h)
    d, i = minmax(d, i)
    n, q = minmax(n, q)
    m, r = minmax(m, r)

    e, g = minmax(e, g)
    f, h = minmax(f, h)
    n, p = minmax(n, p)
    o, q = minmax(o, q)
    i, r = minmax(i, r)

    f, g = minmax(f, g)
    c, h = minmax(c, h)
    o, p = minmax(o, p)
    l, q = minmax(l, q)

    a, f = minmax(a, f)
    b, g = minmax(b, g)
    d, h = minmax(d, h)
    j, o = minmax(j, o)
    k, p = minmax(k, p)
    m, q = minmax(m, q)

    a, e = minmax(a, e)
    b, f = minmax(b, f)
    d, g = minmax(d, g)
    j, n = minmax(j, n)
    k, o = minmax(k, o)
    m, p = minmax(m, p)
    h, q = minmax(h, q)

    b, e = minmax(b, e)
    c, f = minmax(c, f)
    k, n = minmax(k, n)
    l, o = minmax(l, o)
    a, j = minmax(a, j)
    g, p = minmax(g, p)
    i, q = minmax(i, q)

    c, e = minmax(c, e)
    d, f = minmax(d, f)
    l, n = minmax(l, n)
    m, o = minmax(m, o)
    b, k = minmax(b, k)
    h, p = minmax(h, p)

    d, e = minmax(d, e)
    m, n = minmax(m, n)
    b, j = minmax(b, j)
    c, l = minmax(c, l)
    f, o = minmax(f, o)
    i, p = minmax(i, p)

    d, m = minmax(d, m)
    c, j = minmax(c, j)
    e, n = minmax(e, n)
    h, o = minmax(h, o)

    d, l = minmax(d, l)
    f, n = minmax(f, n)
    i, o = minmax(i, o)

    d, k = minmax(d, k)
    g, n = minmax(g, n)

    d, j = minmax(d, j)
    h, n = minmax(h, n)
    f, k = minmax(f, k)
    g, l = minmax(g, l)

    i, n = minmax(i, n)
    e, j = minmax(e, j)
    h, m = minmax(h, m)

    f, j = minmax(f, j)
    i, m = minmax(i, m)
    h, l = minmax(h, l)

    i, l = minmax(i, l)
    g, j = minmax(g, j)
    h, k = minmax(h, k)

    i, k = minmax(i, k)
    h, j = minmax(h, j)

    i, j = minmax(i, j)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u
end

#=
sort 19 values
=#


#=
sort 20 values
=#

function sort(a::T,b::T,c::T,d::T,e::T,f::T,g::T,h::T,i::T,j::T,
              k::T,l::T,m::T,n::T,o::T,p::T,q::T,r::T,s::T,t::T,
              u::T,v::T) where T

    a, b = minmax(a, b)
    d, e = minmax(d, e)
    f, g = minmax(f, g)
    i, j = minmax(i, j)
    k, l = minmax(k, l)
    n, o = minmax(n, o)
    p, q = minmax(p, q)
    s, t = minmax(s, t)

    c, e = minmax(c, e)
    h, j = minmax(h, j)
    m, o = minmax(m, o)
    r, t = minmax(r, t)

    c, d = minmax(c, d)
    b, e = minmax(b, e)
    h, i = minmax(h, i)
    g, j = minmax(g, j)
    m, n = minmax(m, n)
    l, o = minmax(l, o)
    r, s = minmax(r, s)
    q, t = minmax(q, t)

    a, d = minmax(a, d)
    f, i = minmax(f, i)
    e, j = minmax(e, j)
    k, n = minmax(k, n)
    p, s = minmax(p, s)
    o, t = minmax(o, t)

    a, c = minmax(a, c)
    b, d = minmax(b, d)
    f, h = minmax(f, h)
    g, i = minmax(g, i)
    k, m = minmax(k, m)
    l, n = minmax(l, n)
    p, r = minmax(p, r)
    q, s = minmax(q, s)
    j, t = minmax(j, t)

    b, c = minmax(b, c)
    g, h = minmax(g, h)
    a, f = minmax(a, f)
    d, i = minmax(d, i)
    l, m = minmax(l, m)
    q, r = minmax(q, r)
    k, p = minmax(k, p)
    n, s = minmax(n, s)

    b, g = minmax(b, g)
    c, h = minmax(c, h)
    e, i = minmax(e, i)
    l, q = minmax(l, q)
    m, r = minmax(m, r)
    o, s = minmax(o, s)
    a, k = minmax(a, k)

    b, f = minmax(b, f)
    d, h = minmax(d, h)
    l, p = minmax(l, p)
    n, r = minmax(n, r)
    i, s = minmax(i, s)

    e, h = minmax(e, h)
    c, f = minmax(c, f)
    d, g = minmax(d, g)
    o, r = minmax(o, r)
    m, p = minmax(m, p)
    n, q = minmax(n, q)
    b, l = minmax(b, l)
    j, s = minmax(j, s)

    e, g = minmax(e, g)
    d, f = minmax(d, f)
    o, q = minmax(o, q)
    n, p = minmax(n, p)
    b, k = minmax(b, k)
    c, m = minmax(c, m)
    h, r = minmax(h, r)

    e, f = minmax(e, f)
    o, p = minmax(o, p)
    d, n = minmax(d, n)
    c, k = minmax(c, k)
    g, q = minmax(g, q)
    i, r = minmax(i, r)

    e, o = minmax(e, o)
    d, m = minmax(d, m)
    f, p = minmax(f, p)
    j, r = minmax(j, r)
    i, q = minmax(i, q)

    e, n = minmax(e, n)
    d, l = minmax(d, l)
    g, p = minmax(g, p)
    j, q = minmax(j, q)

    e, m = minmax(e, m)
    d, k = minmax(d, k)
    h, p = minmax(h, p)

    e, l = minmax(e, l)
    i, p = minmax(i, p)
    h, m = minmax(h, m)

    e, k = minmax(e, k)
    j, p = minmax(j, p)
    g, l = minmax(g, l)
    i, n = minmax(i, n)

    f, k = minmax(f, k)
    j, o = minmax(j, o)
    i, m = minmax(i, m)

    g, k = minmax(g, k)
    j, n = minmax(j, n)
    i, l = minmax(i, l)

    j, m = minmax(j, m)
    h, k = minmax(h, k)

    j, l = minmax(j, l)
    i, k = minmax(i, k)

    j, k = minmax(j, k)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v
end


#=
sort 21 values
=#

function sort(a::T,b::T,c::T,d::T,e::T,f::T,g::T,h::T,i::T,j::T,
              k::T,l::T,m::T,n::T,o::T,p::T,q::T,r::T,s::T,t::T,
              u::T) where T

    a, b = minmax(a, b)
    d, e = minmax(d, e)
    f, g = minmax(f, g)
    i, j = minmax(i, j)
    k, l = minmax(k, l)
    n, o = minmax(n, o)
    q, r = minmax(q, r)
    t, u = minmax(t, u)
    
    c, e = minmax(c, e)
    h, j = minmax(h, j)
    m, o = minmax(m, o)
    p, r = minmax(p, r)
    s, u = minmax(s, u)
    
    c, d = minmax(c, d)
    b, e = minmax(b, e)
    h, i = minmax(h, i)
    g, j = minmax(g, j)
    m, n = minmax(m, n)
    l, o = minmax(l, o)
    p, q = minmax(p, q)
    s, t = minmax(s, t)
    r, u = minmax(r, u)
    
    a, d = minmax(a, d)
    f, i = minmax(f, i)
    e, j = minmax(e, j)
    k, n = minmax(k, n)
    p, s = minmax(p, s)
    q, t = minmax(q, t)
    o, u = minmax(o, u)
    
    a, c = minmax(a, c)
    b, d = minmax(b, d)
    f, h = minmax(f, h)
    g, i = minmax(g, i)
    k, m = minmax(k, m)
    l, n = minmax(l, n)
    r, t = minmax(r, t)
    q, s = minmax(q, s)
    j, u = minmax(j, u)
    
    b, c = minmax(b, c)
    g, h = minmax(g, h)
    a, f = minmax(a, f)
    d, i = minmax(d, i)
    l, m = minmax(l, m)
    r, s = minmax(r, s)
    k, q = minmax(k, q)
    n, t = minmax(n, t)
    
    b, g = minmax(b, g)
    c, h = minmax(c, h)
    e, i = minmax(e, i)
    k, p = minmax(k, p)
    l, r = minmax(l, r)
    m, s = minmax(m, s)
    o, t = minmax(o, t)
    
    b, f = minmax(b, f)
    d, h = minmax(d, h)
    l, q = minmax(l, q)
    n, s = minmax(n, s)
    i, t = minmax(i, t)
    
    e, h = minmax(e, h)
    c, f = minmax(c, f)
    d, g = minmax(d, g)
    l, p = minmax(l, p)
    o, s = minmax(o, s)
    n, q = minmax(n, q)
    j, t = minmax(j, t)
    
    e, g = minmax(e, g)
    d, f = minmax(d, f)
    m, p = minmax(m, p)
    o, r = minmax(o, r)
    a, l = minmax(a, l)
    h, s = minmax(h, s)
    
    e, f = minmax(e, f)
    o, q = minmax(o, q)
    n, p = minmax(n, p)
    a, k = minmax(a, k)
    b, m = minmax(b, m)
    g, r = minmax(g, r)
    i, s = minmax(i, s)
    
    o, p = minmax(o, p)
    b, l = minmax(b, l)
    c, n = minmax(c, n)
    f, q = minmax(f, q)
    j, s = minmax(j, s)
    i, r = minmax(i, r)
    
    b, k = minmax(b, k)
    d, o = minmax(d, o)
    e, p = minmax(e, p)
    g, q = minmax(g, q)
    j, r = minmax(j, r)
    
    e, o = minmax(e, o)
    d, n = minmax(d, n)
    c, k = minmax(c, k)
    h, q = minmax(h, q)
    
    e, n = minmax(e, n)
    d, l = minmax(d, l)
    i, q = minmax(i, q)
    
    e, m = minmax(e, m)
    d, k = minmax(d, k)
    j, q = minmax(j, q)
    h, n = minmax(h, n)
    i, o = minmax(i, o)
    
    e, l = minmax(e, l)
    g, m = minmax(g, m)
    j, p = minmax(j, p)
    i, n = minmax(i, n)
    
    e, k = minmax(e, k)
    f, l = minmax(f, l)
    j, o = minmax(j, o)
    
    f, k = minmax(f, k)
    g, l = minmax(g, l)
    j, n = minmax(j, n)
    
    g, k = minmax(g, k)
    i, l = minmax(i, l)
    j, m = minmax(j, m)
    
    h, k = minmax(h, k)
    j, l = minmax(j, l)
    
    i, k = minmax(i, k)
    
    j, k = minmax(j, k)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u

end

#=
sort 22 values
=#

function sort(a::T,b::T,c::T,d::T,e::T,f::T,g::T,h::T,i::T,j::T,
              k::T,l::T,m::T,n::T,o::T,p::T,q::T,r::T,s::T,t::T,
              u::T,v::T,w::T,x::T) where T

    a, b = minmax(a, b)
    d, e = minmax(d, e)
    g, h = minmax(g, h)
    j, k = minmax(j, k)
    l, m = minmax(l, m)
    o, p = minmax(o, p)
    r, s = minmax(r, s)
    u, v = minmax(u, v)

    c, e = minmax(c, e)
    f, h = minmax(f, h)
    i, k = minmax(i, k)
    n, p = minmax(n, p)
    q, s = minmax(q, s)
    t, v = minmax(t, v)

    c, d = minmax(c, d)
    b, e = minmax(b, e)
    f, g = minmax(f, g)
    i, j = minmax(i, j)
    h, k = minmax(h, k)
    n, o = minmax(n, o)
    m, p = minmax(m, p)
    q, r = minmax(q, r)
    t, u = minmax(t, u)
    s, v = minmax(s, v)

    a, d = minmax(a, d)
    f, i = minmax(f, i)
    g, j = minmax(g, j)
    e, k = minmax(e, k)
    l, o = minmax(l, o)
    q, t = minmax(q, t)
    r, u = minmax(r, u)
    p, v = minmax(p, v)

    a, c = minmax(a, c)
    b, d = minmax(b, d)
    h, j = minmax(h, j)
    g, i = minmax(g, i)
    l, n = minmax(l, n)
    m, o = minmax(m, o)
    s, u = minmax(s, u)
    r, t = minmax(r, t)
    k, v = minmax(k, v)

    b, c = minmax(b, c)
    h, i = minmax(h, i)
    a, g = minmax(a, g)
    d, j = minmax(d, j)
    m, n = minmax(m, n)
    s, t = minmax(s, t)
    l, r = minmax(l, r)
    o, u = minmax(o, u)

    a, f = minmax(a, f)
    b, h = minmax(b, h)
    c, i = minmax(c, i)
    e, j = minmax(e, j)
    l, q = minmax(l, q)
    m, s = minmax(m, s)
    n, t = minmax(n, t)
    p, u = minmax(p, u)

    b, g = minmax(b, g)
    d, i = minmax(d, i)
    m, r = minmax(m, r)
    o, t = minmax(o, t)
    a, l = minmax(a, l)
    j, u = minmax(j, u)

    b, f = minmax(b, f)
    e, i = minmax(e, i)
    d, g = minmax(d, g)
    m, q = minmax(m, q)
    p, t = minmax(p, t)
    o, r = minmax(o, r)
    k, u = minmax(k, u)

    c, f = minmax(c, f)
    e, h = minmax(e, h)
    n, q = minmax(n, q)
    p, s = minmax(p, s)
    b, m = minmax(b, m)
    i, t = minmax(i, t)

    e, g = minmax(e, g)
    d, f = minmax(d, f)
    p, r = minmax(p, r)
    o, q = minmax(o, q)
    b, l = minmax(b, l)
    c, n = minmax(c, n)
    h, s = minmax(h, s)
    j, t = minmax(j, t)

    e, f = minmax(e, f)
    p, q = minmax(p, q)
    d, o = minmax(d, o)
    c, l = minmax(c, l)
    g, r = minmax(g, r)
    k, t = minmax(k, t)

    e, p = minmax(e, p)
    d, n = minmax(d, n)
    f, q = minmax(f, q)
    h, r = minmax(h, r)
    k, s = minmax(k, s)

    e, o = minmax(e, o)
    d, m = minmax(d, m)
    g, q = minmax(g, q)
    j, r = minmax(j, r)

    e, n = minmax(e, n)
    d, l = minmax(d, l)
    h, q = minmax(h, q)
    k, r = minmax(k, r)

    e, m = minmax(e, m)
    i, q = minmax(i, q)
    h, n = minmax(h, n)

    e, l = minmax(e, l)
    j, q = minmax(j, q)
    g, m = minmax(g, m)
    i, o = minmax(i, o)

    k, q = minmax(k, q)
    f, l = minmax(f, l)
    h, m = minmax(h, m)
    j, p = minmax(j, p)

    g, l = minmax(g, l)
    k, p = minmax(k, p)
    j, o = minmax(j, o)

    h, l = minmax(h, l)
    k, o = minmax(k, o)
    j, m = minmax(j, m)

    i, l = minmax(i, l)
    k, n = minmax(k, n)

    k, m = minmax(k, m)
    j, l = minmax(j, l)

    k, l = minmax(k, l)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x
end


#=
sort 23 values
=#


#=
sort 24 values
=#
function sort(a::T,b::T,c::T,d::T,e::T,f::T,g::T,h::T,i::T,j::T,
              k::T,l::T,m::T,n::T,o::T,p::T,q::T,r::T,s::T,t::T,
              u::T,v::T,w::T,x::T,y::T) where T

    b, c = minmax(b, c)
    e, f = minmax(e, f)
    h, i = minmax(h, i)
    k, l = minmax(k, l)
    n, o = minmax(n, o)
    q, r = minmax(q, r)
    t, u = minmax(t, u)
    w, x = minmax(w, x)

    a, c = minmax(a, c)
    d, f = minmax(d, f)
    g, i = minmax(g, i)
    j, l = minmax(j, l)
    m, o = minmax(m, o)
    p, r = minmax(p, r)
    s, u = minmax(s, u)
    v, x = minmax(v, x)

    a, b = minmax(a, b)
    d, e = minmax(d, e)
    c, f = minmax(c, f)
    g, h = minmax(g, h)
    j, k = minmax(j, k)
    i, l = minmax(i, l)
    m, n = minmax(m, n)
    p, q = minmax(p, q)
    o, r = minmax(o, r)
    s, t = minmax(s, t)
    v, w = minmax(v, w)
    u, x = minmax(u, x)

    a, d = minmax(a, d)
    b, e = minmax(b, e)
    g, j = minmax(g, j)
    h, k = minmax(h, k)
    f, l = minmax(f, l)
    m, p = minmax(m, p)
    n, q = minmax(n, q)
    s, v = minmax(s, v)
    t, w = minmax(t, w)
    r, x = minmax(r, x)

    c, e = minmax(c, e)
    b, d = minmax(b, d)
    i, k = minmax(i, k)
    h, j = minmax(h, j)
    a, g = minmax(a, g)
    o, q = minmax(o, q)
    n, p = minmax(n, p)
    u, w = minmax(u, w)
    t, v = minmax(t, v)
    m, s = minmax(m, s)
    l, x = minmax(l, x)

    c, d = minmax(c, d)
    i, j = minmax(i, j)
    b, h = minmax(b, h)
    e, k = minmax(e, k)
    o, p = minmax(o, p)
    u, v = minmax(u, v)
    n, t = minmax(n, t)
    q, w = minmax(q, w)
    a, m = minmax(a, m)

    c, i = minmax(c, i)
    b, g = minmax(b, g)
    d, j = minmax(d, j)
    f, k = minmax(f, k)
    o, u = minmax(o, u)
    n, s = minmax(n, s)
    p, v = minmax(p, v)
    r, w = minmax(r, w)

    c, h = minmax(c, h)
    e, j = minmax(e, j)
    o, t = minmax(o, t)
    q, v = minmax(q, v)
    b, n = minmax(b, n)
    k, w = minmax(k, w)

    c, g = minmax(c, g)
    f, j = minmax(f, j)
    e, h = minmax(e, h)
    o, s = minmax(o, s)
    r, v = minmax(r, v)
    q, t = minmax(q, t)
    b, m = minmax(b, m)
    l, w = minmax(l, w)

    d, g = minmax(d, g)
    f, i = minmax(f, i)
    p, s = minmax(p, s)
    r, u = minmax(r, u)
    c, o = minmax(c, o)
    j, v = minmax(j, v)

    f, h = minmax(f, h)
    e, g = minmax(e, g)
    r, t = minmax(r, t)
    q, s = minmax(q, s)
    c, n = minmax(c, n)
    d, p = minmax(d, p)
    i, u = minmax(i, u)
    k, v = minmax(k, v)

    f, g = minmax(f, g)
    r, s = minmax(r, s)
    c, m = minmax(c, m)
    e, q = minmax(e, q)
    h, t = minmax(h, t)
    l, v = minmax(l, v)

    f, r = minmax(f, r)
    e, p = minmax(e, p)
    d, m = minmax(d, m)
    g, s = minmax(g, s)
    i, t = minmax(i, t)
    l, u = minmax(l, u)

    f, q = minmax(f, q)
    e, n = minmax(e, n)
    h, s = minmax(h, s)
    k, t = minmax(k, t)

    f, p = minmax(f, p)
    e, m = minmax(e, m)
    i, s = minmax(i, s)
    l, t = minmax(l, t)

    f, o = minmax(f, o)
    j, s = minmax(j, s)

    f, n = minmax(f, n)
    k, s = minmax(k, s)
    i, o = minmax(i, o)
    j, p = minmax(j, p)

    f, m = minmax(f, m)
    l, s = minmax(l, s)
    h, n = minmax(h, n)
    k, q = minmax(k, q)

    g, m = minmax(g, m)
    i, n = minmax(i, n)
    l, r = minmax(l, r)
    k, p = minmax(k, p)

    h, m = minmax(h, m)
    l, q = minmax(l, q)
    k, n = minmax(k, n)

    i, m = minmax(i, m)
    l, p = minmax(l, p)

    j, m = minmax(j, m)
    l, o = minmax(l, o)

    l, n = minmax(l, n)
    k, m = minmax(k, m)

    l, m = minmax(l, m)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y
end

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 

for N in collect(MIN_ITEMS:MAX_ITEMS)
   @eval sort(x::NTuple{$N, T}) where T = sort(x...)
end   

function sort(v::Vector{T}) where T
   return if MIN_ITEMS <= length(v) <= MAX_ITEMS
              [sort(v...)...]
          else
              sort(v, rev=false)
          end
end

if isdefined(:StaticArrays)   
  function sort(sv::SVector)
     n = length(sv)
     return if MIN_ITEMS <= n <= MAX_ITEMS
                SVector{n}( sort(x.data)... )
            else
                sort(v, rev=false)
            end
  end
end

end # module TinySorts

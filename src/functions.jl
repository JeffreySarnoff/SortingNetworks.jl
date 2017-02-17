#=
    Sorting networks that process 1,2,..25 values are given.

    These sorting networks should minimize conditional swaps.  
    The first sixteen are known to minimize conditional swaps.  
    
    Functions are written with groups of internally parallelizable  
    statements given together and sequential steps are separated.  

    `sort(x1::T, .., xn::T)::NTuple{n,T}`
    `sort(tup::NTuple{n,T})::NTuple{n,T}`
    
    networks were selected using software by John Gamble
        http://pages.ripco.net/~jgamble/nw.html
        http://search.cpan.org/dist/Algorithm-Networksort/
=#

const NARGS_MIN = 1
const NARGS_MAX = 25

#=
   sort NTuples of 1..25 values
=#

for N in collect(NARGS_MIN:NARGS_MAX)
    @eval (sort(x::NTuple{$N, T})) = sort(x...)
end


#    sort 1 value with 0 minmaxs in 1 stage

function sort{T}(a::T)

    return (a,)
end

#    sort 2 values with 1 minmaxs in 1 stage

function sort{T}(a::T, b::T)

    a, b = minmax(a, b)

    return a,b
end

#    sort 3 values with 3 minmaxs in 3 parallel stages

function sort{T}(a::T, b::T, c::T)

    b, c = minmax(b, c)

    a, c = minmax(a, c)

    a, b = minmax(a, b)

    return a, b, c
end

#    sort 4 values with 5 minmaxs in 3 parallel stages

function sort{T}(a::T, b::T, c::T, d::T)

    a, b = minmax(a, b)
    c, d = minmax(c, d)

    a, c = minmax(a, c)
    b, d = minmax(b, d)

    b, c = minmax(b, c)

    return a, b, c, d
end

#    sort 5 values with 9 minmaxs in 5 parallel stages

  function sort{T}(a::T, b::T, c::T, d::T, e::T)

    a, e = minmax(a, e)
    b, d = minmax(b, d)

    a, c = minmax(a, c)

    c, e = minmax(c, e)
    a, b = minmax(a, b)

    b, c = minmax(b, c)
    d, e = minmax(d, e)

    return a, b, c, d, e
end

#    sort 6 values with 12 minmaxs in 6 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T)

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

#    sort 7 values with 16 minmaxs in 6 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T)

    a, e = minmax(a, e)
    b, f = minmax(b, f)
    c, g = minmax(c, g)

    a, c = minmax(a, c)
    b, d = minmax(b, d)
    e, g = minmax(e, g)

    c, e = minmax(c, e)
    d, f = minmax(d, f)
    a, b = minmax(a, b)

    c, d = minmax(c, d)
    e, f = minmax(e, f)

    b, e = minmax(b, e)
    d, g = minmax(d, g)

    b, c = minmax(b, c)
    d, e = minmax(d, e)
    f, g = minmax(f, g)

    return a, b, c, d, e, f, g
end

#    sort 8 values with 19 minmaxs in 7 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T)

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

#    sort 9 values with 25 minmaxs in 9 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T)

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

#    sort 10 values with 29 minmaxs in 9 parallel stages

function sort{T}(a::T,b::T,c::T,d::T,e::T,
              f::T,g::T,h::T,i::T,j::T)

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

#    sort 11 values with 35 minmaxs in 9 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T)

    a, b = minmax(a, b)
    c, d = minmax(c, d)
    e, f = minmax(e, f)
    g, h = minmax(g, h)
    i, j = minmax(i, j)

    b, d = minmax(b, d)
    f, h = minmax(f, h)
    a, c = minmax(a, c)
    e, g = minmax(e, g)
    i, k = minmax(i, k)

    b, c = minmax(b, c)
    f, g = minmax(f, g)
    j, k = minmax(j, k)
    a, e = minmax(a, e)
    d, h = minmax(d, h)

    b, f = minmax(b, f)
    g, k = minmax(g, k)
    e, i = minmax(e, i)

    f, j = minmax(f, j)
    c, g = minmax(c, g)
    a, e = minmax(a, e)
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

    return a,b,c,d,e,f,g,h,i,j,k
end

#    sort 12 values with 39 minmaxs in 9 parallel stages

function sort{T}(a::T,b::T,c::T,d::T,e::T,
              f::T,g::T,h::T,i::T,j::T,
              k::T,l::T)

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

    return a,b,c,d,e,f,g,h,i,j,k,l
end

#    sort 13 values with 45 minmaxs in 10 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T)

    b, h = minmax(b, h)
    j, l = minmax(j, l)
    d, e = minmax(d, e)
    f, i = minmax(f, i)
    a, m = minmax(a, m)
    c, g = minmax(c, g)

    a, b = minmax(a, b)
    c, d = minmax(c, d)
    e, g = minmax(e, g)
    i, l = minmax(i, l)
    h, m = minmax(h, m)
    f, j = minmax(f, j)

    a, c = minmax(a, c)
    d, h = minmax(d, h)
    k, l = minmax(k, l)
    b, e = minmax(b, e)
    g, m = minmax(g, m)

    h, i = minmax(h, i)
    l, m = minmax(l, m)
    e, j = minmax(e, j)
    g, k = minmax(g, k)

    d, e = minmax(d, e)
    f, g = minmax(f, g)
    i, j = minmax(i, j)
    k, l = minmax(k, l)
    b, h = minmax(b, h)

    c, g = minmax(c, g)
    j, l = minmax(j, l)
    b, d = minmax(b, d)
    e, h = minmax(e, h)
    i, k = minmax(i, k)
    a, f = minmax(a, f)

    c, f = minmax(c, f)
    g, i = minmax(g, i)
    j, k = minmax(j, k)

    b, c = minmax(b, c)
    d, f = minmax(d, f)
    h, i = minmax(h, i)
    e, g = minmax(e, g)

    c, d = minmax(c, d)
    e, f = minmax(e, f)
    g, h = minmax(g, h)
    i, j = minmax(i, j)

    d, e = minmax(d, e)
    f, g = minmax(f, g)

    return a,b,c,d,e,f,g,h,i,j,k,l,m
end

#    sort 14 values with 51 minmaxs in 10 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T)

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

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n
end

#    sort 15 values with 56 minmaxs in 10 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T)

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
    m, o = minmax(m, o)
    b, d = minmax(b, d)
    f, h = minmax(f, h)
    j, l = minmax(j, l)

    a, e = minmax(a, e)
    i, m = minmax(i, m)
    b, f = minmax(b, f)
    j, n = minmax(j, n)
    c, g = minmax(c, g)
    k, o = minmax(k, o)
    d, h = minmax(d, h)

    a, i = minmax(a, i)
    b, j = minmax(b, j)
    c, k = minmax(c, k)
    d, l = minmax(d, l)
    e, m = minmax(e, m)
    f, n = minmax(f, n)
    g, o = minmax(g, o)

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

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o
end

#    sort 16 values with 60 minmaxs in 10 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T)

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

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p
end




#=
    sorting networks for 17..25 values
    using known compact realizations
=#


#    sort 17 values with 74 minmaxs in 12 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
                f::T, g::T, h::T, i::T, j::T,
                k::T, l::T, m::T, n::T, o::T,
                p::T, q::T)

    a, q = minmax(a, q)
    b, j = minmax(b, j)
    c, k = minmax(c, k)
    d, l = minmax(d, l)
    e, m = minmax(e, m)
    f, n = minmax(f, n)
    g, o = minmax(g, o)
    h, p = minmax(h, p)

    a, i = minmax(a, i)
    b, f = minmax(b, f)
    c, g = minmax(c, g)
    d, h = minmax(d, h)
    j, n = minmax(j, n)
    k, o = minmax(k, o)
    l, p = minmax(l, p)

    i, q = minmax(i, q)
    a, e = minmax(a, e)
    f, j = minmax(f, j)
    g, k = minmax(g, k)
    h, l = minmax(h, l)
    b, d = minmax(b, d)
    n, p = minmax(n, p)

    i, m = minmax(i, m)
    e, q = minmax(e, q)
    a, c = minmax(a, c)
    f, h = minmax(f, h)
    j, l = minmax(j, l)

    e, i = minmax(e, i)
    m, q = minmax(m, q)
    d, j = minmax(d, j)
    h, n = minmax(h, n)
    a, b = minmax(a, b)

    e, g = minmax(e, g)
    i, k = minmax(i, k)
    m, o = minmax(m, o)
    c, q = minmax(c, q)
    d, f = minmax(d, f)
    h, j = minmax(h, j)
    l, n = minmax(l, n)

    c, i = minmax(c, i)
    g, m = minmax(g, m)
    k, q = minmax(k, q)

    c, e = minmax(c, e)
    g, i = minmax(g, i)
    k, m = minmax(k, m)
    o, q = minmax(o, q)

    c, d = minmax(c, d)
    e, f = minmax(e, f)
    g, h = minmax(g, h)
    i, j = minmax(i, j)
    k, l = minmax(k, l)
    m, n = minmax(m, n)
    o, p = minmax(o, p)
    b, q = minmax(b, q)

    b, i = minmax(b, i)
    d, k = minmax(d, k)
    f, m = minmax(f, m)
    h, o = minmax(h, o)
    j, q = minmax(j, q)

    b, e = minmax(b, e)
    d, g = minmax(d, g)
    f, i = minmax(f, i)
    h, k = minmax(h, k)
    j, m = minmax(j, m)
    l, o = minmax(l, o)
    n, q = minmax(n, q)

    b, c = minmax(b, c)
    d, e = minmax(d, e)
    f, g = minmax(f, g)
    h, i = minmax(h, i)
    j, k = minmax(j, k)
    l, m = minmax(l, m)
    n, o = minmax(n, o)
    p, q = minmax(p, q)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q
end

#    sort 18 values with 82 minmaxs in 13 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T)

    a, q = minmax(a, q)
    b, r = minmax(b, r)
    c, k = minmax(c, k)
    d, l = minmax(d, l)
    e, m = minmax(e, m)
    f, n = minmax(f, n)
    g, o = minmax(g, o)
    h, p = minmax(h, p)

    a, i = minmax(a, i)
    b, j = minmax(b, j)
    c, g = minmax(c, g)
    d, h = minmax(d, h)
    k, o = minmax(k, o)
    l, p = minmax(l, p)

    i, q = minmax(i, q)
    j, r = minmax(j, r)
    a, e = minmax(a, e)
    b, f = minmax(b, f)
    g, k = minmax(g, k)
    h, l = minmax(h, l)

    i, m = minmax(i, m)
    j, n = minmax(j, n)
    e, q = minmax(e, q)
    f, r = minmax(f, r)
    a, c = minmax(a, c)
    b, d = minmax(b, d)

    e, i = minmax(e, i)
    f, j = minmax(f, j)
    m, q = minmax(m, q)
    n, r = minmax(n, r)
    a, b = minmax(a, b)

    e, g = minmax(e, g)
    f, h = minmax(f, h)
    i, k = minmax(i, k)
    j, l = minmax(j, l)
    m, o = minmax(m, o)
    n, p = minmax(n, p)
    c, q = minmax(c, q)
    d, r = minmax(d, r)

    c, i = minmax(c, i)
    d, j = minmax(d, j)
    g, m = minmax(g, m)
    h, n = minmax(h, n)
    k, q = minmax(k, q)
    l, r = minmax(l, r)

    c, e = minmax(c, e)
    d, f = minmax(d, f)
    g, i = minmax(g, i)
    h, j = minmax(h, j)
    k, m = minmax(k, m)
    l, n = minmax(l, n)
    o, q = minmax(o, q)
    p, r = minmax(p, r)

    c, d = minmax(c, d)
    e, f = minmax(e, f)
    g, h = minmax(g, h)
    i, j = minmax(i, j)
    k, l = minmax(k, l)
    m, n = minmax(m, n)
    o, p = minmax(o, p)
    q, r = minmax(q, r)

    b, q = minmax(b, q)
    d, k = minmax(d, k)
    f, m = minmax(f, m)
    h, o = minmax(h, o)

    b, i = minmax(b, i)
    j, q = minmax(j, q)
    d, g = minmax(d, g)
    h, k = minmax(h, k)
    l, o = minmax(l, o)

    b, e = minmax(b, e)
    f, i = minmax(f, i)
    j, m = minmax(j, m)
    n, q = minmax(n, q)

    b, c = minmax(b, c)
    d, e = minmax(d, e)
    f, g = minmax(f, g)
    h, i = minmax(h, i)
    j, k = minmax(j, k)
    l, m = minmax(l, m)
    n, o = minmax(n, o)
    p, q = minmax(p, q)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r
end

#    sort 19 values with 91 minmaxs in 14 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T)

    a, q = minmax(a, q)
    b, r = minmax(b, r)
    c, s = minmax(c, s)
    d, l = minmax(d, l)
    e, m = minmax(e, m)
    f, n = minmax(f, n)
    g, o = minmax(g, o)
    h, p = minmax(h, p)

    a, i = minmax(a, i)
    b, j = minmax(b, j)
    c, k = minmax(c, k)
    d, h = minmax(d, h)
    l, p = minmax(l, p)

    i, q = minmax(i, q)
    j, r = minmax(j, r)
    k, s = minmax(k, s)
    a, e = minmax(a, e)
    b, f = minmax(b, f)
    c, g = minmax(c, g)
    h, l = minmax(h, l)

    i, m = minmax(i, m)
    j, n = minmax(j, n)
    k, o = minmax(k, o)
    e, q = minmax(e, q)
    f, r = minmax(f, r)
    g, s = minmax(g, s)
    a, c = minmax(a, c)
    b, d = minmax(b, d)

    e, i = minmax(e, i)
    f, j = minmax(f, j)
    g, k = minmax(g, k)
    m, q = minmax(m, q)
    n, r = minmax(n, r)
    o, s = minmax(o, s)
    a, b = minmax(a, b)

    e, g = minmax(e, g)
    f, h = minmax(f, h)
    i, k = minmax(i, k)
    j, l = minmax(j, l)
    m, o = minmax(m, o)
    n, p = minmax(n, p)
    q, s = minmax(q, s)
    d, r = minmax(d, r)

    c, q = minmax(c, q)
    d, j = minmax(d, j)
    g, m = minmax(g, m)
    h, n = minmax(h, n)
    l, r = minmax(l, r)

    c, i = minmax(c, i)
    k, q = minmax(k, q)
    d, f = minmax(d, f)
    h, j = minmax(h, j)
    l, n = minmax(l, n)
    p, r = minmax(p, r)

    c, e = minmax(c, e)
    g, i = minmax(g, i)
    k, m = minmax(k, m)
    o, q = minmax(o, q)

    c, d = minmax(c, d)
    e, f = minmax(e, f)
    g, h = minmax(g, h)
    i, j = minmax(i, j)
    k, l = minmax(k, l)
    m, n = minmax(m, n)
    o, p = minmax(o, p)
    q, r = minmax(q, r)

    b, q = minmax(b, q)
    d, s = minmax(d, s)
    f, m = minmax(f, m)
    h, o = minmax(h, o)

    b, i = minmax(b, i)
    d, k = minmax(d, k)
    j, q = minmax(j, q)
    l, s = minmax(l, s)

    b, e = minmax(b, e)
    d, g = minmax(d, g)
    f, i = minmax(f, i)
    h, k = minmax(h, k)
    j, m = minmax(j, m)
    l, o = minmax(l, o)
    n, q = minmax(n, q)
    p, s = minmax(p, s)

    b, c = minmax(b, c)
    d, e = minmax(d, e)
    f, g = minmax(f, g)
    h, i = minmax(h, i)
    j, k = minmax(j, k)
    l, m = minmax(l, m)
    n, o = minmax(n, o)
    p, q = minmax(p, q)
    r, s = minmax(r, s)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s
end

#    sort 20 values with 97 minmaxs in 14 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T)

    a, q = minmax(a, q)
    b, r = minmax(b, r)
    c, s = minmax(c, s)
    d, t = minmax(d, t)
    e, m = minmax(e, m)
    f, n = minmax(f, n)
    g, o = minmax(g, o)
    h, p = minmax(h, p)

    a, i = minmax(a, i)
    b, j = minmax(b, j)
    c, k = minmax(c, k)
    d, l = minmax(d, l)

    i, q = minmax(i, q)
    j, r = minmax(j, r)
    k, s = minmax(k, s)
    l, t = minmax(l, t)
    a, e = minmax(a, e)
    b, f = minmax(b, f)
    c, g = minmax(c, g)
    d, h = minmax(d, h)

    i, m = minmax(i, m)
    j, n = minmax(j, n)
    k, o = minmax(k, o)
    l, p = minmax(l, p)
    e, q = minmax(e, q)
    f, r = minmax(f, r)
    g, s = minmax(g, s)
    h, t = minmax(h, t)
    a, c = minmax(a, c)
    b, d = minmax(b, d)

    e, i = minmax(e, i)
    f, j = minmax(f, j)
    g, k = minmax(g, k)
    h, l = minmax(h, l)
    m, q = minmax(m, q)
    n, r = minmax(n, r)
    o, s = minmax(o, s)
    p, t = minmax(p, t)
    a, b = minmax(a, b)

    e, g = minmax(e, g)
    f, h = minmax(f, h)
    i, k = minmax(i, k)
    j, l = minmax(j, l)
    m, o = minmax(m, o)
    n, p = minmax(n, p)
    q, s = minmax(q, s)
    r, t = minmax(r, t)

    c, q = minmax(c, q)
    d, r = minmax(d, r)
    g, m = minmax(g, m)
    h, n = minmax(h, n)
    s, t = minmax(s, t)

    c, i = minmax(c, i)
    d, j = minmax(d, j)
    k, q = minmax(k, q)
    l, r = minmax(l, r)

    c, e = minmax(c, e)
    d, f = minmax(d, f)
    g, i = minmax(g, i)
    h, j = minmax(h, j)
    k, m = minmax(k, m)
    l, n = minmax(l, n)
    o, q = minmax(o, q)
    p, r = minmax(p, r)

    c, d = minmax(c, d)
    e, f = minmax(e, f)
    g, h = minmax(g, h)
    i, j = minmax(i, j)
    k, l = minmax(k, l)
    m, n = minmax(m, n)
    o, p = minmax(o, p)
    q, r = minmax(q, r)

    b, q = minmax(b, q)
    d, s = minmax(d, s)
    f, m = minmax(f, m)
    h, o = minmax(h, o)

    b, i = minmax(b, i)
    d, k = minmax(d, k)
    j, q = minmax(j, q)
    l, s = minmax(l, s)

    b, e = minmax(b, e)
    d, g = minmax(d, g)
    f, i = minmax(f, i)
    h, k = minmax(h, k)
    j, m = minmax(j, m)
    l, o = minmax(l, o)
    n, q = minmax(n, q)
    p, s = minmax(p, s)

    b, c = minmax(b, c)
    d, e = minmax(d, e)
    f, g = minmax(f, g)
    h, i = minmax(h, i)
    j, k = minmax(j, k)
    l, m = minmax(l, m)
    n, o = minmax(n, o)
    p, q = minmax(p, q)
    r, s = minmax(r, s)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t
end

#    sort 21 values with 107 minmaxs in 15 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T)

    a, q = minmax(a, q)
    b, r = minmax(b, r)
    c, s = minmax(c, s)
    d, t = minmax(d, t)
    e, u = minmax(e, u)
    f, n = minmax(f, n)
    g, o = minmax(g, o)
    h, p = minmax(h, p)

    a, i = minmax(a, i)
    b, j = minmax(b, j)
    c, k = minmax(c, k)
    d, l = minmax(d, l)
    e, m = minmax(e, m)

    i, q = minmax(i, q)
    j, r = minmax(j, r)
    k, s = minmax(k, s)
    l, t = minmax(l, t)
    m, u = minmax(m, u)
    a, e = minmax(a, e)
    b, f = minmax(b, f)
    c, g = minmax(c, g)
    d, h = minmax(d, h)

    i, m = minmax(i, m)
    j, n = minmax(j, n)
    k, o = minmax(k, o)
    l, p = minmax(l, p)
    q, u = minmax(q, u)
    f, r = minmax(f, r)
    g, s = minmax(g, s)
    h, t = minmax(h, t)
    a, c = minmax(a, c)
    b, d = minmax(b, d)

    e, q = minmax(e, q)
    f, j = minmax(f, j)
    g, k = minmax(g, k)
    h, l = minmax(h, l)
    n, r = minmax(n, r)
    o, s = minmax(o, s)
    p, t = minmax(p, t)
    a, b = minmax(a, b)

    e, i = minmax(e, i)
    m, q = minmax(m, q)
    f, h = minmax(f, h)
    j, l = minmax(j, l)
    n, p = minmax(n, p)
    r, t = minmax(r, t)

    e, g = minmax(e, g)
    i, k = minmax(i, k)
    m, o = minmax(m, o)
    q, s = minmax(q, s)
    d, r = minmax(d, r)
    h, n = minmax(h, n)

    c, q = minmax(c, q)
    g, u = minmax(g, u)
    d, j = minmax(d, j)
    l, r = minmax(l, r)

    c, i = minmax(c, i)
    g, m = minmax(g, m)
    k, q = minmax(k, q)
    o, u = minmax(o, u)
    d, f = minmax(d, f)
    h, j = minmax(h, j)
    l, n = minmax(l, n)
    p, r = minmax(p, r)

    c, e = minmax(c, e)
    g, i = minmax(g, i)
    k, m = minmax(k, m)
    o, q = minmax(o, q)
    s, u = minmax(s, u)

    c, d = minmax(c, d)
    e, f = minmax(e, f)
    g, h = minmax(g, h)
    i, j = minmax(i, j)
    k, l = minmax(k, l)
    m, n = minmax(m, n)
    o, p = minmax(o, p)
    q, r = minmax(q, r)
    s, t = minmax(s, t)

    b, q = minmax(b, q)
    d, s = minmax(d, s)
    f, u = minmax(f, u)
    h, o = minmax(h, o)

    b, i = minmax(b, i)
    d, k = minmax(d, k)
    f, m = minmax(f, m)
    j, q = minmax(j, q)
    l, s = minmax(l, s)
    n, u = minmax(n, u)

    b, e = minmax(b, e)
    d, g = minmax(d, g)
    f, i = minmax(f, i)
    h, k = minmax(h, k)
    j, m = minmax(j, m)
    l, o = minmax(l, o)
    n, q = minmax(n, q)
    p, s = minmax(p, s)
    r, u = minmax(r, u)

    b, c = minmax(b, c)
    d, e = minmax(d, e)
    f, g = minmax(f, g)
    h, i = minmax(h, i)
    j, k = minmax(j, k)
    l, m = minmax(l, m)
    n, o = minmax(n, o)
    p, q = minmax(p, q)
    r, s = minmax(r, s)
    t, u = minmax(t, u)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u
end

#    sort 22 values with 114 minmaxs in 15 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T, v::T)

    a, q = minmax(a, q)
    b, r = minmax(b, r)
    c, s = minmax(c, s)
    d, t = minmax(d, t)
    e, u = minmax(e, u)
    f, v = minmax(f, v)
    g, o = minmax(g, o)
    h, p = minmax(h, p)

    a, i = minmax(a, i)
    b, j = minmax(b, j)
    c, k = minmax(c, k)
    d, l = minmax(d, l)
    e, m = minmax(e, m)
    f, n = minmax(f, n)

    i, q = minmax(i, q)
    j, r = minmax(j, r)
    k, s = minmax(k, s)
    l, t = minmax(l, t)
    m, u = minmax(m, u)
    n, v = minmax(n, v)
    a, e = minmax(a, e)
    b, f = minmax(b, f)
    c, g = minmax(c, g)
    d, h = minmax(d, h)

    i, m = minmax(i, m)
    j, n = minmax(j, n)
    k, o = minmax(k, o)
    l, p = minmax(l, p)
    q, u = minmax(q, u)
    r, v = minmax(r, v)
    g, s = minmax(g, s)
    h, t = minmax(h, t)
    a, c = minmax(a, c)
    b, d = minmax(b, d)

    e, q = minmax(e, q)
    f, r = minmax(f, r)
    g, k = minmax(g, k)
    h, l = minmax(h, l)
    o, s = minmax(o, s)
    p, t = minmax(p, t)
    a, b = minmax(a, b)

    e, i = minmax(e, i)
    f, j = minmax(f, j)
    m, q = minmax(m, q)
    n, r = minmax(n, r)

    e, g = minmax(e, g)
    f, h = minmax(f, h)
    i, k = minmax(i, k)
    j, l = minmax(j, l)
    m, o = minmax(m, o)
    n, p = minmax(n, p)
    q, s = minmax(q, s)
    r, t = minmax(r, t)

    c, q = minmax(c, q)
    d, r = minmax(d, r)
    g, u = minmax(g, u)
    h, v = minmax(h, v)

    c, i = minmax(c, i)
    d, j = minmax(d, j)
    g, m = minmax(g, m)
    h, n = minmax(h, n)
    k, q = minmax(k, q)
    l, r = minmax(l, r)
    o, u = minmax(o, u)
    p, v = minmax(p, v)

    c, e = minmax(c, e)
    d, f = minmax(d, f)
    g, i = minmax(g, i)
    h, j = minmax(h, j)
    k, m = minmax(k, m)
    l, n = minmax(l, n)
    o, q = minmax(o, q)
    p, r = minmax(p, r)
    s, u = minmax(s, u)
    t, v = minmax(t, v)

    c, d = minmax(c, d)
    e, f = minmax(e, f)
    g, h = minmax(g, h)
    i, j = minmax(i, j)
    k, l = minmax(k, l)
    m, n = minmax(m, n)
    o, p = minmax(o, p)
    q, r = minmax(q, r)
    s, t = minmax(s, t)
    u, v = minmax(u, v)

    b, q = minmax(b, q)
    d, s = minmax(d, s)
    f, u = minmax(f, u)
    h, o = minmax(h, o)

    b, i = minmax(b, i)
    d, k = minmax(d, k)
    f, m = minmax(f, m)
    j, q = minmax(j, q)
    l, s = minmax(l, s)
    n, u = minmax(n, u)

    b, e = minmax(b, e)
    d, g = minmax(d, g)
    f, i = minmax(f, i)
    h, k = minmax(h, k)
    j, m = minmax(j, m)
    l, o = minmax(l, o)
    n, q = minmax(n, q)
    p, s = minmax(p, s)
    r, u = minmax(r, u)

    b, c = minmax(b, c)
    d, e = minmax(d, e)
    f, g = minmax(f, g)
    h, i = minmax(h, i)
    j, k = minmax(j, k)
    l, m = minmax(l, m)
    n, o = minmax(n, o)
    p, q = minmax(p, q)
    r, s = minmax(r, s)
    t, u = minmax(t, u)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v
end

#    sort 23 values with 122 minmaxs in 15 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T, v::T, w::T)

    a, q = minmax(a, q)
    b, r = minmax(b, r)
    c, s = minmax(c, s)
    d, t = minmax(d, t)
    e, u = minmax(e, u)
    f, v = minmax(f, v)
    g, w = minmax(g, w)
    h, p = minmax(h, p)

    a, i = minmax(a, i)
    b, j = minmax(b, j)
    c, k = minmax(c, k)
    d, l = minmax(d, l)
    e, m = minmax(e, m)
    f, n = minmax(f, n)
    g, o = minmax(g, o)

    i, q = minmax(i, q)
    j, r = minmax(j, r)
    k, s = minmax(k, s)
    l, t = minmax(l, t)
    m, u = minmax(m, u)
    n, v = minmax(n, v)
    o, w = minmax(o, w)
    a, e = minmax(a, e)
    b, f = minmax(b, f)
    c, g = minmax(c, g)
    d, h = minmax(d, h)

    i, m = minmax(i, m)
    j, n = minmax(j, n)
    k, o = minmax(k, o)
    l, p = minmax(l, p)
    q, u = minmax(q, u)
    r, v = minmax(r, v)
    s, w = minmax(s, w)
    h, t = minmax(h, t)
    a, c = minmax(a, c)
    b, d = minmax(b, d)

    e, q = minmax(e, q)
    f, r = minmax(f, r)
    g, s = minmax(g, s)
    h, l = minmax(h, l)
    p, t = minmax(p, t)
    u, w = minmax(u, w)
    a, b = minmax(a, b)

    e, i = minmax(e, i)
    f, j = minmax(f, j)
    g, k = minmax(g, k)
    m, q = minmax(m, q)
    n, r = minmax(n, r)
    o, s = minmax(o, s)

    e, g = minmax(e, g)
    f, h = minmax(f, h)
    i, k = minmax(i, k)
    j, l = minmax(j, l)
    m, o = minmax(m, o)
    n, p = minmax(n, p)
    q, s = minmax(q, s)
    r, t = minmax(r, t)

    c, q = minmax(c, q)
    d, r = minmax(d, r)
    g, u = minmax(g, u)
    h, v = minmax(h, v)

    c, i = minmax(c, i)
    d, j = minmax(d, j)
    g, m = minmax(g, m)
    h, n = minmax(h, n)
    k, q = minmax(k, q)
    l, r = minmax(l, r)
    o, u = minmax(o, u)
    p, v = minmax(p, v)

    c, e = minmax(c, e)
    d, f = minmax(d, f)
    g, i = minmax(g, i)
    h, j = minmax(h, j)
    k, m = minmax(k, m)
    l, n = minmax(l, n)
    o, q = minmax(o, q)
    p, r = minmax(p, r)
    s, u = minmax(s, u)
    t, v = minmax(t, v)

    c, d = minmax(c, d)
    e, f = minmax(e, f)
    g, h = minmax(g, h)
    i, j = minmax(i, j)
    k, l = minmax(k, l)
    m, n = minmax(m, n)
    o, p = minmax(o, p)
    q, r = minmax(q, r)
    s, t = minmax(s, t)
    u, v = minmax(u, v)

    b, q = minmax(b, q)
    d, s = minmax(d, s)
    f, u = minmax(f, u)
    h, w = minmax(h, w)

    b, i = minmax(b, i)
    d, k = minmax(d, k)
    f, m = minmax(f, m)
    h, o = minmax(h, o)
    j, q = minmax(j, q)
    l, s = minmax(l, s)
    n, u = minmax(n, u)
    p, w = minmax(p, w)

    b, e = minmax(b, e)
    d, g = minmax(d, g)
    f, i = minmax(f, i)
    h, k = minmax(h, k)
    j, m = minmax(j, m)
    l, o = minmax(l, o)
    n, q = minmax(n, q)
    p, s = minmax(p, s)
    r, u = minmax(r, u)
    t, w = minmax(t, w)

    b, c = minmax(b, c)
    d, e = minmax(d, e)
    f, g = minmax(f, g)
    h, i = minmax(h, i)
    j, k = minmax(j, k)
    l, m = minmax(l, m)
    n, o = minmax(n, o)
    p, q = minmax(p, q)
    r, s = minmax(r, s)
    t, u = minmax(t, u)
    v, w = minmax(v, w)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w
end

#    sort 24 values with 127 minmaxs in 15 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T, v::T, w::T, x::T)

    a, q = minmax(a, q)
    b, r = minmax(b, r)
    c, s = minmax(c, s)
    d, t = minmax(d, t)
    e, u = minmax(e, u)
    f, v = minmax(f, v)
    g, w = minmax(g, w)
    h, x = minmax(h, x)

    a, i = minmax(a, i)
    b, j = minmax(b, j)
    c, k = minmax(c, k)
    d, l = minmax(d, l)
    e, m = minmax(e, m)
    f, n = minmax(f, n)
    g, o = minmax(g, o)
    h, p = minmax(h, p)

    i, q = minmax(i, q)
    j, r = minmax(j, r)
    k, s = minmax(k, s)
    l, t = minmax(l, t)
    m, u = minmax(m, u)
    n, v = minmax(n, v)
    o, w = minmax(o, w)
    p, x = minmax(p, x)
    a, e = minmax(a, e)
    b, f = minmax(b, f)
    c, g = minmax(c, g)
    d, h = minmax(d, h)

    i, m = minmax(i, m)
    j, n = minmax(j, n)
    k, o = minmax(k, o)
    l, p = minmax(l, p)
    q, u = minmax(q, u)
    r, v = minmax(r, v)
    s, w = minmax(s, w)
    t, x = minmax(t, x)
    a, c = minmax(a, c)
    b, d = minmax(b, d)

    e, q = minmax(e, q)
    f, r = minmax(f, r)
    g, s = minmax(g, s)
    h, t = minmax(h, t)
    u, w = minmax(u, w)
    v, x = minmax(v, x)
    a, b = minmax(a, b)

    e, i = minmax(e, i)
    f, j = minmax(f, j)
    g, k = minmax(g, k)
    h, l = minmax(h, l)
    m, q = minmax(m, q)
    n, r = minmax(n, r)
    o, s = minmax(o, s)
    p, t = minmax(p, t)
    w, x = minmax(w, x)

    e, g = minmax(e, g)
    f, h = minmax(f, h)
    i, k = minmax(i, k)
    j, l = minmax(j, l)
    m, o = minmax(m, o)
    n, p = minmax(n, p)
    q, s = minmax(q, s)
    r, t = minmax(r, t)

    c, q = minmax(c, q)
    d, r = minmax(d, r)
    g, u = minmax(g, u)
    h, v = minmax(h, v)

    c, i = minmax(c, i)
    d, j = minmax(d, j)
    g, m = minmax(g, m)
    h, n = minmax(h, n)
    k, q = minmax(k, q)
    l, r = minmax(l, r)
    o, u = minmax(o, u)
    p, v = minmax(p, v)

    c, e = minmax(c, e)
    d, f = minmax(d, f)
    g, i = minmax(g, i)
    h, j = minmax(h, j)
    k, m = minmax(k, m)
    l, n = minmax(l, n)
    o, q = minmax(o, q)
    p, r = minmax(p, r)
    s, u = minmax(s, u)
    t, v = minmax(t, v)

    c, d = minmax(c, d)
    e, f = minmax(e, f)
    g, h = minmax(g, h)
    i, j = minmax(i, j)
    k, l = minmax(k, l)
    m, n = minmax(m, n)
    o, p = minmax(o, p)
    q, r = minmax(q, r)
    s, t = minmax(s, t)
    u, v = minmax(u, v)

    b, q = minmax(b, q)
    d, s = minmax(d, s)
    f, u = minmax(f, u)
    h, w = minmax(h, w)

    b, i = minmax(b, i)
    d, k = minmax(d, k)
    f, m = minmax(f, m)
    h, o = minmax(h, o)
    j, q = minmax(j, q)
    l, s = minmax(l, s)
    n, u = minmax(n, u)
    p, w = minmax(p, w)

    b, e = minmax(b, e)
    d, g = minmax(d, g)
    f, i = minmax(f, i)
    h, k = minmax(h, k)
    j, m = minmax(j, m)
    l, o = minmax(l, o)
    n, q = minmax(n, q)
    p, s = minmax(p, s)
    r, u = minmax(r, u)
    t, w = minmax(t, w)

    b, c = minmax(b, c)
    d, e = minmax(d, e)
    f, g = minmax(f, g)
    h, i = minmax(h, i)
    j, k = minmax(j, k)
    l, m = minmax(l, m)
    n, o = minmax(n, o)
    p, q = minmax(p, q)
    r, s = minmax(r, s)
    t, u = minmax(t, u)
    v, w = minmax(v, w)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x
end

#    sort 25 values with 138 minmaxs in 15 parallel stages

function sort{T}(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T, v::T, w::T, x::T, y::T)

    a, q = minmax(a, q)
    b, r = minmax(b, r)
    c, s = minmax(c, s)
    d, t = minmax(d, t)
    e, u = minmax(e, u)
    f, v = minmax(f, v)
    g, w = minmax(g, w)
    h, x = minmax(h, x)
    i, y = minmax(i, y)

    a, i = minmax(a, i)
    b, j = minmax(b, j)
    c, k = minmax(c, k)
    d, l = minmax(d, l)
    e, m = minmax(e, m)
    f, n = minmax(f, n)
    g, o = minmax(g, o)
    h, p = minmax(h, p)
    q, y = minmax(q, y)

    i, q = minmax(i, q)
    j, r = minmax(j, r)
    k, s = minmax(k, s)
    l, t = minmax(l, t)
    m, u = minmax(m, u)
    n, v = minmax(n, v)
    o, w = minmax(o, w)
    p, x = minmax(p, x)
    a, e = minmax(a, e)
    b, f = minmax(b, f)
    c, g = minmax(c, g)
    d, h = minmax(d, h)

    i, m = minmax(i, m)
    j, n = minmax(j, n)
    k, o = minmax(k, o)
    l, p = minmax(l, p)
    q, u = minmax(q, u)
    r, v = minmax(r, v)
    s, w = minmax(s, w)
    t, x = minmax(t, x)
    a, c = minmax(a, c)
    b, d = minmax(b, d)

    e, q = minmax(e, q)
    f, r = minmax(f, r)
    g, s = minmax(g, s)
    h, t = minmax(h, t)
    m, y = minmax(m, y)
    v, x = minmax(v, x)
    a, b = minmax(a, b)

    e, i = minmax(e, i)
    f, j = minmax(f, j)
    g, k = minmax(g, k)
    h, l = minmax(h, l)
    m, q = minmax(m, q)
    n, r = minmax(n, r)
    o, s = minmax(o, s)
    p, t = minmax(p, t)
    u, y = minmax(u, y)

    e, g = minmax(e, g)
    f, h = minmax(f, h)
    i, k = minmax(i, k)
    j, l = minmax(j, l)
    m, o = minmax(m, o)
    n, p = minmax(n, p)
    q, s = minmax(q, s)
    r, t = minmax(r, t)
    u, w = minmax(u, w)

    c, q = minmax(c, q)
    d, r = minmax(d, r)
    g, u = minmax(g, u)
    h, v = minmax(h, v)
    k, y = minmax(k, y)

    c, i = minmax(c, i)
    d, j = minmax(d, j)
    g, m = minmax(g, m)
    h, n = minmax(h, n)
    k, q = minmax(k, q)
    l, r = minmax(l, r)
    o, u = minmax(o, u)
    p, v = minmax(p, v)
    s, y = minmax(s, y)

    c, e = minmax(c, e)
    d, f = minmax(d, f)
    g, i = minmax(g, i)
    h, j = minmax(h, j)
    k, m = minmax(k, m)
    l, n = minmax(l, n)
    o, q = minmax(o, q)
    p, r = minmax(p, r)
    s, u = minmax(s, u)
    t, v = minmax(t, v)
    w, y = minmax(w, y)

    c, d = minmax(c, d)
    e, f = minmax(e, f)
    g, h = minmax(g, h)
    i, j = minmax(i, j)
    k, l = minmax(k, l)
    m, n = minmax(m, n)
    o, p = minmax(o, p)
    q, r = minmax(q, r)
    s, t = minmax(s, t)
    u, v = minmax(u, v)
    w, x = minmax(w, x)

    b, q = minmax(b, q)
    d, s = minmax(d, s)
    f, u = minmax(f, u)
    h, w = minmax(h, w)
    j, y = minmax(j, y)

    b, i = minmax(b, i)
    d, k = minmax(d, k)
    f, m = minmax(f, m)
    h, o = minmax(h, o)
    j, q = minmax(j, q)
    l, s = minmax(l, s)
    n, u = minmax(n, u)
    p, w = minmax(p, w)
    r, y = minmax(r, y)

    b, e = minmax(b, e)
    d, g = minmax(d, g)
    f, i = minmax(f, i)
    h, k = minmax(h, k)
    j, m = minmax(j, m)
    l, o = minmax(l, o)
    n, q = minmax(n, q)
    p, s = minmax(p, s)
    r, u = minmax(r, u)
    t, w = minmax(t, w)
    v, y = minmax(v, y)

    b, c = minmax(b, c)
    d, e = minmax(d, e)
    f, g = minmax(f, g)
    h, i = minmax(h, i)
    j, k = minmax(j, k)
    l, m = minmax(l, m)
    n, o = minmax(n, o)
    p, q = minmax(p, q)
    r, s = minmax(r, s)
    t, u = minmax(t, u)
    v, w = minmax(v, w)
    x, y = minmax(x, y)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y
end

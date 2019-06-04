#=
    Sorting networks that process 17,..25 values are given.

    These sorting networks should minimize conditional swaps.
    There may exist one or more comparable alternative solutions;
      those may perform marginally better for some kinds of hardware.
          
    Functions are written with groups of internally paralleli1zable  
    statements given together and sequential steps are separated.  

    `swapsort(x1::T, .., xn::T)::NTuple{n,T}`
    `swapsort(tup::NTuple{n,T})::NTuple{n,T}`
    
    networks were selected using software by John Gamble
        http://pages.ripco.net/~jgamble/nw.html
        http://search.cpan.org/dist/Algorithm-Networksort/
=#

const MORE_ARGS_MIN = 17
const MORE_ARGS_MAX = 25

#=
   sort NTuples of 17..25 values
=#

for N in collect(MORE_ARGS_MIN:MORE_ARGS_MAX)
    @eval swapsort(x::NTuple{$N, T}) where T = swapsort(x...)
end


#=
    sorting networks for 17..25 values
    using known compact realizations
=#


#    sort 17 values with 74 minmaxs in 12 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
                f::T, g::T, h::T, i::T, j::T,
                k::T, l::T, m::T, n::T, o::T,
                p::T, q::T) where {T}

    a, q = min_max(a, q)
    b, j = min_max(b, j)
    c, k = min_max(c, k)
    d, l = min_max(d, l)
    e, m = min_max(e, m)
    f, n = min_max(f, n)
    g, o = min_max(g, o)
    h, p = min_max(h, p)

    a, i = min_max(a, i)
    b, f = min_max(b, f)
    c, g = min_max(c, g)
    d, h = min_max(d, h)
    j, n = min_max(j, n)
    k, o = min_max(k, o)
    l, p = min_max(l, p)

    i, q = min_max(i, q)
    a, e = min_max(a, e)
    f, j = min_max(f, j)
    g, k = min_max(g, k)
    h, l = min_max(h, l)
    b, d = min_max(b, d)
    n, p = min_max(n, p)

    i, m = min_max(i, m)
    e, q = min_max(e, q)
    a, c = min_max(a, c)
    f, h = min_max(f, h)
    j, l = min_max(j, l)

    e, i = min_max(e, i)
    m, q = min_max(m, q)
    d, j = min_max(d, j)
    h, n = min_max(h, n)
    a, b = min_max(a, b)

    e, g = min_max(e, g)
    i, k = min_max(i, k)
    m, o = min_max(m, o)
    c, q = min_max(c, q)
    d, f = min_max(d, f)
    h, j = min_max(h, j)
    l, n = min_max(l, n)

    c, i = min_max(c, i)
    g, m = min_max(g, m)
    k, q = min_max(k, q)

    c, e = min_max(c, e)
    g, i = min_max(g, i)
    k, m = min_max(k, m)
    o, q = min_max(o, q)

    c, d = min_max(c, d)
    e, f = min_max(e, f)
    g, h = min_max(g, h)
    i, j = min_max(i, j)
    k, l = min_max(k, l)
    m, n = min_max(m, n)
    o, p = min_max(o, p)
    b, q = min_max(b, q)

    b, i = min_max(b, i)
    d, k = min_max(d, k)
    f, m = min_max(f, m)
    h, o = min_max(h, o)
    j, q = min_max(j, q)

    b, e = min_max(b, e)
    d, g = min_max(d, g)
    f, i = min_max(f, i)
    h, k = min_max(h, k)
    j, m = min_max(j, m)
    l, o = min_max(l, o)
    n, q = min_max(n, q)

    b, c = min_max(b, c)
    d, e = min_max(d, e)
    f, g = min_max(f, g)
    h, i = min_max(h, i)
    j, k = min_max(j, k)
    l, m = min_max(l, m)
    n, o = min_max(n, o)
    p, q = min_max(p, q)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q
end

#    sort 18 values with 82 minmaxs in 13 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T) where {T}

    a, q = min_max(a, q)
    b, r = min_max(b, r)
    c, k = min_max(c, k)
    d, l = min_max(d, l)
    e, m = min_max(e, m)
    f, n = min_max(f, n)
    g, o = min_max(g, o)
    h, p = min_max(h, p)

    a, i = min_max(a, i)
    b, j = min_max(b, j)
    c, g = min_max(c, g)
    d, h = min_max(d, h)
    k, o = min_max(k, o)
    l, p = min_max(l, p)

    i, q = min_max(i, q)
    j, r = min_max(j, r)
    a, e = min_max(a, e)
    b, f = min_max(b, f)
    g, k = min_max(g, k)
    h, l = min_max(h, l)

    i, m = min_max(i, m)
    j, n = min_max(j, n)
    e, q = min_max(e, q)
    f, r = min_max(f, r)
    a, c = min_max(a, c)
    b, d = min_max(b, d)

    e, i = min_max(e, i)
    f, j = min_max(f, j)
    m, q = min_max(m, q)
    n, r = min_max(n, r)
    a, b = min_max(a, b)

    e, g = min_max(e, g)
    f, h = min_max(f, h)
    i, k = min_max(i, k)
    j, l = min_max(j, l)
    m, o = min_max(m, o)
    n, p = min_max(n, p)
    c, q = min_max(c, q)
    d, r = min_max(d, r)

    c, i = min_max(c, i)
    d, j = min_max(d, j)
    g, m = min_max(g, m)
    h, n = min_max(h, n)
    k, q = min_max(k, q)
    l, r = min_max(l, r)

    c, e = min_max(c, e)
    d, f = min_max(d, f)
    g, i = min_max(g, i)
    h, j = min_max(h, j)
    k, m = min_max(k, m)
    l, n = min_max(l, n)
    o, q = min_max(o, q)
    p, r = min_max(p, r)

    c, d = min_max(c, d)
    e, f = min_max(e, f)
    g, h = min_max(g, h)
    i, j = min_max(i, j)
    k, l = min_max(k, l)
    m, n = min_max(m, n)
    o, p = min_max(o, p)
    q, r = min_max(q, r)

    b, q = min_max(b, q)
    d, k = min_max(d, k)
    f, m = min_max(f, m)
    h, o = min_max(h, o)

    b, i = min_max(b, i)
    j, q = min_max(j, q)
    d, g = min_max(d, g)
    h, k = min_max(h, k)
    l, o = min_max(l, o)

    b, e = min_max(b, e)
    f, i = min_max(f, i)
    j, m = min_max(j, m)
    n, q = min_max(n, q)

    b, c = min_max(b, c)
    d, e = min_max(d, e)
    f, g = min_max(f, g)
    h, i = min_max(h, i)
    j, k = min_max(j, k)
    l, m = min_max(l, m)
    n, o = min_max(n, o)
    p, q = min_max(p, q)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r
end

#    sort 19 values with 91 minmaxs in 14 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T) where {T}

    a, q = min_max(a, q)
    b, r = min_max(b, r)
    c, s = min_max(c, s)
    d, l = min_max(d, l)
    e, m = min_max(e, m)
    f, n = min_max(f, n)
    g, o = min_max(g, o)
    h, p = min_max(h, p)

    a, i = min_max(a, i)
    b, j = min_max(b, j)
    c, k = min_max(c, k)
    d, h = min_max(d, h)
    l, p = min_max(l, p)

    i, q = min_max(i, q)
    j, r = min_max(j, r)
    k, s = min_max(k, s)
    a, e = min_max(a, e)
    b, f = min_max(b, f)
    c, g = min_max(c, g)
    h, l = min_max(h, l)

    i, m = min_max(i, m)
    j, n = min_max(j, n)
    k, o = min_max(k, o)
    e, q = min_max(e, q)
    f, r = min_max(f, r)
    g, s = min_max(g, s)
    a, c = min_max(a, c)
    b, d = min_max(b, d)

    e, i = min_max(e, i)
    f, j = min_max(f, j)
    g, k = min_max(g, k)
    m, q = min_max(m, q)
    n, r = min_max(n, r)
    o, s = min_max(o, s)
    a, b = min_max(a, b)

    e, g = min_max(e, g)
    f, h = min_max(f, h)
    i, k = min_max(i, k)
    j, l = min_max(j, l)
    m, o = min_max(m, o)
    n, p = min_max(n, p)
    q, s = min_max(q, s)
    d, r = min_max(d, r)

    c, q = min_max(c, q)
    d, j = min_max(d, j)
    g, m = min_max(g, m)
    h, n = min_max(h, n)
    l, r = min_max(l, r)

    c, i = min_max(c, i)
    k, q = min_max(k, q)
    d, f = min_max(d, f)
    h, j = min_max(h, j)
    l, n = min_max(l, n)
    p, r = min_max(p, r)

    c, e = min_max(c, e)
    g, i = min_max(g, i)
    k, m = min_max(k, m)
    o, q = min_max(o, q)

    c, d = min_max(c, d)
    e, f = min_max(e, f)
    g, h = min_max(g, h)
    i, j = min_max(i, j)
    k, l = min_max(k, l)
    m, n = min_max(m, n)
    o, p = min_max(o, p)
    q, r = min_max(q, r)

    b, q = min_max(b, q)
    d, s = min_max(d, s)
    f, m = min_max(f, m)
    h, o = min_max(h, o)

    b, i = min_max(b, i)
    d, k = min_max(d, k)
    j, q = min_max(j, q)
    l, s = min_max(l, s)

    b, e = min_max(b, e)
    d, g = min_max(d, g)
    f, i = min_max(f, i)
    h, k = min_max(h, k)
    j, m = min_max(j, m)
    l, o = min_max(l, o)
    n, q = min_max(n, q)
    p, s = min_max(p, s)

    b, c = min_max(b, c)
    d, e = min_max(d, e)
    f, g = min_max(f, g)
    h, i = min_max(h, i)
    j, k = min_max(j, k)
    l, m = min_max(l, m)
    n, o = min_max(n, o)
    p, q = min_max(p, q)
    r, s = min_max(r, s)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s
end

#    sort 20 values with 97 minmaxs in 14 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T) where {T}

    a, q = min_max(a, q)
    b, r = min_max(b, r)
    c, s = min_max(c, s)
    d, t = min_max(d, t)
    e, m = min_max(e, m)
    f, n = min_max(f, n)
    g, o = min_max(g, o)
    h, p = min_max(h, p)

    a, i = min_max(a, i)
    b, j = min_max(b, j)
    c, k = min_max(c, k)
    d, l = min_max(d, l)

    i, q = min_max(i, q)
    j, r = min_max(j, r)
    k, s = min_max(k, s)
    l, t = min_max(l, t)
    a, e = min_max(a, e)
    b, f = min_max(b, f)
    c, g = min_max(c, g)
    d, h = min_max(d, h)

    i, m = min_max(i, m)
    j, n = min_max(j, n)
    k, o = min_max(k, o)
    l, p = min_max(l, p)
    e, q = min_max(e, q)
    f, r = min_max(f, r)
    g, s = min_max(g, s)
    h, t = min_max(h, t)
    a, c = min_max(a, c)
    b, d = min_max(b, d)

    e, i = min_max(e, i)
    f, j = min_max(f, j)
    g, k = min_max(g, k)
    h, l = min_max(h, l)
    m, q = min_max(m, q)
    n, r = min_max(n, r)
    o, s = min_max(o, s)
    p, t = min_max(p, t)
    a, b = min_max(a, b)

    e, g = min_max(e, g)
    f, h = min_max(f, h)
    i, k = min_max(i, k)
    j, l = min_max(j, l)
    m, o = min_max(m, o)
    n, p = min_max(n, p)
    q, s = min_max(q, s)
    r, t = min_max(r, t)

    c, q = min_max(c, q)
    d, r = min_max(d, r)
    g, m = min_max(g, m)
    h, n = min_max(h, n)
    s, t = min_max(s, t)

    c, i = min_max(c, i)
    d, j = min_max(d, j)
    k, q = min_max(k, q)
    l, r = min_max(l, r)

    c, e = min_max(c, e)
    d, f = min_max(d, f)
    g, i = min_max(g, i)
    h, j = min_max(h, j)
    k, m = min_max(k, m)
    l, n = min_max(l, n)
    o, q = min_max(o, q)
    p, r = min_max(p, r)

    c, d = min_max(c, d)
    e, f = min_max(e, f)
    g, h = min_max(g, h)
    i, j = min_max(i, j)
    k, l = min_max(k, l)
    m, n = min_max(m, n)
    o, p = min_max(o, p)
    q, r = min_max(q, r)

    b, q = min_max(b, q)
    d, s = min_max(d, s)
    f, m = min_max(f, m)
    h, o = min_max(h, o)

    b, i = min_max(b, i)
    d, k = min_max(d, k)
    j, q = min_max(j, q)
    l, s = min_max(l, s)

    b, e = min_max(b, e)
    d, g = min_max(d, g)
    f, i = min_max(f, i)
    h, k = min_max(h, k)
    j, m = min_max(j, m)
    l, o = min_max(l, o)
    n, q = min_max(n, q)
    p, s = min_max(p, s)

    b, c = min_max(b, c)
    d, e = min_max(d, e)
    f, g = min_max(f, g)
    h, i = min_max(h, i)
    j, k = min_max(j, k)
    l, m = min_max(l, m)
    n, o = min_max(n, o)
    p, q = min_max(p, q)
    r, s = min_max(r, s)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t
end

#    sort 21 values with 107 minmaxs in 15 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T) where {T}

    a, q = min_max(a, q)
    b, r = min_max(b, r)
    c, s = min_max(c, s)
    d, t = min_max(d, t)
    e, u = min_max(e, u)
    f, n = min_max(f, n)
    g, o = min_max(g, o)
    h, p = min_max(h, p)

    a, i = min_max(a, i)
    b, j = min_max(b, j)
    c, k = min_max(c, k)
    d, l = min_max(d, l)
    e, m = min_max(e, m)

    i, q = min_max(i, q)
    j, r = min_max(j, r)
    k, s = min_max(k, s)
    l, t = min_max(l, t)
    m, u = min_max(m, u)
    a, e = min_max(a, e)
    b, f = min_max(b, f)
    c, g = min_max(c, g)
    d, h = min_max(d, h)

    i, m = min_max(i, m)
    j, n = min_max(j, n)
    k, o = min_max(k, o)
    l, p = min_max(l, p)
    q, u = min_max(q, u)
    f, r = min_max(f, r)
    g, s = min_max(g, s)
    h, t = min_max(h, t)
    a, c = min_max(a, c)
    b, d = min_max(b, d)

    e, q = min_max(e, q)
    f, j = min_max(f, j)
    g, k = min_max(g, k)
    h, l = min_max(h, l)
    n, r = min_max(n, r)
    o, s = min_max(o, s)
    p, t = min_max(p, t)
    a, b = min_max(a, b)

    e, i = min_max(e, i)
    m, q = min_max(m, q)
    f, h = min_max(f, h)
    j, l = min_max(j, l)
    n, p = min_max(n, p)
    r, t = min_max(r, t)

    e, g = min_max(e, g)
    i, k = min_max(i, k)
    m, o = min_max(m, o)
    q, s = min_max(q, s)
    d, r = min_max(d, r)
    h, n = min_max(h, n)

    c, q = min_max(c, q)
    g, u = min_max(g, u)
    d, j = min_max(d, j)
    l, r = min_max(l, r)

    c, i = min_max(c, i)
    g, m = min_max(g, m)
    k, q = min_max(k, q)
    o, u = min_max(o, u)
    d, f = min_max(d, f)
    h, j = min_max(h, j)
    l, n = min_max(l, n)
    p, r = min_max(p, r)

    c, e = min_max(c, e)
    g, i = min_max(g, i)
    k, m = min_max(k, m)
    o, q = min_max(o, q)
    s, u = min_max(s, u)

    c, d = min_max(c, d)
    e, f = min_max(e, f)
    g, h = min_max(g, h)
    i, j = min_max(i, j)
    k, l = min_max(k, l)
    m, n = min_max(m, n)
    o, p = min_max(o, p)
    q, r = min_max(q, r)
    s, t = min_max(s, t)

    b, q = min_max(b, q)
    d, s = min_max(d, s)
    f, u = min_max(f, u)
    h, o = min_max(h, o)

    b, i = min_max(b, i)
    d, k = min_max(d, k)
    f, m = min_max(f, m)
    j, q = min_max(j, q)
    l, s = min_max(l, s)
    n, u = min_max(n, u)

    b, e = min_max(b, e)
    d, g = min_max(d, g)
    f, i = min_max(f, i)
    h, k = min_max(h, k)
    j, m = min_max(j, m)
    l, o = min_max(l, o)
    n, q = min_max(n, q)
    p, s = min_max(p, s)
    r, u = min_max(r, u)

    b, c = min_max(b, c)
    d, e = min_max(d, e)
    f, g = min_max(f, g)
    h, i = min_max(h, i)
    j, k = min_max(j, k)
    l, m = min_max(l, m)
    n, o = min_max(n, o)
    p, q = min_max(p, q)
    r, s = min_max(r, s)
    t, u = min_max(t, u)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u
end

#    sort 22 values with 114 minmaxs in 15 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T, v::T) where {T}

    a, q = min_max(a, q)
    b, r = min_max(b, r)
    c, s = min_max(c, s)
    d, t = min_max(d, t)
    e, u = min_max(e, u)
    f, v = min_max(f, v)
    g, o = min_max(g, o)
    h, p = min_max(h, p)

    a, i = min_max(a, i)
    b, j = min_max(b, j)
    c, k = min_max(c, k)
    d, l = min_max(d, l)
    e, m = min_max(e, m)
    f, n = min_max(f, n)

    i, q = min_max(i, q)
    j, r = min_max(j, r)
    k, s = min_max(k, s)
    l, t = min_max(l, t)
    m, u = min_max(m, u)
    n, v = min_max(n, v)
    a, e = min_max(a, e)
    b, f = min_max(b, f)
    c, g = min_max(c, g)
    d, h = min_max(d, h)

    i, m = min_max(i, m)
    j, n = min_max(j, n)
    k, o = min_max(k, o)
    l, p = min_max(l, p)
    q, u = min_max(q, u)
    r, v = min_max(r, v)
    g, s = min_max(g, s)
    h, t = min_max(h, t)
    a, c = min_max(a, c)
    b, d = min_max(b, d)

    e, q = min_max(e, q)
    f, r = min_max(f, r)
    g, k = min_max(g, k)
    h, l = min_max(h, l)
    o, s = min_max(o, s)
    p, t = min_max(p, t)
    a, b = min_max(a, b)

    e, i = min_max(e, i)
    f, j = min_max(f, j)
    m, q = min_max(m, q)
    n, r = min_max(n, r)

    e, g = min_max(e, g)
    f, h = min_max(f, h)
    i, k = min_max(i, k)
    j, l = min_max(j, l)
    m, o = min_max(m, o)
    n, p = min_max(n, p)
    q, s = min_max(q, s)
    r, t = min_max(r, t)

    c, q = min_max(c, q)
    d, r = min_max(d, r)
    g, u = min_max(g, u)
    h, v = min_max(h, v)

    c, i = min_max(c, i)
    d, j = min_max(d, j)
    g, m = min_max(g, m)
    h, n = min_max(h, n)
    k, q = min_max(k, q)
    l, r = min_max(l, r)
    o, u = min_max(o, u)
    p, v = min_max(p, v)

    c, e = min_max(c, e)
    d, f = min_max(d, f)
    g, i = min_max(g, i)
    h, j = min_max(h, j)
    k, m = min_max(k, m)
    l, n = min_max(l, n)
    o, q = min_max(o, q)
    p, r = min_max(p, r)
    s, u = min_max(s, u)
    t, v = min_max(t, v)

    c, d = min_max(c, d)
    e, f = min_max(e, f)
    g, h = min_max(g, h)
    i, j = min_max(i, j)
    k, l = min_max(k, l)
    m, n = min_max(m, n)
    o, p = min_max(o, p)
    q, r = min_max(q, r)
    s, t = min_max(s, t)
    u, v = min_max(u, v)

    b, q = min_max(b, q)
    d, s = min_max(d, s)
    f, u = min_max(f, u)
    h, o = min_max(h, o)

    b, i = min_max(b, i)
    d, k = min_max(d, k)
    f, m = min_max(f, m)
    j, q = min_max(j, q)
    l, s = min_max(l, s)
    n, u = min_max(n, u)

    b, e = min_max(b, e)
    d, g = min_max(d, g)
    f, i = min_max(f, i)
    h, k = min_max(h, k)
    j, m = min_max(j, m)
    l, o = min_max(l, o)
    n, q = min_max(n, q)
    p, s = min_max(p, s)
    r, u = min_max(r, u)

    b, c = min_max(b, c)
    d, e = min_max(d, e)
    f, g = min_max(f, g)
    h, i = min_max(h, i)
    j, k = min_max(j, k)
    l, m = min_max(l, m)
    n, o = min_max(n, o)
    p, q = min_max(p, q)
    r, s = min_max(r, s)
    t, u = min_max(t, u)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v
end

#    sort 23 values with 122 minmaxs in 15 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T, v::T, w::T) where {T}

    a, q = min_max(a, q)
    b, r = min_max(b, r)
    c, s = min_max(c, s)
    d, t = min_max(d, t)
    e, u = min_max(e, u)
    f, v = min_max(f, v)
    g, w = min_max(g, w)
    h, p = min_max(h, p)

    a, i = min_max(a, i)
    b, j = min_max(b, j)
    c, k = min_max(c, k)
    d, l = min_max(d, l)
    e, m = min_max(e, m)
    f, n = min_max(f, n)
    g, o = min_max(g, o)

    i, q = min_max(i, q)
    j, r = min_max(j, r)
    k, s = min_max(k, s)
    l, t = min_max(l, t)
    m, u = min_max(m, u)
    n, v = min_max(n, v)
    o, w = min_max(o, w)
    a, e = min_max(a, e)
    b, f = min_max(b, f)
    c, g = min_max(c, g)
    d, h = min_max(d, h)

    i, m = min_max(i, m)
    j, n = min_max(j, n)
    k, o = min_max(k, o)
    l, p = min_max(l, p)
    q, u = min_max(q, u)
    r, v = min_max(r, v)
    s, w = min_max(s, w)
    h, t = min_max(h, t)
    a, c = min_max(a, c)
    b, d = min_max(b, d)

    e, q = min_max(e, q)
    f, r = min_max(f, r)
    g, s = min_max(g, s)
    h, l = min_max(h, l)
    p, t = min_max(p, t)
    u, w = min_max(u, w)
    a, b = min_max(a, b)

    e, i = min_max(e, i)
    f, j = min_max(f, j)
    g, k = min_max(g, k)
    m, q = min_max(m, q)
    n, r = min_max(n, r)
    o, s = min_max(o, s)

    e, g = min_max(e, g)
    f, h = min_max(f, h)
    i, k = min_max(i, k)
    j, l = min_max(j, l)
    m, o = min_max(m, o)
    n, p = min_max(n, p)
    q, s = min_max(q, s)
    r, t = min_max(r, t)

    c, q = min_max(c, q)
    d, r = min_max(d, r)
    g, u = min_max(g, u)
    h, v = min_max(h, v)

    c, i = min_max(c, i)
    d, j = min_max(d, j)
    g, m = min_max(g, m)
    h, n = min_max(h, n)
    k, q = min_max(k, q)
    l, r = min_max(l, r)
    o, u = min_max(o, u)
    p, v = min_max(p, v)

    c, e = min_max(c, e)
    d, f = min_max(d, f)
    g, i = min_max(g, i)
    h, j = min_max(h, j)
    k, m = min_max(k, m)
    l, n = min_max(l, n)
    o, q = min_max(o, q)
    p, r = min_max(p, r)
    s, u = min_max(s, u)
    t, v = min_max(t, v)

    c, d = min_max(c, d)
    e, f = min_max(e, f)
    g, h = min_max(g, h)
    i, j = min_max(i, j)
    k, l = min_max(k, l)
    m, n = min_max(m, n)
    o, p = min_max(o, p)
    q, r = min_max(q, r)
    s, t = min_max(s, t)
    u, v = min_max(u, v)

    b, q = min_max(b, q)
    d, s = min_max(d, s)
    f, u = min_max(f, u)
    h, w = min_max(h, w)

    b, i = min_max(b, i)
    d, k = min_max(d, k)
    f, m = min_max(f, m)
    h, o = min_max(h, o)
    j, q = min_max(j, q)
    l, s = min_max(l, s)
    n, u = min_max(n, u)
    p, w = min_max(p, w)

    b, e = min_max(b, e)
    d, g = min_max(d, g)
    f, i = min_max(f, i)
    h, k = min_max(h, k)
    j, m = min_max(j, m)
    l, o = min_max(l, o)
    n, q = min_max(n, q)
    p, s = min_max(p, s)
    r, u = min_max(r, u)
    t, w = min_max(t, w)

    b, c = min_max(b, c)
    d, e = min_max(d, e)
    f, g = min_max(f, g)
    h, i = min_max(h, i)
    j, k = min_max(j, k)
    l, m = min_max(l, m)
    n, o = min_max(n, o)
    p, q = min_max(p, q)
    r, s = min_max(r, s)
    t, u = min_max(t, u)
    v, w = min_max(v, w)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w
end

#    sort 24 values with 127 minmaxs in 15 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T, v::T, w::T, x::T) where {T}

    a, q = min_max(a, q)
    b, r = min_max(b, r)
    c, s = min_max(c, s)
    d, t = min_max(d, t)
    e, u = min_max(e, u)
    f, v = min_max(f, v)
    g, w = min_max(g, w)
    h, x = min_max(h, x)

    a, i = min_max(a, i)
    b, j = min_max(b, j)
    c, k = min_max(c, k)
    d, l = min_max(d, l)
    e, m = min_max(e, m)
    f, n = min_max(f, n)
    g, o = min_max(g, o)
    h, p = min_max(h, p)

    i, q = min_max(i, q)
    j, r = min_max(j, r)
    k, s = min_max(k, s)
    l, t = min_max(l, t)
    m, u = min_max(m, u)
    n, v = min_max(n, v)
    o, w = min_max(o, w)
    p, x = min_max(p, x)
    a, e = min_max(a, e)
    b, f = min_max(b, f)
    c, g = min_max(c, g)
    d, h = min_max(d, h)

    i, m = min_max(i, m)
    j, n = min_max(j, n)
    k, o = min_max(k, o)
    l, p = min_max(l, p)
    q, u = min_max(q, u)
    r, v = min_max(r, v)
    s, w = min_max(s, w)
    t, x = min_max(t, x)
    a, c = min_max(a, c)
    b, d = min_max(b, d)

    e, q = min_max(e, q)
    f, r = min_max(f, r)
    g, s = min_max(g, s)
    h, t = min_max(h, t)
    u, w = min_max(u, w)
    v, x = min_max(v, x)
    a, b = min_max(a, b)

    e, i = min_max(e, i)
    f, j = min_max(f, j)
    g, k = min_max(g, k)
    h, l = min_max(h, l)
    m, q = min_max(m, q)
    n, r = min_max(n, r)
    o, s = min_max(o, s)
    p, t = min_max(p, t)
    w, x = min_max(w, x)

    e, g = min_max(e, g)
    f, h = min_max(f, h)
    i, k = min_max(i, k)
    j, l = min_max(j, l)
    m, o = min_max(m, o)
    n, p = min_max(n, p)
    q, s = min_max(q, s)
    r, t = min_max(r, t)

    c, q = min_max(c, q)
    d, r = min_max(d, r)
    g, u = min_max(g, u)
    h, v = min_max(h, v)

    c, i = min_max(c, i)
    d, j = min_max(d, j)
    g, m = min_max(g, m)
    h, n = min_max(h, n)
    k, q = min_max(k, q)
    l, r = min_max(l, r)
    o, u = min_max(o, u)
    p, v = min_max(p, v)

    c, e = min_max(c, e)
    d, f = min_max(d, f)
    g, i = min_max(g, i)
    h, j = min_max(h, j)
    k, m = min_max(k, m)
    l, n = min_max(l, n)
    o, q = min_max(o, q)
    p, r = min_max(p, r)
    s, u = min_max(s, u)
    t, v = min_max(t, v)

    c, d = min_max(c, d)
    e, f = min_max(e, f)
    g, h = min_max(g, h)
    i, j = min_max(i, j)
    k, l = min_max(k, l)
    m, n = min_max(m, n)
    o, p = min_max(o, p)
    q, r = min_max(q, r)
    s, t = min_max(s, t)
    u, v = min_max(u, v)

    b, q = min_max(b, q)
    d, s = min_max(d, s)
    f, u = min_max(f, u)
    h, w = min_max(h, w)

    b, i = min_max(b, i)
    d, k = min_max(d, k)
    f, m = min_max(f, m)
    h, o = min_max(h, o)
    j, q = min_max(j, q)
    l, s = min_max(l, s)
    n, u = min_max(n, u)
    p, w = min_max(p, w)

    b, e = min_max(b, e)
    d, g = min_max(d, g)
    f, i = min_max(f, i)
    h, k = min_max(h, k)
    j, m = min_max(j, m)
    l, o = min_max(l, o)
    n, q = min_max(n, q)
    p, s = min_max(p, s)
    r, u = min_max(r, u)
    t, w = min_max(t, w)

    b, c = min_max(b, c)
    d, e = min_max(d, e)
    f, g = min_max(f, g)
    h, i = min_max(h, i)
    j, k = min_max(j, k)
    l, m = min_max(l, m)
    n, o = min_max(n, o)
    p, q = min_max(p, q)
    r, s = min_max(r, s)
    t, u = min_max(t, u)
    v, w = min_max(v, w)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x
end

#    sort 25 values with 138 minmaxs in 15 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T, v::T, w::T, x::T, y::T) where {T}

    a, q = min_max(a, q)
    b, r = min_max(b, r)
    c, s = min_max(c, s)
    d, t = min_max(d, t)
    e, u = min_max(e, u)
    f, v = min_max(f, v)
    g, w = min_max(g, w)
    h, x = min_max(h, x)
    i, y = min_max(i, y)

    a, i = min_max(a, i)
    b, j = min_max(b, j)
    c, k = min_max(c, k)
    d, l = min_max(d, l)
    e, m = min_max(e, m)
    f, n = min_max(f, n)
    g, o = min_max(g, o)
    h, p = min_max(h, p)
    q, y = min_max(q, y)

    i, q = min_max(i, q)
    j, r = min_max(j, r)
    k, s = min_max(k, s)
    l, t = min_max(l, t)
    m, u = min_max(m, u)
    n, v = min_max(n, v)
    o, w = min_max(o, w)
    p, x = min_max(p, x)
    a, e = min_max(a, e)
    b, f = min_max(b, f)
    c, g = min_max(c, g)
    d, h = min_max(d, h)

    i, m = min_max(i, m)
    j, n = min_max(j, n)
    k, o = min_max(k, o)
    l, p = min_max(l, p)
    q, u = min_max(q, u)
    r, v = min_max(r, v)
    s, w = min_max(s, w)
    t, x = min_max(t, x)
    a, c = min_max(a, c)
    b, d = min_max(b, d)

    e, q = min_max(e, q)
    f, r = min_max(f, r)
    g, s = min_max(g, s)
    h, t = min_max(h, t)
    m, y = min_max(m, y)
    v, x = min_max(v, x)
    a, b = min_max(a, b)

    e, i = min_max(e, i)
    f, j = min_max(f, j)
    g, k = min_max(g, k)
    h, l = min_max(h, l)
    m, q = min_max(m, q)
    n, r = min_max(n, r)
    o, s = min_max(o, s)
    p, t = min_max(p, t)
    u, y = min_max(u, y)

    e, g = min_max(e, g)
    f, h = min_max(f, h)
    i, k = min_max(i, k)
    j, l = min_max(j, l)
    m, o = min_max(m, o)
    n, p = min_max(n, p)
    q, s = min_max(q, s)
    r, t = min_max(r, t)
    u, w = min_max(u, w)

    c, q = min_max(c, q)
    d, r = min_max(d, r)
    g, u = min_max(g, u)
    h, v = min_max(h, v)
    k, y = min_max(k, y)

    c, i = min_max(c, i)
    d, j = min_max(d, j)
    g, m = min_max(g, m)
    h, n = min_max(h, n)
    k, q = min_max(k, q)
    l, r = min_max(l, r)
    o, u = min_max(o, u)
    p, v = min_max(p, v)
    s, y = min_max(s, y)

    c, e = min_max(c, e)
    d, f = min_max(d, f)
    g, i = min_max(g, i)
    h, j = min_max(h, j)
    k, m = min_max(k, m)
    l, n = min_max(l, n)
    o, q = min_max(o, q)
    p, r = min_max(p, r)
    s, u = min_max(s, u)
    t, v = min_max(t, v)
    w, y = min_max(w, y)

    c, d = min_max(c, d)
    e, f = min_max(e, f)
    g, h = min_max(g, h)
    i, j = min_max(i, j)
    k, l = min_max(k, l)
    m, n = min_max(m, n)
    o, p = min_max(o, p)
    q, r = min_max(q, r)
    s, t = min_max(s, t)
    u, v = min_max(u, v)
    w, x = min_max(w, x)

    b, q = min_max(b, q)
    d, s = min_max(d, s)
    f, u = min_max(f, u)
    h, w = min_max(h, w)
    j, y = min_max(j, y)

    b, i = min_max(b, i)
    d, k = min_max(d, k)
    f, m = min_max(f, m)
    h, o = min_max(h, o)
    j, q = min_max(j, q)
    l, s = min_max(l, s)
    n, u = min_max(n, u)
    p, w = min_max(p, w)
    r, y = min_max(r, y)

    b, e = min_max(b, e)
    d, g = min_max(d, g)
    f, i = min_max(f, i)
    h, k = min_max(h, k)
    j, m = min_max(j, m)
    l, o = min_max(l, o)
    n, q = min_max(n, q)
    p, s = min_max(p, s)
    r, u = min_max(r, u)
    t, w = min_max(t, w)
    v, y = min_max(v, y)

    b, c = min_max(b, c)
    d, e = min_max(d, e)
    f, g = min_max(f, g)
    h, i = min_max(h, i)
    j, k = min_max(j, k)
    l, m = min_max(l, m)
    n, o = min_max(n, o)
    p, q = min_max(p, q)
    r, s = min_max(r, s)
    t, u = min_max(t, u)
    v, w = min_max(v, w)
    x, y = min_max(x, y)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y
end

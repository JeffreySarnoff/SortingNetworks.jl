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

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T) where {T}

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

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T) where {T}

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

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T) where {T}

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

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T) where {T}

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

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T, v::T) where {T}

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

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T, v::T, w::T) where {T}

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

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T, v::T, w::T, x::T) where {T}

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

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T, v::T, w::T, x::T, y::T) where {T}

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

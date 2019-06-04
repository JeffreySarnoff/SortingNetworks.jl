#=
    Sorting networks that process 17,..25 values are given.

    These sorting networks should minimize conditional swaps.
    There may exist one or more comparable alternative solutions;
      those may perform marginally better for some kinds of hardware.
          
    Functions are written with groups of internally paralleli1zable  
    statements given together and sequential steps are separated.  

    `swapsortr(x1::T, .., xn::T)::NTuple{n,T}`
    `swapsortr(tup::NTuple{n,T})::NTuple{n,T}`
    
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
    @eval swapsortr(x::NTuple{$N, T}) where T = swapsortr(x...)
end


#=
    sorting networks for 17..25 values
    using known compact realizations
=#


#    sort 17 values with 74 maxmins in 12 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
                f::T, g::T, h::T, i::T, j::T,
                k::T, l::T, m::T, n::T, o::T,
                p::T, q::T) where {T}

    a, q = max_min(a, q)
    b, j = max_min(b, j)
    c, k = max_min(c, k)
    d, l = max_min(d, l)
    e, m = max_min(e, m)
    f, n = max_min(f, n)
    g, o = max_min(g, o)
    h, p = max_min(h, p)

    a, i = max_min(a, i)
    b, f = max_min(b, f)
    c, g = max_min(c, g)
    d, h = max_min(d, h)
    j, n = max_min(j, n)
    k, o = max_min(k, o)
    l, p = max_min(l, p)

    i, q = max_min(i, q)
    a, e = max_min(a, e)
    f, j = max_min(f, j)
    g, k = max_min(g, k)
    h, l = max_min(h, l)
    b, d = max_min(b, d)
    n, p = max_min(n, p)

    i, m = max_min(i, m)
    e, q = max_min(e, q)
    a, c = max_min(a, c)
    f, h = max_min(f, h)
    j, l = max_min(j, l)

    e, i = max_min(e, i)
    m, q = max_min(m, q)
    d, j = max_min(d, j)
    h, n = max_min(h, n)
    a, b = max_min(a, b)

    e, g = max_min(e, g)
    i, k = max_min(i, k)
    m, o = max_min(m, o)
    c, q = max_min(c, q)
    d, f = max_min(d, f)
    h, j = max_min(h, j)
    l, n = max_min(l, n)

    c, i = max_min(c, i)
    g, m = max_min(g, m)
    k, q = max_min(k, q)

    c, e = max_min(c, e)
    g, i = max_min(g, i)
    k, m = max_min(k, m)
    o, q = max_min(o, q)

    c, d = max_min(c, d)
    e, f = max_min(e, f)
    g, h = max_min(g, h)
    i, j = max_min(i, j)
    k, l = max_min(k, l)
    m, n = max_min(m, n)
    o, p = max_min(o, p)
    b, q = max_min(b, q)

    b, i = max_min(b, i)
    d, k = max_min(d, k)
    f, m = max_min(f, m)
    h, o = max_min(h, o)
    j, q = max_min(j, q)

    b, e = max_min(b, e)
    d, g = max_min(d, g)
    f, i = max_min(f, i)
    h, k = max_min(h, k)
    j, m = max_min(j, m)
    l, o = max_min(l, o)
    n, q = max_min(n, q)

    b, c = max_min(b, c)
    d, e = max_min(d, e)
    f, g = max_min(f, g)
    h, i = max_min(h, i)
    j, k = max_min(j, k)
    l, m = max_min(l, m)
    n, o = max_min(n, o)
    p, q = max_min(p, q)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q
end

#    sort 18 values with 82 maxmins in 13 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T) where {T}

    a, q = max_min(a, q)
    b, r = max_min(b, r)
    c, k = max_min(c, k)
    d, l = max_min(d, l)
    e, m = max_min(e, m)
    f, n = max_min(f, n)
    g, o = max_min(g, o)
    h, p = max_min(h, p)

    a, i = max_min(a, i)
    b, j = max_min(b, j)
    c, g = max_min(c, g)
    d, h = max_min(d, h)
    k, o = max_min(k, o)
    l, p = max_min(l, p)

    i, q = max_min(i, q)
    j, r = max_min(j, r)
    a, e = max_min(a, e)
    b, f = max_min(b, f)
    g, k = max_min(g, k)
    h, l = max_min(h, l)

    i, m = max_min(i, m)
    j, n = max_min(j, n)
    e, q = max_min(e, q)
    f, r = max_min(f, r)
    a, c = max_min(a, c)
    b, d = max_min(b, d)

    e, i = max_min(e, i)
    f, j = max_min(f, j)
    m, q = max_min(m, q)
    n, r = max_min(n, r)
    a, b = max_min(a, b)

    e, g = max_min(e, g)
    f, h = max_min(f, h)
    i, k = max_min(i, k)
    j, l = max_min(j, l)
    m, o = max_min(m, o)
    n, p = max_min(n, p)
    c, q = max_min(c, q)
    d, r = max_min(d, r)

    c, i = max_min(c, i)
    d, j = max_min(d, j)
    g, m = max_min(g, m)
    h, n = max_min(h, n)
    k, q = max_min(k, q)
    l, r = max_min(l, r)

    c, e = max_min(c, e)
    d, f = max_min(d, f)
    g, i = max_min(g, i)
    h, j = max_min(h, j)
    k, m = max_min(k, m)
    l, n = max_min(l, n)
    o, q = max_min(o, q)
    p, r = max_min(p, r)

    c, d = max_min(c, d)
    e, f = max_min(e, f)
    g, h = max_min(g, h)
    i, j = max_min(i, j)
    k, l = max_min(k, l)
    m, n = max_min(m, n)
    o, p = max_min(o, p)
    q, r = max_min(q, r)

    b, q = max_min(b, q)
    d, k = max_min(d, k)
    f, m = max_min(f, m)
    h, o = max_min(h, o)

    b, i = max_min(b, i)
    j, q = max_min(j, q)
    d, g = max_min(d, g)
    h, k = max_min(h, k)
    l, o = max_min(l, o)

    b, e = max_min(b, e)
    f, i = max_min(f, i)
    j, m = max_min(j, m)
    n, q = max_min(n, q)

    b, c = max_min(b, c)
    d, e = max_min(d, e)
    f, g = max_min(f, g)
    h, i = max_min(h, i)
    j, k = max_min(j, k)
    l, m = max_min(l, m)
    n, o = max_min(n, o)
    p, q = max_min(p, q)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r
end

#    sort 19 values with 91 maxmins in 14 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T) where {T}

    a, q = max_min(a, q)
    b, r = max_min(b, r)
    c, s = max_min(c, s)
    d, l = max_min(d, l)
    e, m = max_min(e, m)
    f, n = max_min(f, n)
    g, o = max_min(g, o)
    h, p = max_min(h, p)

    a, i = max_min(a, i)
    b, j = max_min(b, j)
    c, k = max_min(c, k)
    d, h = max_min(d, h)
    l, p = max_min(l, p)

    i, q = max_min(i, q)
    j, r = max_min(j, r)
    k, s = max_min(k, s)
    a, e = max_min(a, e)
    b, f = max_min(b, f)
    c, g = max_min(c, g)
    h, l = max_min(h, l)

    i, m = max_min(i, m)
    j, n = max_min(j, n)
    k, o = max_min(k, o)
    e, q = max_min(e, q)
    f, r = max_min(f, r)
    g, s = max_min(g, s)
    a, c = max_min(a, c)
    b, d = max_min(b, d)

    e, i = max_min(e, i)
    f, j = max_min(f, j)
    g, k = max_min(g, k)
    m, q = max_min(m, q)
    n, r = max_min(n, r)
    o, s = max_min(o, s)
    a, b = max_min(a, b)

    e, g = max_min(e, g)
    f, h = max_min(f, h)
    i, k = max_min(i, k)
    j, l = max_min(j, l)
    m, o = max_min(m, o)
    n, p = max_min(n, p)
    q, s = max_min(q, s)
    d, r = max_min(d, r)

    c, q = max_min(c, q)
    d, j = max_min(d, j)
    g, m = max_min(g, m)
    h, n = max_min(h, n)
    l, r = max_min(l, r)

    c, i = max_min(c, i)
    k, q = max_min(k, q)
    d, f = max_min(d, f)
    h, j = max_min(h, j)
    l, n = max_min(l, n)
    p, r = max_min(p, r)

    c, e = max_min(c, e)
    g, i = max_min(g, i)
    k, m = max_min(k, m)
    o, q = max_min(o, q)

    c, d = max_min(c, d)
    e, f = max_min(e, f)
    g, h = max_min(g, h)
    i, j = max_min(i, j)
    k, l = max_min(k, l)
    m, n = max_min(m, n)
    o, p = max_min(o, p)
    q, r = max_min(q, r)

    b, q = max_min(b, q)
    d, s = max_min(d, s)
    f, m = max_min(f, m)
    h, o = max_min(h, o)

    b, i = max_min(b, i)
    d, k = max_min(d, k)
    j, q = max_min(j, q)
    l, s = max_min(l, s)

    b, e = max_min(b, e)
    d, g = max_min(d, g)
    f, i = max_min(f, i)
    h, k = max_min(h, k)
    j, m = max_min(j, m)
    l, o = max_min(l, o)
    n, q = max_min(n, q)
    p, s = max_min(p, s)

    b, c = max_min(b, c)
    d, e = max_min(d, e)
    f, g = max_min(f, g)
    h, i = max_min(h, i)
    j, k = max_min(j, k)
    l, m = max_min(l, m)
    n, o = max_min(n, o)
    p, q = max_min(p, q)
    r, s = max_min(r, s)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s
end

#    sort 20 values with 97 maxmins in 14 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T) where {T}

    a, q = max_min(a, q)
    b, r = max_min(b, r)
    c, s = max_min(c, s)
    d, t = max_min(d, t)
    e, m = max_min(e, m)
    f, n = max_min(f, n)
    g, o = max_min(g, o)
    h, p = max_min(h, p)

    a, i = max_min(a, i)
    b, j = max_min(b, j)
    c, k = max_min(c, k)
    d, l = max_min(d, l)

    i, q = max_min(i, q)
    j, r = max_min(j, r)
    k, s = max_min(k, s)
    l, t = max_min(l, t)
    a, e = max_min(a, e)
    b, f = max_min(b, f)
    c, g = max_min(c, g)
    d, h = max_min(d, h)

    i, m = max_min(i, m)
    j, n = max_min(j, n)
    k, o = max_min(k, o)
    l, p = max_min(l, p)
    e, q = max_min(e, q)
    f, r = max_min(f, r)
    g, s = max_min(g, s)
    h, t = max_min(h, t)
    a, c = max_min(a, c)
    b, d = max_min(b, d)

    e, i = max_min(e, i)
    f, j = max_min(f, j)
    g, k = max_min(g, k)
    h, l = max_min(h, l)
    m, q = max_min(m, q)
    n, r = max_min(n, r)
    o, s = max_min(o, s)
    p, t = max_min(p, t)
    a, b = max_min(a, b)

    e, g = max_min(e, g)
    f, h = max_min(f, h)
    i, k = max_min(i, k)
    j, l = max_min(j, l)
    m, o = max_min(m, o)
    n, p = max_min(n, p)
    q, s = max_min(q, s)
    r, t = max_min(r, t)

    c, q = max_min(c, q)
    d, r = max_min(d, r)
    g, m = max_min(g, m)
    h, n = max_min(h, n)
    s, t = max_min(s, t)

    c, i = max_min(c, i)
    d, j = max_min(d, j)
    k, q = max_min(k, q)
    l, r = max_min(l, r)

    c, e = max_min(c, e)
    d, f = max_min(d, f)
    g, i = max_min(g, i)
    h, j = max_min(h, j)
    k, m = max_min(k, m)
    l, n = max_min(l, n)
    o, q = max_min(o, q)
    p, r = max_min(p, r)

    c, d = max_min(c, d)
    e, f = max_min(e, f)
    g, h = max_min(g, h)
    i, j = max_min(i, j)
    k, l = max_min(k, l)
    m, n = max_min(m, n)
    o, p = max_min(o, p)
    q, r = max_min(q, r)

    b, q = max_min(b, q)
    d, s = max_min(d, s)
    f, m = max_min(f, m)
    h, o = max_min(h, o)

    b, i = max_min(b, i)
    d, k = max_min(d, k)
    j, q = max_min(j, q)
    l, s = max_min(l, s)

    b, e = max_min(b, e)
    d, g = max_min(d, g)
    f, i = max_min(f, i)
    h, k = max_min(h, k)
    j, m = max_min(j, m)
    l, o = max_min(l, o)
    n, q = max_min(n, q)
    p, s = max_min(p, s)

    b, c = max_min(b, c)
    d, e = max_min(d, e)
    f, g = max_min(f, g)
    h, i = max_min(h, i)
    j, k = max_min(j, k)
    l, m = max_min(l, m)
    n, o = max_min(n, o)
    p, q = max_min(p, q)
    r, s = max_min(r, s)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t
end

#    sort 21 values with 107 maxmins in 15 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T) where {T}

    a, q = max_min(a, q)
    b, r = max_min(b, r)
    c, s = max_min(c, s)
    d, t = max_min(d, t)
    e, u = max_min(e, u)
    f, n = max_min(f, n)
    g, o = max_min(g, o)
    h, p = max_min(h, p)

    a, i = max_min(a, i)
    b, j = max_min(b, j)
    c, k = max_min(c, k)
    d, l = max_min(d, l)
    e, m = max_min(e, m)

    i, q = max_min(i, q)
    j, r = max_min(j, r)
    k, s = max_min(k, s)
    l, t = max_min(l, t)
    m, u = max_min(m, u)
    a, e = max_min(a, e)
    b, f = max_min(b, f)
    c, g = max_min(c, g)
    d, h = max_min(d, h)

    i, m = max_min(i, m)
    j, n = max_min(j, n)
    k, o = max_min(k, o)
    l, p = max_min(l, p)
    q, u = max_min(q, u)
    f, r = max_min(f, r)
    g, s = max_min(g, s)
    h, t = max_min(h, t)
    a, c = max_min(a, c)
    b, d = max_min(b, d)

    e, q = max_min(e, q)
    f, j = max_min(f, j)
    g, k = max_min(g, k)
    h, l = max_min(h, l)
    n, r = max_min(n, r)
    o, s = max_min(o, s)
    p, t = max_min(p, t)
    a, b = max_min(a, b)

    e, i = max_min(e, i)
    m, q = max_min(m, q)
    f, h = max_min(f, h)
    j, l = max_min(j, l)
    n, p = max_min(n, p)
    r, t = max_min(r, t)

    e, g = max_min(e, g)
    i, k = max_min(i, k)
    m, o = max_min(m, o)
    q, s = max_min(q, s)
    d, r = max_min(d, r)
    h, n = max_min(h, n)

    c, q = max_min(c, q)
    g, u = max_min(g, u)
    d, j = max_min(d, j)
    l, r = max_min(l, r)

    c, i = max_min(c, i)
    g, m = max_min(g, m)
    k, q = max_min(k, q)
    o, u = max_min(o, u)
    d, f = max_min(d, f)
    h, j = max_min(h, j)
    l, n = max_min(l, n)
    p, r = max_min(p, r)

    c, e = max_min(c, e)
    g, i = max_min(g, i)
    k, m = max_min(k, m)
    o, q = max_min(o, q)
    s, u = max_min(s, u)

    c, d = max_min(c, d)
    e, f = max_min(e, f)
    g, h = max_min(g, h)
    i, j = max_min(i, j)
    k, l = max_min(k, l)
    m, n = max_min(m, n)
    o, p = max_min(o, p)
    q, r = max_min(q, r)
    s, t = max_min(s, t)

    b, q = max_min(b, q)
    d, s = max_min(d, s)
    f, u = max_min(f, u)
    h, o = max_min(h, o)

    b, i = max_min(b, i)
    d, k = max_min(d, k)
    f, m = max_min(f, m)
    j, q = max_min(j, q)
    l, s = max_min(l, s)
    n, u = max_min(n, u)

    b, e = max_min(b, e)
    d, g = max_min(d, g)
    f, i = max_min(f, i)
    h, k = max_min(h, k)
    j, m = max_min(j, m)
    l, o = max_min(l, o)
    n, q = max_min(n, q)
    p, s = max_min(p, s)
    r, u = max_min(r, u)

    b, c = max_min(b, c)
    d, e = max_min(d, e)
    f, g = max_min(f, g)
    h, i = max_min(h, i)
    j, k = max_min(j, k)
    l, m = max_min(l, m)
    n, o = max_min(n, o)
    p, q = max_min(p, q)
    r, s = max_min(r, s)
    t, u = max_min(t, u)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u
end

#    sort 22 values with 114 maxmins in 15 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T, v::T) where {T}

    a, q = max_min(a, q)
    b, r = max_min(b, r)
    c, s = max_min(c, s)
    d, t = max_min(d, t)
    e, u = max_min(e, u)
    f, v = max_min(f, v)
    g, o = max_min(g, o)
    h, p = max_min(h, p)

    a, i = max_min(a, i)
    b, j = max_min(b, j)
    c, k = max_min(c, k)
    d, l = max_min(d, l)
    e, m = max_min(e, m)
    f, n = max_min(f, n)

    i, q = max_min(i, q)
    j, r = max_min(j, r)
    k, s = max_min(k, s)
    l, t = max_min(l, t)
    m, u = max_min(m, u)
    n, v = max_min(n, v)
    a, e = max_min(a, e)
    b, f = max_min(b, f)
    c, g = max_min(c, g)
    d, h = max_min(d, h)

    i, m = max_min(i, m)
    j, n = max_min(j, n)
    k, o = max_min(k, o)
    l, p = max_min(l, p)
    q, u = max_min(q, u)
    r, v = max_min(r, v)
    g, s = max_min(g, s)
    h, t = max_min(h, t)
    a, c = max_min(a, c)
    b, d = max_min(b, d)

    e, q = max_min(e, q)
    f, r = max_min(f, r)
    g, k = max_min(g, k)
    h, l = max_min(h, l)
    o, s = max_min(o, s)
    p, t = max_min(p, t)
    a, b = max_min(a, b)

    e, i = max_min(e, i)
    f, j = max_min(f, j)
    m, q = max_min(m, q)
    n, r = max_min(n, r)

    e, g = max_min(e, g)
    f, h = max_min(f, h)
    i, k = max_min(i, k)
    j, l = max_min(j, l)
    m, o = max_min(m, o)
    n, p = max_min(n, p)
    q, s = max_min(q, s)
    r, t = max_min(r, t)

    c, q = max_min(c, q)
    d, r = max_min(d, r)
    g, u = max_min(g, u)
    h, v = max_min(h, v)

    c, i = max_min(c, i)
    d, j = max_min(d, j)
    g, m = max_min(g, m)
    h, n = max_min(h, n)
    k, q = max_min(k, q)
    l, r = max_min(l, r)
    o, u = max_min(o, u)
    p, v = max_min(p, v)

    c, e = max_min(c, e)
    d, f = max_min(d, f)
    g, i = max_min(g, i)
    h, j = max_min(h, j)
    k, m = max_min(k, m)
    l, n = max_min(l, n)
    o, q = max_min(o, q)
    p, r = max_min(p, r)
    s, u = max_min(s, u)
    t, v = max_min(t, v)

    c, d = max_min(c, d)
    e, f = max_min(e, f)
    g, h = max_min(g, h)
    i, j = max_min(i, j)
    k, l = max_min(k, l)
    m, n = max_min(m, n)
    o, p = max_min(o, p)
    q, r = max_min(q, r)
    s, t = max_min(s, t)
    u, v = max_min(u, v)

    b, q = max_min(b, q)
    d, s = max_min(d, s)
    f, u = max_min(f, u)
    h, o = max_min(h, o)

    b, i = max_min(b, i)
    d, k = max_min(d, k)
    f, m = max_min(f, m)
    j, q = max_min(j, q)
    l, s = max_min(l, s)
    n, u = max_min(n, u)

    b, e = max_min(b, e)
    d, g = max_min(d, g)
    f, i = max_min(f, i)
    h, k = max_min(h, k)
    j, m = max_min(j, m)
    l, o = max_min(l, o)
    n, q = max_min(n, q)
    p, s = max_min(p, s)
    r, u = max_min(r, u)

    b, c = max_min(b, c)
    d, e = max_min(d, e)
    f, g = max_min(f, g)
    h, i = max_min(h, i)
    j, k = max_min(j, k)
    l, m = max_min(l, m)
    n, o = max_min(n, o)
    p, q = max_min(p, q)
    r, s = max_min(r, s)
    t, u = max_min(t, u)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v
end

#    sort 23 values with 122 maxmins in 15 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T, v::T, w::T) where {T}

    a, q = max_min(a, q)
    b, r = max_min(b, r)
    c, s = max_min(c, s)
    d, t = max_min(d, t)
    e, u = max_min(e, u)
    f, v = max_min(f, v)
    g, w = max_min(g, w)
    h, p = max_min(h, p)

    a, i = max_min(a, i)
    b, j = max_min(b, j)
    c, k = max_min(c, k)
    d, l = max_min(d, l)
    e, m = max_min(e, m)
    f, n = max_min(f, n)
    g, o = max_min(g, o)

    i, q = max_min(i, q)
    j, r = max_min(j, r)
    k, s = max_min(k, s)
    l, t = max_min(l, t)
    m, u = max_min(m, u)
    n, v = max_min(n, v)
    o, w = max_min(o, w)
    a, e = max_min(a, e)
    b, f = max_min(b, f)
    c, g = max_min(c, g)
    d, h = max_min(d, h)

    i, m = max_min(i, m)
    j, n = max_min(j, n)
    k, o = max_min(k, o)
    l, p = max_min(l, p)
    q, u = max_min(q, u)
    r, v = max_min(r, v)
    s, w = max_min(s, w)
    h, t = max_min(h, t)
    a, c = max_min(a, c)
    b, d = max_min(b, d)

    e, q = max_min(e, q)
    f, r = max_min(f, r)
    g, s = max_min(g, s)
    h, l = max_min(h, l)
    p, t = max_min(p, t)
    u, w = max_min(u, w)
    a, b = max_min(a, b)

    e, i = max_min(e, i)
    f, j = max_min(f, j)
    g, k = max_min(g, k)
    m, q = max_min(m, q)
    n, r = max_min(n, r)
    o, s = max_min(o, s)

    e, g = max_min(e, g)
    f, h = max_min(f, h)
    i, k = max_min(i, k)
    j, l = max_min(j, l)
    m, o = max_min(m, o)
    n, p = max_min(n, p)
    q, s = max_min(q, s)
    r, t = max_min(r, t)

    c, q = max_min(c, q)
    d, r = max_min(d, r)
    g, u = max_min(g, u)
    h, v = max_min(h, v)

    c, i = max_min(c, i)
    d, j = max_min(d, j)
    g, m = max_min(g, m)
    h, n = max_min(h, n)
    k, q = max_min(k, q)
    l, r = max_min(l, r)
    o, u = max_min(o, u)
    p, v = max_min(p, v)

    c, e = max_min(c, e)
    d, f = max_min(d, f)
    g, i = max_min(g, i)
    h, j = max_min(h, j)
    k, m = max_min(k, m)
    l, n = max_min(l, n)
    o, q = max_min(o, q)
    p, r = max_min(p, r)
    s, u = max_min(s, u)
    t, v = max_min(t, v)

    c, d = max_min(c, d)
    e, f = max_min(e, f)
    g, h = max_min(g, h)
    i, j = max_min(i, j)
    k, l = max_min(k, l)
    m, n = max_min(m, n)
    o, p = max_min(o, p)
    q, r = max_min(q, r)
    s, t = max_min(s, t)
    u, v = max_min(u, v)

    b, q = max_min(b, q)
    d, s = max_min(d, s)
    f, u = max_min(f, u)
    h, w = max_min(h, w)

    b, i = max_min(b, i)
    d, k = max_min(d, k)
    f, m = max_min(f, m)
    h, o = max_min(h, o)
    j, q = max_min(j, q)
    l, s = max_min(l, s)
    n, u = max_min(n, u)
    p, w = max_min(p, w)

    b, e = max_min(b, e)
    d, g = max_min(d, g)
    f, i = max_min(f, i)
    h, k = max_min(h, k)
    j, m = max_min(j, m)
    l, o = max_min(l, o)
    n, q = max_min(n, q)
    p, s = max_min(p, s)
    r, u = max_min(r, u)
    t, w = max_min(t, w)

    b, c = max_min(b, c)
    d, e = max_min(d, e)
    f, g = max_min(f, g)
    h, i = max_min(h, i)
    j, k = max_min(j, k)
    l, m = max_min(l, m)
    n, o = max_min(n, o)
    p, q = max_min(p, q)
    r, s = max_min(r, s)
    t, u = max_min(t, u)
    v, w = max_min(v, w)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w
end

#    sort 24 values with 127 maxmins in 15 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T, v::T, w::T, x::T) where {T}

    a, q = max_min(a, q)
    b, r = max_min(b, r)
    c, s = max_min(c, s)
    d, t = max_min(d, t)
    e, u = max_min(e, u)
    f, v = max_min(f, v)
    g, w = max_min(g, w)
    h, x = max_min(h, x)

    a, i = max_min(a, i)
    b, j = max_min(b, j)
    c, k = max_min(c, k)
    d, l = max_min(d, l)
    e, m = max_min(e, m)
    f, n = max_min(f, n)
    g, o = max_min(g, o)
    h, p = max_min(h, p)

    i, q = max_min(i, q)
    j, r = max_min(j, r)
    k, s = max_min(k, s)
    l, t = max_min(l, t)
    m, u = max_min(m, u)
    n, v = max_min(n, v)
    o, w = max_min(o, w)
    p, x = max_min(p, x)
    a, e = max_min(a, e)
    b, f = max_min(b, f)
    c, g = max_min(c, g)
    d, h = max_min(d, h)

    i, m = max_min(i, m)
    j, n = max_min(j, n)
    k, o = max_min(k, o)
    l, p = max_min(l, p)
    q, u = max_min(q, u)
    r, v = max_min(r, v)
    s, w = max_min(s, w)
    t, x = max_min(t, x)
    a, c = max_min(a, c)
    b, d = max_min(b, d)

    e, q = max_min(e, q)
    f, r = max_min(f, r)
    g, s = max_min(g, s)
    h, t = max_min(h, t)
    u, w = max_min(u, w)
    v, x = max_min(v, x)
    a, b = max_min(a, b)

    e, i = max_min(e, i)
    f, j = max_min(f, j)
    g, k = max_min(g, k)
    h, l = max_min(h, l)
    m, q = max_min(m, q)
    n, r = max_min(n, r)
    o, s = max_min(o, s)
    p, t = max_min(p, t)
    w, x = max_min(w, x)

    e, g = max_min(e, g)
    f, h = max_min(f, h)
    i, k = max_min(i, k)
    j, l = max_min(j, l)
    m, o = max_min(m, o)
    n, p = max_min(n, p)
    q, s = max_min(q, s)
    r, t = max_min(r, t)

    c, q = max_min(c, q)
    d, r = max_min(d, r)
    g, u = max_min(g, u)
    h, v = max_min(h, v)

    c, i = max_min(c, i)
    d, j = max_min(d, j)
    g, m = max_min(g, m)
    h, n = max_min(h, n)
    k, q = max_min(k, q)
    l, r = max_min(l, r)
    o, u = max_min(o, u)
    p, v = max_min(p, v)

    c, e = max_min(c, e)
    d, f = max_min(d, f)
    g, i = max_min(g, i)
    h, j = max_min(h, j)
    k, m = max_min(k, m)
    l, n = max_min(l, n)
    o, q = max_min(o, q)
    p, r = max_min(p, r)
    s, u = max_min(s, u)
    t, v = max_min(t, v)

    c, d = max_min(c, d)
    e, f = max_min(e, f)
    g, h = max_min(g, h)
    i, j = max_min(i, j)
    k, l = max_min(k, l)
    m, n = max_min(m, n)
    o, p = max_min(o, p)
    q, r = max_min(q, r)
    s, t = max_min(s, t)
    u, v = max_min(u, v)

    b, q = max_min(b, q)
    d, s = max_min(d, s)
    f, u = max_min(f, u)
    h, w = max_min(h, w)

    b, i = max_min(b, i)
    d, k = max_min(d, k)
    f, m = max_min(f, m)
    h, o = max_min(h, o)
    j, q = max_min(j, q)
    l, s = max_min(l, s)
    n, u = max_min(n, u)
    p, w = max_min(p, w)

    b, e = max_min(b, e)
    d, g = max_min(d, g)
    f, i = max_min(f, i)
    h, k = max_min(h, k)
    j, m = max_min(j, m)
    l, o = max_min(l, o)
    n, q = max_min(n, q)
    p, s = max_min(p, s)
    r, u = max_min(r, u)
    t, w = max_min(t, w)

    b, c = max_min(b, c)
    d, e = max_min(d, e)
    f, g = max_min(f, g)
    h, i = max_min(h, i)
    j, k = max_min(j, k)
    l, m = max_min(l, m)
    n, o = max_min(n, o)
    p, q = max_min(p, q)
    r, s = max_min(r, s)
    t, u = max_min(t, u)
    v, w = max_min(v, w)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x
end

#    sort 25 values with 138 maxmins in 15 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T, q::T, r::T, s::T, t::T,
              u::T, v::T, w::T, x::T, y::T) where {T}

    a, q = max_min(a, q)
    b, r = max_min(b, r)
    c, s = max_min(c, s)
    d, t = max_min(d, t)
    e, u = max_min(e, u)
    f, v = max_min(f, v)
    g, w = max_min(g, w)
    h, x = max_min(h, x)
    i, y = max_min(i, y)

    a, i = max_min(a, i)
    b, j = max_min(b, j)
    c, k = max_min(c, k)
    d, l = max_min(d, l)
    e, m = max_min(e, m)
    f, n = max_min(f, n)
    g, o = max_min(g, o)
    h, p = max_min(h, p)
    q, y = max_min(q, y)

    i, q = max_min(i, q)
    j, r = max_min(j, r)
    k, s = max_min(k, s)
    l, t = max_min(l, t)
    m, u = max_min(m, u)
    n, v = max_min(n, v)
    o, w = max_min(o, w)
    p, x = max_min(p, x)
    a, e = max_min(a, e)
    b, f = max_min(b, f)
    c, g = max_min(c, g)
    d, h = max_min(d, h)

    i, m = max_min(i, m)
    j, n = max_min(j, n)
    k, o = max_min(k, o)
    l, p = max_min(l, p)
    q, u = max_min(q, u)
    r, v = max_min(r, v)
    s, w = max_min(s, w)
    t, x = max_min(t, x)
    a, c = max_min(a, c)
    b, d = max_min(b, d)

    e, q = max_min(e, q)
    f, r = max_min(f, r)
    g, s = max_min(g, s)
    h, t = max_min(h, t)
    m, y = max_min(m, y)
    v, x = max_min(v, x)
    a, b = max_min(a, b)

    e, i = max_min(e, i)
    f, j = max_min(f, j)
    g, k = max_min(g, k)
    h, l = max_min(h, l)
    m, q = max_min(m, q)
    n, r = max_min(n, r)
    o, s = max_min(o, s)
    p, t = max_min(p, t)
    u, y = max_min(u, y)

    e, g = max_min(e, g)
    f, h = max_min(f, h)
    i, k = max_min(i, k)
    j, l = max_min(j, l)
    m, o = max_min(m, o)
    n, p = max_min(n, p)
    q, s = max_min(q, s)
    r, t = max_min(r, t)
    u, w = max_min(u, w)

    c, q = max_min(c, q)
    d, r = max_min(d, r)
    g, u = max_min(g, u)
    h, v = max_min(h, v)
    k, y = max_min(k, y)

    c, i = max_min(c, i)
    d, j = max_min(d, j)
    g, m = max_min(g, m)
    h, n = max_min(h, n)
    k, q = max_min(k, q)
    l, r = max_min(l, r)
    o, u = max_min(o, u)
    p, v = max_min(p, v)
    s, y = max_min(s, y)

    c, e = max_min(c, e)
    d, f = max_min(d, f)
    g, i = max_min(g, i)
    h, j = max_min(h, j)
    k, m = max_min(k, m)
    l, n = max_min(l, n)
    o, q = max_min(o, q)
    p, r = max_min(p, r)
    s, u = max_min(s, u)
    t, v = max_min(t, v)
    w, y = max_min(w, y)

    c, d = max_min(c, d)
    e, f = max_min(e, f)
    g, h = max_min(g, h)
    i, j = max_min(i, j)
    k, l = max_min(k, l)
    m, n = max_min(m, n)
    o, p = max_min(o, p)
    q, r = max_min(q, r)
    s, t = max_min(s, t)
    u, v = max_min(u, v)
    w, x = max_min(w, x)

    b, q = max_min(b, q)
    d, s = max_min(d, s)
    f, u = max_min(f, u)
    h, w = max_min(h, w)
    j, y = max_min(j, y)

    b, i = max_min(b, i)
    d, k = max_min(d, k)
    f, m = max_min(f, m)
    h, o = max_min(h, o)
    j, q = max_min(j, q)
    l, s = max_min(l, s)
    n, u = max_min(n, u)
    p, w = max_min(p, w)
    r, y = max_min(r, y)

    b, e = max_min(b, e)
    d, g = max_min(d, g)
    f, i = max_min(f, i)
    h, k = max_min(h, k)
    j, m = max_min(j, m)
    l, o = max_min(l, o)
    n, q = max_min(n, q)
    p, s = max_min(p, s)
    r, u = max_min(r, u)
    t, w = max_min(t, w)
    v, y = max_min(v, y)

    b, c = max_min(b, c)
    d, e = max_min(d, e)
    f, g = max_min(f, g)
    h, i = max_min(h, i)
    j, k = max_min(j, k)
    l, m = max_min(l, m)
    n, o = max_min(n, o)
    p, q = max_min(p, q)
    r, s = max_min(r, s)
    t, u = max_min(t, u)
    v, w = max_min(v, w)
    x, y = max_min(x, y)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y
end

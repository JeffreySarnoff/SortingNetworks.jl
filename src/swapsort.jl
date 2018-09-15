#=
    Sorting networks that process 1,2,..16 values are given.
    Sorting networks that process 17..25 values are given in "swapsort_17to25.jl".

    These sorting networks should minimize conditional swaps.  
    The first sixteen are known to minimize conditional swaps.  
    
    Functions are written with groups of internally parallelizable  
    statements given together and sequential steps are separated.  

    `swapsort(x1::T, .., xn::T)::NTuple{n,T}`
    `swapsort(tup::NTuple{n,T})::NTuple{n,T}`
    `swapsort(vec::Vector{T})::NTuple{N,T}`
    
    networks were selected using software by John Gamble
        http://pages.ripco.net/~jgamble/nw.html
        http://search.cpan.org/dist/Algorithm-Networksort/
=#

const VALS = ([Val{i} for i=1:16]...,)

@inline function swapsort(vec::Vector{T}) where {T}
    n = length(vec)
    n <= 16 && return swapsort(VALS[length(vec)], vec)
    throw(ErrorException("swapsort(vector) not defined where length(vector) > 16"))
end

#    sort 1 value with 0 minmaxs in 1 stage

function swapsort(a::T) where {T}
    return (a,)
end

@inline swapsort(x::NTuple{1,T}) where {T} = swapsort(x[1])
@inline swapsort(::Type{Val{1}}, x::Vector{T}) where {T} = swapsort(x[1])

#    sort 2 values with 1 minmaxs in 1 stage

function swapsort(a::T, b::T) where {T}

    a, b = minmax(a, b)

    return a,b
end

@inline swapsort(x::NTuple{2,T}) where {T} = swapsort(x[1], x[2])
@inline swapsort(::Type{Val{2}}, x::Vector{T}) where {T} = swapsort(x[1], x[2])

#    sort 3 values with 3 minmaxs in 3 parallel stages

function swapsort(a::T, b::T, c::T) where {T}

    b, c = minmax(b, c)

    a, c = minmax(a, c)

    a, b = minmax(a, b)

    return a, b, c
end

@inline swapsort(x::NTuple{3,T}) where {T} = swapsort(x[1], x[2], x[3])
@inline swapsort(::Type{Val{3}}, x::Vector{T}) where {T} = swapsort(x[1], x[2], x[3])
    
#    sort 4 values with 5 minmaxs in 3 parallel stages

function swapsort(a::T, b::T, c::T, d::T) where {T}

    a, b = minmax(a, b)
    c, d = minmax(c, d)

    a, c = minmax(a, c)
    b, d = minmax(b, d)

    b, c = minmax(b, c)

    return a, b, c, d
end

@inline swapsort(x::NTuple{4,T}) where {T} = swapsort(x[1], x[2], x[3], x[4])
@inline swapsort(::Type{Val{4}}, x::Vector{T}) where {T} = swapsort(x[1], x[2], x[3], x[4])

#    sort 5 values with 9 minmaxs in 5 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T) where {T}

    b, c = minmax(b, c)
    d, e = minmax(d, e)

    b, d = minmax(b, d)
    a, c = minmax(a, c)

    c, e = minmax(c, e)
    a, d = minmax(a, d)

    a, b = minmax(a, b)
    c, d = minmax(c, d)

    b, c = minmax(b, c)

    return a, b, c, d, e
end

@inline swapsort(x::NTuple{5,T}) where {T} = swapsort(x[1], x[2], x[3], x[4], x[5])
@inline swapsort(::Type{Val{5}}, x::Vector{T}) where {T} = swapsort(x[1], x[2], x[3], x[4], x[5])

#    sort 6 values with 12 minmaxs in 6 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T) where {T}

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

@inline swapsort(x::NTuple{6,T}) where {T} = swapsort(x[1], x[2], x[3], x[4], x[5], x[6])
@inline swapsort(::Type{Val{6}}, x::Vector{T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6])

#    sort 7 values with 16 minmaxs in 6 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T) where {T}

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

@inline swapsort(x::NTuple{7,T}) where {T} = swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7])
@inline swapsort(::Type{Val{7}}, x::Vector{T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7])

#    sort 8 values with 19 minmaxs in 7 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T) where {T}

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

@inline swapsort(x::NTuple{8,T}) where {T} = swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8])
@inline swapsort(::Type{Val{8}}, x::Vector{T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8])

#    sort 9 values with 25 minmaxs in 9 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T) where {T}

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

@inline swapsort(x::NTuple{9,T}) where {T} = swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9])
@inline swapsort(::Type{Val{9}}, x::Vector{T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9])

#    sort 10 values with 29 minmaxs in 9 parallel stages

function swapsort(a::T,b::T,c::T,d::T,e::T,
              f::T,g::T,h::T,i::T,j::T) where {T}

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

@inline swapsort(x::NTuple{10,T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10])
@inline swapsort(::Type{Val{10}}, x::Vector{T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10])

#    sort 11 values with 35 minmaxs in 9 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T) where {T}

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

@inline swapsort(x::NTuple{11,T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11])
@inline swapsort(::Type{Val{11}}, x::Vector{T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11])

#    sort 12 values with 39 minmaxs in 9 parallel stages

function swapsort(a::T,b::T,c::T,d::T,e::T,
              f::T,g::T,h::T,i::T,j::T,
              k::T,l::T) where {T}

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

@inline swapsort(x::NTuple{12,T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12])
@inline swapsort(::Type{Val{12}}, x::Vector{T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12])

#    sort 13 values with 45 minmaxs in 10 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T) where {T}

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

@inline swapsort(x::NTuple{13,T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13])
@inline swapsort(::Type{Val{13}}, x::Vector{T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13])

#    sort 14 values with 51 minmaxs in 10 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T) where {T}

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

@inline swapsort(x::NTuple{14,T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13], x[14])
@inline swapsort(::Type{Val{14}}, x::Vector{T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13], x[14])

#    sort 15 values with 56 minmaxs in 10 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T) where {T}

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

@inline swapsort(x::NTuple{15,T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13], x[14], x[15])
@inline swapsort(::Type{Val{15}}, x::Vector{T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13], x[14], x[15])

#    sort 16 values with 60 minmaxs in 10 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T) where {T}

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

@inline swapsort(x::NTuple{16,T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13], x[14], x[15], x[16])
@inline swapsort(::Type{Val{16}}, x::Vector{T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13], x[14], x[15], x[16])

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

    a, b = min_max(a, b)

    return a,b
end

@inline swapsort(x::NTuple{2,T}) where {T} = swapsort(x[1], x[2])
@inline swapsort(::Type{Val{2}}, x::Vector{T}) where {T} = swapsort(x[1], x[2])

#    sort 3 values with 3 minmaxs in 3 parallel stages

function swapsort(a::T, b::T, c::T) where {T}

    b, c = min_max(b, c)

    a, c = min_max(a, c)

    a, b = min_max(a, b)

    return a, b, c
end

@inline swapsort(x::NTuple{3,T}) where {T} = swapsort(x[1], x[2], x[3])
@inline swapsort(::Type{Val{3}}, x::Vector{T}) where {T} = swapsort(x[1], x[2], x[3])
    
#    sort 4 values with 5 minmaxs in 3 parallel stages

function swapsort(a::T, b::T, c::T, d::T) where {T}

    a, b = min_max(a, b)
    c, d = min_max(c, d)

    a, c = min_max(a, c)
    b, d = min_max(b, d)

    b, c = min_max(b, c)

    return a, b, c, d
end

@inline swapsort(x::NTuple{4,T}) where {T} = swapsort(x[1], x[2], x[3], x[4])
@inline swapsort(::Type{Val{4}}, x::Vector{T}) where {T} = swapsort(x[1], x[2], x[3], x[4])

#    sort 5 values with 9 minmaxs in 5 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T) where {T}

    b, c = min_max(b, c)
    d, e = min_max(d, e)

    b, d = min_max(b, d)
    a, c = min_max(a, c)

    c, e = min_max(c, e)
    a, d = min_max(a, d)

    a, b = min_max(a, b)
    c, d = min_max(c, d)

    b, c = min_max(b, c)

    return a, b, c, d, e
end

@inline swapsort(x::NTuple{5,T}) where {T} = swapsort(x[1], x[2], x[3], x[4], x[5])
@inline swapsort(::Type{Val{5}}, x::Vector{T}) where {T} = swapsort(x[1], x[2], x[3], x[4], x[5])

#    sort 6 values with 12 minmaxs in 6 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T) where {T}

    b, c = min_max(b, c)
    e, f = min_max(e, f)

    a, c = min_max(a, c)
    d, f = min_max(d, f)

    a, b = min_max(a, b)
    d, e = min_max(d, e)
    c, f = min_max(c, f)

    a, d = min_max(a, d)
    b, e = min_max(b, e)

    c, e = min_max(c, e)
    b, d = min_max(b, d)

    c, d = min_max(c, d)

    return a, b, c, d, e, f
end

@inline swapsort(x::NTuple{6,T}) where {T} = swapsort(x[1], x[2], x[3], x[4], x[5], x[6])
@inline swapsort(::Type{Val{6}}, x::Vector{T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6])

#    sort 7 values with 16 minmaxs in 6 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T) where {T}

    a, e = min_max(a, e)
    b, f = min_max(b, f)
    c, g = min_max(c, g)

    a, c = min_max(a, c)
    b, d = min_max(b, d)
    e, g = min_max(e, g)

    c, e = min_max(c, e)
    d, f = min_max(d, f)
    a, b = min_max(a, b)

    c, d = min_max(c, d)
    e, f = min_max(e, f)

    b, e = min_max(b, e)
    d, g = min_max(d, g)

    b, c = min_max(b, c)
    d, e = min_max(d, e)
    f, g = min_max(f, g)

    return a, b, c, d, e, f, g
end

@inline swapsort(x::NTuple{7,T}) where {T} = swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7])
@inline swapsort(::Type{Val{7}}, x::Vector{T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7])

#    sort 8 values with 19 minmaxs in 7 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T) where {T}

    a, b = min_max(a, b)
    c, d = min_max(c, d)
    e, f = min_max(e, f)
    g, h = min_max(g, h)

    a, c = min_max(a, c)
    b, d = min_max(b, d)
    e, g = min_max(e, g)
    f, h = min_max(f, h)

    b, c = min_max(b, c)
    f, g = min_max(f, g)
    a, e = min_max(a, e)
    d, h = min_max(d, h)

    b, f = min_max(b, f)
    c, g = min_max(c, g)

    b, e = min_max(b, e)
    d, g = min_max(d, g)

    c, e = min_max(c, e)
    d, f = min_max(d, f)

    d, e = min_max(d, e)

    return a, b, c, d, e, f, g, h
end

@inline swapsort(x::NTuple{8,T}) where {T} = swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8])
@inline swapsort(::Type{Val{8}}, x::Vector{T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8])

#    sort 9 values with 25 minmaxs in 9 parallel stages

function swapsort(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T) where {T}

    a, b = min_max(a, b)
    d, e = min_max(d, e)
    g, h = min_max(g, h)

    b, c = min_max(b, c)
    e, f = min_max(e, f)
    h, i = min_max(h, i)

    a, b = min_max(a, b)
    d, e = min_max(d, e)
    g, h = min_max(g, h)
    c, f = min_max(c, f)

    a, d = min_max(a, d)
    b, e = min_max(b, e)
    f, i = min_max(f, i)

    d, g = min_max(d, g)
    e, h = min_max(e, h)
    c, f = min_max(c, f)

    a, d = min_max(a, d)
    b, e = min_max(b, e)
    f, h = min_max(f, h)
    c, g = min_max(c, g)

    b, d = min_max(b, d)
    e, g = min_max(e, g)

    c, e = min_max(c, e)
    f, g = min_max(f, g)

    c, d = min_max(c, d)

    return a, b, c, d, e, f, g, h, i
end

@inline swapsort(x::NTuple{9,T}) where {T} = swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9])
@inline swapsort(::Type{Val{9}}, x::Vector{T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9])

#    sort 10 values with 29 minmaxs in 9 parallel stages

function swapsort(a::T,b::T,c::T,d::T,e::T,
              f::T,g::T,h::T,i::T,j::T) where {T}

    e, j = min_max(e, j)
    d, i = min_max(d, i)
    c, h = min_max(c, h)
    b, g = min_max(b, g)
    a, f = min_max(a, f)

    b, e = min_max(b, e)
    g, j = min_max(g, j)
    a, d = min_max(a, d)
    f, i = min_max(f, i)

    a, c = min_max(a, c)
    d, g = min_max(d, g)
    h, j = min_max(h, j)

    a, b = min_max(a, b)
    c, e = min_max(c, e)
    f, h = min_max(f, h)
    i, j = min_max(i, j)

    b, c = min_max(b, c)
    e, g = min_max(e, g)
    h, i = min_max(h, i)
    d, f = min_max(d, f)

    c, f = min_max(c, f)
    g, i = min_max(g, i)
    b, d = min_max(b, d)
    e, h = min_max(e, h)

    c, d = min_max(c, d)
    g, h = min_max(g, h)

    d, e = min_max(d, e)
    f, g = min_max(f, g)

    e, f = min_max(e, f)

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

    a, b = min_max(a, b)
    c, d = min_max(c, d)
    e, f = min_max(e, f)
    g, h = min_max(g, h)
    i, j = min_max(i, j)

    b, d = min_max(b, d)
    f, h = min_max(f, h)
    a, c = min_max(a, c)
    e, g = min_max(e, g)
    i, k = min_max(i, k)

    b, c = min_max(b, c)
    f, g = min_max(f, g)
    j, k = min_max(j, k)
    a, e = min_max(a, e)
    d, h = min_max(d, h)

    b, f = min_max(b, f)
    g, k = min_max(g, k)
    e, i = min_max(e, i)

    f, j = min_max(f, j)
    c, g = min_max(c, g)
    a, e = min_max(a, e)
    d, i = min_max(d, i)

    b, f = min_max(b, f)
    g, k = min_max(g, k)
    c, d = min_max(c, d)
    i, j = min_max(i, j)

    b, e = min_max(b, e)
    h, k = min_max(h, k)
    d, f = min_max(d, f)
    g, i = min_max(g, i)

    c, e = min_max(c, e)
    h, j = min_max(h, j)
    f, g = min_max(f, g)

    d, e = min_max(d, e)
    h, i = min_max(h, i)

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

    a, b = min_max(a, b)
    c, d = min_max(c, d)
    e, f = min_max(e, f)
    g, h = min_max(g, h)
    i, j = min_max(i, j)
    k, l = min_max(k, l)

    b, d = min_max(b, d)
    f, h = min_max(f, h)
    j, l = min_max(j, l)
    a, c = min_max(a, c)
    e, g = min_max(e, g)
    i, k = min_max(i, k)

    b, c = min_max(b, c)
    f, g = min_max(f, g)
    j, k = min_max(j, k)
    a, e = min_max(a, e)
    h, l = min_max(h, l)

    b, f = min_max(b, f)
    g, k = min_max(g, k)
    d, h = min_max(d, h)
    e, i = min_max(e, i)

    f, j = min_max(f, j)
    c, g = min_max(c, g)
    a, e = min_max(a, e)
    h, l = min_max(h, l)
    d, i = min_max(d, i)

    b, f = min_max(b, f)
    g, k = min_max(g, k)
    c, d = min_max(c, d)
    i, j = min_max(i, j)

    b, e = min_max(b, e)
    h, k = min_max(h, k)
    d, f = min_max(d, f)
    g, i = min_max(g, i)

    c, e = min_max(c, e)
    h, j = min_max(h, j)
    f, g = min_max(f, g)

    d, e = min_max(d, e)
    h, i = min_max(h, i)

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

    b, h = min_max(b, h)
    j, l = min_max(j, l)
    d, e = min_max(d, e)
    f, i = min_max(f, i)
    a, m = min_max(a, m)
    c, g = min_max(c, g)

    a, b = min_max(a, b)
    c, d = min_max(c, d)
    e, g = min_max(e, g)
    i, l = min_max(i, l)
    h, m = min_max(h, m)
    f, j = min_max(f, j)

    a, c = min_max(a, c)
    d, h = min_max(d, h)
    k, l = min_max(k, l)
    b, e = min_max(b, e)
    g, m = min_max(g, m)

    h, i = min_max(h, i)
    l, m = min_max(l, m)
    e, j = min_max(e, j)
    g, k = min_max(g, k)

    d, e = min_max(d, e)
    f, g = min_max(f, g)
    i, j = min_max(i, j)
    k, l = min_max(k, l)
    b, h = min_max(b, h)

    c, g = min_max(c, g)
    j, l = min_max(j, l)
    b, d = min_max(b, d)
    e, h = min_max(e, h)
    i, k = min_max(i, k)
    a, f = min_max(a, f)

    c, f = min_max(c, f)
    g, i = min_max(g, i)
    j, k = min_max(j, k)

    b, c = min_max(b, c)
    d, f = min_max(d, f)
    h, i = min_max(h, i)
    e, g = min_max(e, g)

    c, d = min_max(c, d)
    e, f = min_max(e, f)
    g, h = min_max(g, h)
    i, j = min_max(i, j)

    d, e = min_max(d, e)
    f, g = min_max(f, g)

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

    a, b = min_max(a, b)
    c, d = min_max(c, d)
    e, f = min_max(e, f)
    g, h = min_max(g, h)
    i, j = min_max(i, j)
    k, l = min_max(k, l)
    m, n = min_max(m, n)

    a, c = min_max(a, c)
    e, g = min_max(e, g)
    i, k = min_max(i, k)
    b, d = min_max(b, d)
    f, h = min_max(f, h)
    j, l = min_max(j, l)

    a, e = min_max(a, e)
    i, m = min_max(i, m)
    b, f = min_max(b, f)
    j, n = min_max(j, n)
    c, g = min_max(c, g)
    d, h = min_max(d, h)

    a, i = min_max(a, i)
    b, j = min_max(b, j)
    c, k = min_max(c, k)
    d, l = min_max(d, l)
    e, m = min_max(e, m)
    f, n = min_max(f, n)

    f, k = min_max(f, k)
    g, j = min_max(g, j)
    d, m = min_max(d, m)
    h, l = min_max(h, l)
    b, c = min_max(b, c)
    e, i = min_max(e, i)

    b, e = min_max(b, e)
    h, n = min_max(h, n)
    c, i = min_max(c, i)
    f, g = min_max(f, g)
    j, k = min_max(j, k)

    c, e = min_max(c, e)
    l, n = min_max(l, n)
    d, i = min_max(d, i)
    h, m = min_max(h, m)

    g, i = min_max(g, i)
    k, m = min_max(k, m)
    d, f = min_max(d, f)
    h, j = min_max(h, j)

    d, e = min_max(d, e)
    f, g = min_max(f, g)
    h, i = min_max(h, i)
    j, k = min_max(j, k)
    l, m = min_max(l, m)

    g, h = min_max(g, h)
    i, j = min_max(i, j)

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

    a, b = min_max(a, b)
    c, d = min_max(c, d)
    e, f = min_max(e, f)
    g, h = min_max(g, h)
    i, j = min_max(i, j)
    k, l = min_max(k, l)
    m, n = min_max(m, n)

    a, c = min_max(a, c)
    e, g = min_max(e, g)
    i, k = min_max(i, k)
    m, o = min_max(m, o)
    b, d = min_max(b, d)
    f, h = min_max(f, h)
    j, l = min_max(j, l)

    a, e = min_max(a, e)
    i, m = min_max(i, m)
    b, f = min_max(b, f)
    j, n = min_max(j, n)
    c, g = min_max(c, g)
    k, o = min_max(k, o)
    d, h = min_max(d, h)

    a, i = min_max(a, i)
    b, j = min_max(b, j)
    c, k = min_max(c, k)
    d, l = min_max(d, l)
    e, m = min_max(e, m)
    f, n = min_max(f, n)
    g, o = min_max(g, o)

    f, k = min_max(f, k)
    g, j = min_max(g, j)
    d, m = min_max(d, m)
    n, o = min_max(n, o)
    h, l = min_max(h, l)
    b, c = min_max(b, c)
    e, i = min_max(e, i)

    b, e = min_max(b, e)
    h, n = min_max(h, n)
    c, i = min_max(c, i)
    l, o = min_max(l, o)
    f, g = min_max(f, g)
    j, k = min_max(j, k)

    c, e = min_max(c, e)
    l, n = min_max(l, n)
    d, i = min_max(d, i)
    h, m = min_max(h, m)

    g, i = min_max(g, i)
    k, m = min_max(k, m)
    d, f = min_max(d, f)
    h, j = min_max(h, j)

    d, e = min_max(d, e)
    f, g = min_max(f, g)
    h, i = min_max(h, i)
    j, k = min_max(j, k)
    l, m = min_max(l, m)

    g, h = min_max(g, h)
    i, j = min_max(i, j)

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

    a, b = min_max(a, b)
    c, d = min_max(c, d)
    e, f = min_max(e, f)
    g, h = min_max(g, h)
    i, j = min_max(i, j)
    k, l = min_max(k, l)
    m, n = min_max(m, n)
    o, p = min_max(o, p)

    a, c = min_max(a, c)
    e, g = min_max(e, g)
    i, k = min_max(i, k)
    m, o = min_max(m, o)
    b, d = min_max(b, d)
    f, h = min_max(f, h)
    j, l = min_max(j, l)
    n, p = min_max(n, p)

    a, e = min_max(a, e)
    i, m = min_max(i, m)
    b, f = min_max(b, f)
    j, n = min_max(j, n)
    c, g = min_max(c, g)
    k, o = min_max(k, o)
    d, h = min_max(d, h)
    l, p = min_max(l, p)

    a, i = min_max(a, i)
    b, j = min_max(b, j)
    c, k = min_max(c, k)
    d, l = min_max(d, l)
    e, m = min_max(e, m)
    f, n = min_max(f, n)
    g, o = min_max(g, o)
    h, p = min_max(h, p)

    f, k = min_max(f, k)
    g, j = min_max(g, j)
    d, m = min_max(d, m)
    n, o = min_max(n, o)
    h, l = min_max(h, l)
    b, c = min_max(b, c)
    e, i = min_max(e, i)

    b, e = min_max(b, e)
    h, n = min_max(h, n)
    c, i = min_max(c, i)
    l, o = min_max(l, o)
    f, g = min_max(f, g)
    j, k = min_max(j, k)

    c, e = min_max(c, e)
    l, n = min_max(l, n)
    d, i = min_max(d, i)
    h, m = min_max(h, m)

    g, i = min_max(g, i)
    k, m = min_max(k, m)
    d, f = min_max(d, f)
    h, j = min_max(h, j)

    d, e = min_max(d, e)
    f, g = min_max(f, g)
    h, i = min_max(h, i)
    j, k = min_max(j, k)
    l, m = min_max(l, m)

    g, h = min_max(g, h)
    i, j = min_max(i, j)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p
end

@inline swapsort(x::NTuple{16,T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13], x[14], x[15], x[16])
@inline swapsort(::Type{Val{16}}, x::Vector{T}) where {T} =
    swapsort(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13], x[14], x[15], x[16])

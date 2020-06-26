#=
    Sorting networks that process 1,2,..16 values are given.
    Sorting networks that process 17..25 values are given in "swapsortr_17to25.jl".

    These sorting networks should minimize conditional swaps.  
    The first sixteen are known to minimize conditional swaps.  
    
    Functions are written with groups of internally parallelizable  
    statements given together and sequential steps are separated.  

    `swapsortr(x1::T, .., xn::T)::NTuple{n,T}`
    `swapsortr(tup::NTuple{n,T})::NTuple{n,T}`
    `swapsortr(vec::Vector{T})::NTuple{N,T}`
    
    networks were selected using software by John Gamble
        http://pages.ripco.net/~jgamble/nw.html
        http://search.cpan.org/dist/Algorithm-Networksort/
=#

const VALS = ([Val{i} for i=1:ITEMS_MAX]...,)

@inline function swapsortr(vec::Vector{T}) where {T}
    n = length(vec)
    n > ITEMS_MAX && throw(ErrorException("swapsortr(vector) not defined where length(vector) > $ITEMS_MAX"))
    return swapsortr(VALS[length(vec)], vec)
end

#    sort 1 value with 0 minmaxs in 1 stage

function swapsortr(a::T) where {T}
    return (a,)
end

@inline swapsortr(x::NTuple{1,T}) where {T} = swapsortr(x[1])
@inline swapsortr(::Type{Val{1}}, x::Vector{T}) where {T} = swapsortr(x[1])

#    sort 2 values with 1 minmaxs in 1 stage

function swapsortr(a::T, b::T) where {T}

    a, b = max_min(a, b)

    return a,b
end

@inline swapsortr(x::NTuple{2,T}) where {T} = swapsortr(x[1], x[2])
@inline swapsortr(::Type{Val{2}}, x::Vector{T}) where {T} = swapsortr(x[1], x[2])

#    sort 3 values with 3 minmaxs in 3 parallel stages

function swapsortr(a::T, b::T, c::T) where {T}

    b, c = max_min(b, c)

    a, c = max_min(a, c)

    a, b = max_min(a, b)

    return a, b, c
end

@inline swapsortr(x::NTuple{3,T}) where {T} = swapsortr(x[1], x[2], x[3])
@inline swapsortr(::Type{Val{3}}, x::Vector{T}) where {T} = swapsortr(x[1], x[2], x[3])
    
#    sort 4 values with 5 minmaxs in 3 parallel stages

function swapsortr(a::T, b::T, c::T, d::T) where {T}

    a, b = max_min(a, b)
    c, d = max_min(c, d)

    a, c = max_min(a, c)
    b, d = max_min(b, d)

    b, c = max_min(b, c)

    return a, b, c, d
end

@inline swapsortr(x::NTuple{4,T}) where {T} = swapsortr(x[1], x[2], x[3], x[4])
@inline swapsortr(::Type{Val{4}}, x::Vector{T}) where {T} = swapsortr(x[1], x[2], x[3], x[4])

#    sort 5 values with 9 minmaxs in 5 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T) where {T}

    b, c = max_min(b, c)
    d, e = max_min(d, e)

    b, d = max_min(b, d)
    a, c = max_min(a, c)

    c, e = max_min(c, e)
    a, d = max_min(a, d)

    a, b = max_min(a, b)
    c, d = max_min(c, d)

    b, c = max_min(b, c)

    return a, b, c, d, e
end

@inline swapsortr(x::NTuple{5,T}) where {T} = swapsortr(x[1], x[2], x[3], x[4], x[5])
@inline swapsortr(::Type{Val{5}}, x::Vector{T}) where {T} = swapsortr(x[1], x[2], x[3], x[4], x[5])

#    sort 6 values with 12 minmaxs in 6 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T) where {T}

    b, c = max_min(b, c)
    e, f = max_min(e, f)

    a, c = max_min(a, c)
    d, f = max_min(d, f)

    a, b = max_min(a, b)
    d, e = max_min(d, e)
    c, f = max_min(c, f)

    a, d = max_min(a, d)
    b, e = max_min(b, e)

    c, e = max_min(c, e)
    b, d = max_min(b, d)

    c, d = max_min(c, d)

    return a, b, c, d, e, f
end

@inline swapsortr(x::NTuple{6,T}) where {T} = swapsortr(x[1], x[2], x[3], x[4], x[5], x[6])
@inline swapsortr(::Type{Val{6}}, x::Vector{T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6])

#    sort 7 values with 16 minmaxs in 6 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T) where {T}

    a, e = max_min(a, e)
    b, f = max_min(b, f)
    c, g = max_min(c, g)

    a, c = max_min(a, c)
    b, d = max_min(b, d)
    e, g = max_min(e, g)

    c, e = max_min(c, e)
    d, f = max_min(d, f)
    a, b = max_min(a, b)

    c, d = max_min(c, d)
    e, f = max_min(e, f)

    b, e = max_min(b, e)
    d, g = max_min(d, g)

    b, c = max_min(b, c)
    d, e = max_min(d, e)
    f, g = max_min(f, g)

    return a, b, c, d, e, f, g
end

@inline swapsortr(x::NTuple{7,T}) where {T} = swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7])
@inline swapsortr(::Type{Val{7}}, x::Vector{T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7])

#    sort 8 values with 19 minmaxs in 7 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T) where {T}

    a, b = max_min(a, b)
    c, d = max_min(c, d)
    e, f = max_min(e, f)
    g, h = max_min(g, h)

    a, c = max_min(a, c)
    b, d = max_min(b, d)
    e, g = max_min(e, g)
    f, h = max_min(f, h)

    b, c = max_min(b, c)
    f, g = max_min(f, g)
    a, e = max_min(a, e)
    d, h = max_min(d, h)

    b, f = max_min(b, f)
    c, g = max_min(c, g)

    b, e = max_min(b, e)
    d, g = max_min(d, g)

    c, e = max_min(c, e)
    d, f = max_min(d, f)

    d, e = max_min(d, e)

    return a, b, c, d, e, f, g, h
end

@inline swapsortr(x::NTuple{8,T}) where {T} = swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8])
@inline swapsortr(::Type{Val{8}}, x::Vector{T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8])

#    sort 9 values with 25 minmaxs in 9 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T) where {T}

    a, b = max_min(a, b)
    d, e = max_min(d, e)
    g, h = max_min(g, h)

    b, c = max_min(b, c)
    e, f = max_min(e, f)
    h, i = max_min(h, i)

    a, b = max_min(a, b)
    d, e = max_min(d, e)
    g, h = max_min(g, h)
    c, f = max_min(c, f)

    a, d = max_min(a, d)
    b, e = max_min(b, e)
    f, i = max_min(f, i)

    d, g = max_min(d, g)
    e, h = max_min(e, h)
    c, f = max_min(c, f)

    a, d = max_min(a, d)
    b, e = max_min(b, e)
    f, h = max_min(f, h)
    c, g = max_min(c, g)

    b, d = max_min(b, d)
    e, g = max_min(e, g)

    c, e = max_min(c, e)
    f, g = max_min(f, g)

    c, d = max_min(c, d)

    return a, b, c, d, e, f, g, h, i
end

@inline swapsortr(x::NTuple{9,T}) where {T} = swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9])
@inline swapsortr(::Type{Val{9}}, x::Vector{T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9])

#    sort 10 values with 29 minmaxs in 9 parallel stages

function swapsortr(a::T,b::T,c::T,d::T,e::T,
              f::T,g::T,h::T,i::T,j::T) where {T}

    e, j = max_min(e, j)
    d, i = max_min(d, i)
    c, h = max_min(c, h)
    b, g = max_min(b, g)
    a, f = max_min(a, f)

    b, e = max_min(b, e)
    g, j = max_min(g, j)
    a, d = max_min(a, d)
    f, i = max_min(f, i)

    a, c = max_min(a, c)
    d, g = max_min(d, g)
    h, j = max_min(h, j)

    a, b = max_min(a, b)
    c, e = max_min(c, e)
    f, h = max_min(f, h)
    i, j = max_min(i, j)

    b, c = max_min(b, c)
    e, g = max_min(e, g)
    h, i = max_min(h, i)
    d, f = max_min(d, f)

    c, f = max_min(c, f)
    g, i = max_min(g, i)
    b, d = max_min(b, d)
    e, h = max_min(e, h)

    c, d = max_min(c, d)
    g, h = max_min(g, h)

    d, e = max_min(d, e)
    f, g = max_min(f, g)

    e, f = max_min(e, f)

    return a,b,c,d,e,f,g,h,i,j
end

@inline swapsortr(x::NTuple{10,T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10])
@inline swapsortr(::Type{Val{10}}, x::Vector{T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10])

#    sort 11 values with 35 minmaxs in 9 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T) where {T}

    a, b = max_min(a, b)
    c, d = max_min(c, d)
    e, f = max_min(e, f)
    g, h = max_min(g, h)
    i, j = max_min(i, j)

    b, d = max_min(b, d)
    f, h = max_min(f, h)
    a, c = max_min(a, c)
    e, g = max_min(e, g)
    i, k = max_min(i, k)

    b, c = max_min(b, c)
    f, g = max_min(f, g)
    j, k = max_min(j, k)
    a, e = max_min(a, e)
    d, h = max_min(d, h)

    b, f = max_min(b, f)
    g, k = max_min(g, k)
    e, i = max_min(e, i)

    f, j = max_min(f, j)
    c, g = max_min(c, g)
    a, e = max_min(a, e)
    d, i = max_min(d, i)

    b, f = max_min(b, f)
    g, k = max_min(g, k)
    c, d = max_min(c, d)
    i, j = max_min(i, j)

    b, e = max_min(b, e)
    h, k = max_min(h, k)
    d, f = max_min(d, f)
    g, i = max_min(g, i)

    c, e = max_min(c, e)
    h, j = max_min(h, j)
    f, g = max_min(f, g)

    d, e = max_min(d, e)
    h, i = max_min(h, i)

    return a,b,c,d,e,f,g,h,i,j,k
end

@inline swapsortr(x::NTuple{11,T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11])
@inline swapsortr(::Type{Val{11}}, x::Vector{T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11])

#    sort 12 values with 39 minmaxs in 9 parallel stages

function swapsortr(a::T,b::T,c::T,d::T,e::T,
              f::T,g::T,h::T,i::T,j::T,
              k::T,l::T) where {T}

    a, b = max_min(a, b)
    c, d = max_min(c, d)
    e, f = max_min(e, f)
    g, h = max_min(g, h)
    i, j = max_min(i, j)
    k, l = max_min(k, l)

    b, d = max_min(b, d)
    f, h = max_min(f, h)
    j, l = max_min(j, l)
    a, c = max_min(a, c)
    e, g = max_min(e, g)
    i, k = max_min(i, k)

    b, c = max_min(b, c)
    f, g = max_min(f, g)
    j, k = max_min(j, k)
    a, e = max_min(a, e)
    h, l = max_min(h, l)

    b, f = max_min(b, f)
    g, k = max_min(g, k)
    d, h = max_min(d, h)
    e, i = max_min(e, i)

    f, j = max_min(f, j)
    c, g = max_min(c, g)
    a, e = max_min(a, e)
    h, l = max_min(h, l)
    d, i = max_min(d, i)

    b, f = max_min(b, f)
    g, k = max_min(g, k)
    c, d = max_min(c, d)
    i, j = max_min(i, j)

    b, e = max_min(b, e)
    h, k = max_min(h, k)
    d, f = max_min(d, f)
    g, i = max_min(g, i)

    c, e = max_min(c, e)
    h, j = max_min(h, j)
    f, g = max_min(f, g)

    d, e = max_min(d, e)
    h, i = max_min(h, i)

    return a,b,c,d,e,f,g,h,i,j,k,l
end

@inline swapsortr(x::NTuple{12,T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12])
@inline swapsortr(::Type{Val{12}}, x::Vector{T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12])

#    sort 13 values with 45 minmaxs in 10 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T) where {T}

    b, h = max_min(b, h)
    j, l = max_min(j, l)
    d, e = max_min(d, e)
    f, i = max_min(f, i)
    a, m = max_min(a, m)
    c, g = max_min(c, g)

    a, b = max_min(a, b)
    c, d = max_min(c, d)
    e, g = max_min(e, g)
    i, l = max_min(i, l)
    h, m = max_min(h, m)
    f, j = max_min(f, j)

    a, c = max_min(a, c)
    d, h = max_min(d, h)
    k, l = max_min(k, l)
    b, e = max_min(b, e)
    g, m = max_min(g, m)

    h, i = max_min(h, i)
    l, m = max_min(l, m)
    e, j = max_min(e, j)
    g, k = max_min(g, k)

    d, e = max_min(d, e)
    f, g = max_min(f, g)
    i, j = max_min(i, j)
    k, l = max_min(k, l)
    b, h = max_min(b, h)

    c, g = max_min(c, g)
    j, l = max_min(j, l)
    b, d = max_min(b, d)
    e, h = max_min(e, h)
    i, k = max_min(i, k)
    a, f = max_min(a, f)

    c, f = max_min(c, f)
    g, i = max_min(g, i)
    j, k = max_min(j, k)

    b, c = max_min(b, c)
    d, f = max_min(d, f)
    h, i = max_min(h, i)
    e, g = max_min(e, g)

    c, d = max_min(c, d)
    e, f = max_min(e, f)
    g, h = max_min(g, h)
    i, j = max_min(i, j)

    d, e = max_min(d, e)
    f, g = max_min(f, g)

    return a,b,c,d,e,f,g,h,i,j,k,l,m
end

@inline swapsortr(x::NTuple{13,T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13])
@inline swapsortr(::Type{Val{13}}, x::Vector{T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13])

#    sort 14 values with 51 minmaxs in 10 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T) where {T}

    a, b = max_min(a, b)
    c, d = max_min(c, d)
    e, f = max_min(e, f)
    g, h = max_min(g, h)
    i, j = max_min(i, j)
    k, l = max_min(k, l)
    m, n = max_min(m, n)

    a, c = max_min(a, c)
    e, g = max_min(e, g)
    i, k = max_min(i, k)
    b, d = max_min(b, d)
    f, h = max_min(f, h)
    j, l = max_min(j, l)

    a, e = max_min(a, e)
    i, m = max_min(i, m)
    b, f = max_min(b, f)
    j, n = max_min(j, n)
    c, g = max_min(c, g)
    d, h = max_min(d, h)

    a, i = max_min(a, i)
    b, j = max_min(b, j)
    c, k = max_min(c, k)
    d, l = max_min(d, l)
    e, m = max_min(e, m)
    f, n = max_min(f, n)

    f, k = max_min(f, k)
    g, j = max_min(g, j)
    d, m = max_min(d, m)
    h, l = max_min(h, l)
    b, c = max_min(b, c)
    e, i = max_min(e, i)

    b, e = max_min(b, e)
    h, n = max_min(h, n)
    c, i = max_min(c, i)
    f, g = max_min(f, g)
    j, k = max_min(j, k)

    c, e = max_min(c, e)
    l, n = max_min(l, n)
    d, i = max_min(d, i)
    h, m = max_min(h, m)

    g, i = max_min(g, i)
    k, m = max_min(k, m)
    d, f = max_min(d, f)
    h, j = max_min(h, j)

    d, e = max_min(d, e)
    f, g = max_min(f, g)
    h, i = max_min(h, i)
    j, k = max_min(j, k)
    l, m = max_min(l, m)

    g, h = max_min(g, h)
    i, j = max_min(i, j)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n
end

@inline swapsortr(x::NTuple{14,T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13], x[14])
@inline swapsortr(::Type{Val{14}}, x::Vector{T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13], x[14])

#    sort 15 values with 56 minmaxs in 10 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T) where {T}

    a, b = max_min(a, b)
    c, d = max_min(c, d)
    e, f = max_min(e, f)
    g, h = max_min(g, h)
    i, j = max_min(i, j)
    k, l = max_min(k, l)
    m, n = max_min(m, n)

    a, c = max_min(a, c)
    e, g = max_min(e, g)
    i, k = max_min(i, k)
    m, o = max_min(m, o)
    b, d = max_min(b, d)
    f, h = max_min(f, h)
    j, l = max_min(j, l)

    a, e = max_min(a, e)
    i, m = max_min(i, m)
    b, f = max_min(b, f)
    j, n = max_min(j, n)
    c, g = max_min(c, g)
    k, o = max_min(k, o)
    d, h = max_min(d, h)

    a, i = max_min(a, i)
    b, j = max_min(b, j)
    c, k = max_min(c, k)
    d, l = max_min(d, l)
    e, m = max_min(e, m)
    f, n = max_min(f, n)
    g, o = max_min(g, o)

    f, k = max_min(f, k)
    g, j = max_min(g, j)
    d, m = max_min(d, m)
    n, o = max_min(n, o)
    h, l = max_min(h, l)
    b, c = max_min(b, c)
    e, i = max_min(e, i)

    b, e = max_min(b, e)
    h, n = max_min(h, n)
    c, i = max_min(c, i)
    l, o = max_min(l, o)
    f, g = max_min(f, g)
    j, k = max_min(j, k)

    c, e = max_min(c, e)
    l, n = max_min(l, n)
    d, i = max_min(d, i)
    h, m = max_min(h, m)

    g, i = max_min(g, i)
    k, m = max_min(k, m)
    d, f = max_min(d, f)
    h, j = max_min(h, j)

    d, e = max_min(d, e)
    f, g = max_min(f, g)
    h, i = max_min(h, i)
    j, k = max_min(j, k)
    l, m = max_min(l, m)

    g, h = max_min(g, h)
    i, j = max_min(i, j)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o
end

@inline swapsortr(x::NTuple{15,T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13], x[14], x[15])
@inline swapsortr(::Type{Val{15}}, x::Vector{T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13], x[14], x[15])

#    sort 16 values with 60 minmaxs in 10 parallel stages

function swapsortr(a::T, b::T, c::T, d::T, e::T,
              f::T, g::T, h::T, i::T, j::T,
              k::T, l::T, m::T, n::T, o::T,
              p::T) where {T}

    a, b = max_min(a, b)
    c, d = max_min(c, d)
    e, f = max_min(e, f)
    g, h = max_min(g, h)
    i, j = max_min(i, j)
    k, l = max_min(k, l)
    m, n = max_min(m, n)
    o, p = max_min(o, p)

    a, c = max_min(a, c)
    e, g = max_min(e, g)
    i, k = max_min(i, k)
    m, o = max_min(m, o)
    b, d = max_min(b, d)
    f, h = max_min(f, h)
    j, l = max_min(j, l)
    n, p = max_min(n, p)

    a, e = max_min(a, e)
    i, m = max_min(i, m)
    b, f = max_min(b, f)
    j, n = max_min(j, n)
    c, g = max_min(c, g)
    k, o = max_min(k, o)
    d, h = max_min(d, h)
    l, p = max_min(l, p)

    a, i = max_min(a, i)
    b, j = max_min(b, j)
    c, k = max_min(c, k)
    d, l = max_min(d, l)
    e, m = max_min(e, m)
    f, n = max_min(f, n)
    g, o = max_min(g, o)
    h, p = max_min(h, p)

    f, k = max_min(f, k)
    g, j = max_min(g, j)
    d, m = max_min(d, m)
    n, o = max_min(n, o)
    h, l = max_min(h, l)
    b, c = max_min(b, c)
    e, i = max_min(e, i)

    b, e = max_min(b, e)
    h, n = max_min(h, n)
    c, i = max_min(c, i)
    l, o = max_min(l, o)
    f, g = max_min(f, g)
    j, k = max_min(j, k)

    c, e = max_min(c, e)
    l, n = max_min(l, n)
    d, i = max_min(d, i)
    h, m = max_min(h, m)

    g, i = max_min(g, i)
    k, m = max_min(k, m)
    d, f = max_min(d, f)
    h, j = max_min(h, j)

    d, e = max_min(d, e)
    f, g = max_min(f, g)
    h, i = max_min(h, i)
    j, k = max_min(j, k)
    l, m = max_min(l, m)

    g, h = max_min(g, h)
    i, j = max_min(i, j)

    return a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p
end

@inline swapsortr(x::NTuple{16,T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13], x[14], x[15], x[16])
@inline swapsortr(::Type{Val{16}}, x::Vector{T}) where {T} =
    swapsortr(x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10],
             x[11], x[12], x[13], x[14], x[15], x[16])

"""
    Sorting networks for 1,2,..16 and 17,18..25 values are given.  
    These sorting networks should minimize conditional swaps.  
    The first sixteen are known to minimize conditional swaps.  
    
    Functions are a sequence of internally parallelizable blocks.
    Functions are written using empty lines as block delmiters.

    `swapsort(x1::T, .., xn::T)::NTuple{n,T}`  
    `swapsort(tup::NTuple{n,T})::NTuple{n,T}`  
"""
module SortingNetworks


export swapsort, ExchangeSort


"""
    ExchangeSort

Indicate that a sorting function should use the exchange sort
algorithm. Exchange sort orders elements pairwise, over groups
that are accessible in parallel.  At the conclusion of the
application of the relevant sorting network, each element
is positioned in its correct, sorted postion in the output.
Characteristics:
  * *stable*: preserves the ordering of elements which
    compare equal (e.g. "a" and "A" in a sort of letters
    which ignores case).
  * *in-place* in memory.
  * *quadratic performance* in the number of elements to be sorted:
    it is well-suited to small collections but should not be used for large ones.
"""
struct ExchangeSortAlg  <: Base.Sort.Algorithm end
const ExchangeSort  = ExchangeSortAlg()

const MIN_MAX = :boolean # {:boolean, :ifelse, :minmax, :lessthan}

if MIN_MAX == :boolean
    @inline function min_max(a::T, b::T) where {T<:Real}
        return (b < a ? (b, a) : (a, b))
    end
    @inline function max_min(a::T, b::T) where {T<:Real}
        return (b < a ? (a, b) : (b, a))
    end
elseif MIN_MAX == :ifelse
    @inline function min_max(a::T, b::T) where {T<:Real}
        return ifelse(b < a, (b, a), (a, b))
    end
    @inline function max_min(a::T, b::T) where {T<:Real}
        return ifelse(b < a, (a, b), (b, a))
    end
elseif MIN_MAX == :minmax
    @inline function min_max(a::T, b::T) where {T<:Real}
        return min(a,b), max(a,b)
    end
    @inline function max_min(a::T, b::T) where {T<:Real}
        return max(a,b), min(a,b)
    end
elseif MIN_MAX == :lessthan
    @inline function min_max(a::T, b::T) where {T}
        a<b && return (a,b)
            return (b,a)
    end
    @inline function max_min(a::T, b::T) where {T}
        a<b && return (b,a)
            return (a,b)
    end
end

const ITEMS_MAX = 25

include("swapsort.jl")
include("swapsort_17to25.jl")

include("swapsortr.jl")
include("swapsortr_17to25.jl")

end # module

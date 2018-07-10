@inline swapsort(x::NTuple{N, T}) where {N, T} = swapsort(x...,)

@inline swapsort(x::V) where {T, V<:AbstractVector{T}} = swapsort(x...,)


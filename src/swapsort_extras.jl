swapsort(x::NTuple{N, T}) where {N, T} = swapsort(x...,)

swapsort(x::V) where {T, V<:AbstractVector{T}} = swapsort(x...,)


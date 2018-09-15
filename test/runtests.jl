using SortingNetworks
using Test

function bittuple_impl(::Val{N}) where {N}
    args = [:(ithbit(x, $i)) for i in 0:N-1]
   :(tuple($(args...)))
end
ithbit(x, i) = Bool((x >> i) & true)
@generated bittuple(x, N) = bittuple_impl(N())

function bittuples(vN::Val{N}) where {N}
    @assert N <= 25
    xs = UInt64(1):UInt64(2)^N
    [bittuple(x, vN) for x in xs]
end

@noinline function test_swapsort(vN::Val)
    for cba ∈ bittuples(vN)
        abc = swapsort(cba)
        @test issorted(abc)
    end
end

test_swapsort(n) = test_swapsort(Val{n}())

@testset "test 0-1 principle implementation" begin
    N = 8
    tups = @inferred bittuples(Val{N}())
    @test length(tups) == 2^N
    @test length(unique(tups)) == length(tups)
end

@testset "0-1 principle" for n ∈ 1:25
    test_swapsort(n)
end

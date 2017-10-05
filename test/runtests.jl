using SortingNetworks
using Base.Test

for i in 1:25
    tup = ( collect(1:i)... )
    tst = reverse( tup )
    @test swapsort(tst) == tup
    @test swapsort(tst...) == tup
end    

for _ in 1:100
    for i in 1:25
        abc = randn(i)
        result = swapsort(abc...)
        @test issorted(result)
    end
end

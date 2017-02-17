using SortingNetworks
using Base.Test

for i in 1:25
    tup = ( collect((1:i)... )
    tst = reverse( tup )
    @test sort(tst) == tup
    @test sort(tst...) == tup
end    

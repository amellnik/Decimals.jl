using Decimals
using Compat.Test

@testset "Equality" begin

@testset "isequal" begin
    @test isequal(Decimal(0, 2, -3), Decimal(0, 2, -3))
    @test ~isequal(Decimal(0, 2, -3), Decimal(0, 2, 3))
    @test isequal(Decimal(0, 2, -3), 0.002)
    @test isequal(Decimal(1, 2, 0), -2)
    @test ~isequal(Decimal(1, 2, 0), 2)
end

@testset "==" begin
    @test Decimal(0, 2, -3) == Decimal(0, 2, -3)
    @test Decimal(0, 2, -3) != Decimal(0, 2, 3)
    @test Decimal(0, 2, -3) == 0.002

    @test -2 == Decimal(1, 2, 0)
    @test 2 != Decimal(1, 2, 0)

    @test Decimal(1, 2, 0) == -2
    @test Decimal(1, 2, 0) != 2

    bf_pi = BigFloat(pi)
    @test Decimal(bf_pi) == bf_pi
    @test bf_pi == Decimal(bf_pi)

    bi = big"4608230166434464229556241992703"
    @test Decimal(bi) == bi
    @test bi == Decimal(bi)
end

@testset "<" begin
    @test Decimal(1, 1, 1) < Decimal(0, 1, 1)
    @test !(Decimal(0, 1, 1) < Decimal(1, 1, 1))
    @test Decimal(1, 1, 1) < Decimal(1, 0, 1)
    @test !(Decimal(1, 0, 1) < Decimal(1, 1, 1))
    @test Decimal(0, 2, -3) < Decimal(0, 2, 3)
    @test !(Decimal(0, 2, 3) < Decimal(0, 2, -3))
end

end

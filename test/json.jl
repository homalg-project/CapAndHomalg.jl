@testset "GAP pkg json" begin
    @test GAP.Packages.load("json")
end

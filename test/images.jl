@testset "GAP pkg images" begin
    @test GAP.Packages.load("images")
end

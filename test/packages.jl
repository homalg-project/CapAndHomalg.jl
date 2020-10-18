@testset "download/update/remove packages from the homalg-project organization" begin
    RemovePackageFromHomalgProject("CapAndHomalg.jl")
    @test DownloadPackageFromHomalgProject("CapAndHomalg.jl")
    @test DownloadPackageFromHomalgProject("CapAndHomalg.jl")
    @test UpdatePackageFromHomalgProject("CapAndHomalg.jl")
    @test UpdatePackageFromHomalgProject("CapAndHomalg.jl")
    @test RemovePackageFromHomalgProject("CapAndHomalg.jl")
    @test !RemovePackageFromHomalgProject("CapAndHomalg.jl")
end

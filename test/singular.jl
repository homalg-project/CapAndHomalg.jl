@testset "Singular" begin
    LoadPackage( "GradedModules" )
    @test UseSystemSingular(true)
    @test UseSystemSingular(true)
    @test UseSystemSingular(false)
    @test UseSystemSingular(false)
    ℚ = HomalgFieldOfRationalsInSingular( )
    @test IsHomalgExternalRingInSingularRep( ℚ )
end

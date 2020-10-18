@testset "Singular" begin
    LoadPackage( "GradedModules" )
    ℚ = HomalgFieldOfRationalsInSingular( )
    @test IsHomalgExternalRingInSingularRep( ℚ )
end

@testset "4ti2Interface" begin
    LoadPackage("4ti2Interface")
    cone = [[5, -1], [0, 1]]
    basis = lib4ti2_hilbert_inequalities(cone)
    GAP.Globals.Sort(basis)
    @test basis == ConvertJuliaToGAP([[1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5]])
    @test basis == ConvertJuliaToGAP(basis)
    groebner = lib4ti2_groebner_matrix(basis)
    GAP.Globals.Sort(groebner)
    @test GAP.Globals.Length(groebner) == 10
    gens = [23, 25, 37, 49]
    equation = [vcat(gens, -gens)]
    basis = lib4ti2_hilbert_equalities_in_positive_orthant(equation)
    @test GAP.Globals.Length(basis) == 436
    inequalities = [[1, 2, 3, 4], [0, 1, 0, 7], [3, 1, 0, 2], [0, 0, 1, 0]]
    basis2 = lib4ti2_hilbert_inequalities(inequalities)
    @test GAP.Globals.Length(basis2) == 29
end

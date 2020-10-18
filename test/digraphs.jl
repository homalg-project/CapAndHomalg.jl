@testset "Digraphs" begin
    LoadPackage("Digraphs")
    gr = Digraph(julia_to_gap(1:2), ReturnTrue)
    @test DotDigraph(gr) ==
          julia_to_gap("//dot\ndigraph hgn{\nnode [shape=circle]\n1\n2\n1 -> 1\n1 -> 2\n2 -> 1\n2 -> 2\n}\n")
    @test Filename(DirectoriesSystemPrograms(), julia_to_gap("dot")) != GAP.Globals.fail
end

@testset "Digraphs" begin
    LoadPackage("Digraphs")
    gr = Digraph(GapObj(1:2), ReturnTrue)
    @test DotDigraph(gr) ==
          GapObj("//dot\ndigraph hgn{\nnode [shape=circle]\n1\n2\n1 -> 1\n1 -> 2\n2 -> 1\n2 -> 2\n}\n")
    @test Filename(DirectoriesSystemPrograms(), GapObj("dot")) != fail
end

using CapAndHomalg, Test, Documenter

DocMeta.setdocmeta!(CapAndHomalg, :DocTestSetup, :(using CapAndHomalg); recursive = true)

include("packages.jl")
include("singular.jl")
include("4ti2.jl")
include("digraphs.jl")
include("homalg_project.jl")
include("testmanual.jl")

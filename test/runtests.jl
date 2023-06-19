using CapAndHomalg, Test, Documenter

DocMeta.setdocmeta!(CapAndHomalg, :DocTestSetup, :(using CapAndHomalg); recursive = true)

include("singular.jl")
include("4ti2.jl")
include("digraphs.jl")
include("json.jl")
include("images.jl")
include("homalg_project.jl")
include("packages.jl")
include("testmanual.jl")

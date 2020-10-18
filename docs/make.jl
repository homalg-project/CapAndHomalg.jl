using Documenter, DocumenterMarkdown, CapAndHomalg

makedocs(;
    modules = [CapAndHomalg],
    format = Documenter.HTML(assets = String[]),
    doctest = false,
    repo = "https://github.com/homalg-project/CapAndHomalg.jl/blob/{commit}{path}#L{line}",
    sitename = "CapAndHomalg.jl",
    authors = "Mohamed Barakat <mohamed.barakat@uni-siegen.de>",
    pages = ["Home" => "index.md", "Examples" => "examples.md"],
)

deploydocs(; repo = "github.com/homalg-project/CapAndHomalg.jl")

using CapAndHomalg
using Documenter
using DocumenterMarkdown

makedocs(;
    modules=[CapAndHomalg],
    authors="Mohamed Barakat <mohamed.barakat@uni-siegen.de>",
    repo="https://github.com/homalg-project/CapAndHomalg.jl/blob/{commit}{path}#{line}",
    sitename="CapAndHomalg.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "Tests", "false") == "true",
        canonical="https://homalg-project.github.io/CapAndHomalg.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Examples" => "examples.md"
    ],
)

deploydocs(;
    repo="github.com/homalg-project/CapAndHomalg.jl",
    devbranch="master",
)

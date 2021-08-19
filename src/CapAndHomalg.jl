@doc Markdown.doc"""

The Julia package `CapAndHomalg` provides simplified access to the
repositories of the GAP packages hosted on the GitHub organization
https://homalg-project.github.io/, most of which are based on the

* CAP project,
* homalg project.

These are open source GAP multi-package projects for constructive
category theory and homological algebra with applications to module
theory of commutative and non-commutative algebras and algebraic
geometry.

## Software dependency

`CapAndHomalg` relies on the

| computer algebra systems | through the Julia packages |
|:------------------------:|:--------------------------:|
| GAP                      | Gap.jl                     |
| Singular                 | Singular_jll.jl            |

all of which are components of the computer algebra system
[OSCAR](https://oscar.computeralgebra.de/).

Some of the bundled packages use the GAP packages

* IO
* ferret
* json
* QPA2

and the

| third party software | through the GAP packages |
|:--------------------:|:------------------------:|
| Graphviz_jll         | Digraphs                 |
| 4ti2_jll             | 4ti2Interface            |

## General Disclaimer

The software comes with absolutely no warranty and will most likely have errors. If you use it for computations, please check the correctness of the result very carefully.

This software is licensed under the LGPL, version 3, or any later version.

## Funding

*The development of this package and many of the GAP packages hosted on the GitHub organization homalg-project was partially funded by the DFG (German Research Foundation) through the*

* [Special Priority Project SPP 1489](https://spp.computeralgebra.de/),
* [Transregional Collaborative Research Centre SFB-TRR 195](https://www.computeralgebra.de/sfb/).

More information and the online documentation can be found at the source code repository

https://github.com/homalg-project/CapAndHomalg.jl
"""
module CapAndHomalg

greet() = print("The package mananger of the projects CAP and homalg")

import Base: getindex

## in particular import and export GAP:
include(joinpath("..", "deps", "homalg-project.jl"))

import Pkg
import Markdown

Base.:*(x::GapObj, y::String) = x * GapObj(y)
Base.getindex(x::GapObj, y::String) = GAP.Globals.ELM_LIST(x, GapObj(y))
Base.getindex(x::GapObj, y::GapObj) = GAP.Globals.ELM_LIST(x, y)
Base.:/(x::Any, y::GapObj) = GAP.Globals.QUO(GapObj(x, recursive=true), y)
Base.:/(x::GapObj, y::Array{GapObj,1}) = GAP.Globals.QUO(x, GapObj(y))
Base.:/(x::GapObj, y::Array) = GAP.Globals.QUO(x, GapObj(y, recursive=true))

function Base.showable(mime::MIME, obj::GapObj)
    return GAP.Globals.IsShowable(GapObj(string(mime)), obj)
end

Base.show(io::IO, ::MIME"application/x-latex", obj::GapObj) = print(io, string("\$\$", String(GAP.Globals.LaTeXStringOp(obj))), "\$\$")
Base.show(io::IO, ::MIME"text/latex", obj::GapObj) = print(io, string("\$\$", String(GAP.Globals.LaTeXStringOp(obj))), "\$\$")

## Convenience
include("conversions.jl")

## Singular_jll
import Singular_jll

global SINGULAR_BINARY_PATHS = Singular_jll.PATH_list

export SINGULAR_BINARY_PATHS

global SINGULAR_LIBRARY_PATHS = Singular_jll.LIBPATH_list

export SINGULAR_LIBRARY_PATHS

"""
    UseSystemSingular(bool::Bool)

* if bool == true use the Singular installed on the system
* if bool == false use the Singular bundled with Singular_jll
"""
function UseSystemSingular(bool::Bool)

    if bool == false

        if String(GAP.Globals.GAPInfo.DirectoriesSystemPrograms[1]) == SINGULAR_BINARY_PATHS[1]
            return true
        end

        ## add binary paths to GAPInfo.DirectoriesSystemPrograms
        paths = GAP.Globals.Concatenation(
            GapObj(map(GapObj, SINGULAR_BINARY_PATHS)),
            GAP.Globals.GAPInfo.DirectoriesSystemPrograms
        )
        paths = GAP.Globals.Unique(paths)
        GAP.Globals.GAPInfo.DirectoriesSystemPrograms = paths
        GAP.Globals.GAPInfo.DirectoriesPrograms = GAP.Globals.List(
            GAP.Globals.GAPInfo.DirectoriesSystemPrograms,
            GAP.Globals.Directory
        )

        ## add library pathes to LD_LIBRARY_PATH and DYLD_LIBRARY_PATH in HOMALG_IO_Singular.environment
        lib = join(SINGULAR_LIBRARY_PATHS, ":")
        GAP.Globals.HOMALG_IO_Singular.environment =
            GapObj([GapObj("LD_LIBRARY_PATH=$lib:\$LD_LIBRARY_PATH"),
                    GapObj("DYLD_LIBRARY_PATH=$lib:\$DYLD_LIBRARY_PATH")])

        return true

    end

    if String(GAP.Globals.GAPInfo.DirectoriesSystemPrograms[1]) != SINGULAR_BINARY_PATHS[1]
        return true
    end

    for i in 1:length(SINGULAR_BINARY_PATHS)
        GAP.Globals.Remove(GAP.Globals.GAPInfo.DirectoriesSystemPrograms, 1)
        GAP.Globals.Remove(GAP.Globals.GAPInfo.DirectoriesPrograms, 1)
    end

    GAP.Globals.HOMALG_IO_Singular.environment = GapObj([])

    return true

end

export UseSystemSingular

# use ≟ as alias for ==
≟ = ==
export ≟

function __init__()

    DownloadPackageFromHomalgProject("homalg_project")
    DownloadPackageFromHomalgProject("CAP_project")

    ## Read( "Tools.g" )
    path = GapObj(joinpath(CAP_AND_HOMALG_PATH, "src", "Tools.g"))
    GAP.Globals.Read(path)

    ## add "~/.gap/" at the end of GAPInfo.RootPaths
    GAP.Globals.ExtendRootDirectories(GapObj([GAP.Globals.UserHomeExpand(GapObj("~/.gap/"))]))

    ## add "~/.julia/.../CapAndHomalg/" at the beginning of GAPInfo.RootPaths
    GAP.Globals.EnhanceRootDirectories(GapObj([GapObj(
        CAP_AND_HOMALG_PATH * "/",
    )]))

    if GAP.Globals.TestPackageAvailability(GapObj("io")) == GAP.Globals.fail
        GAP.Packages.install("io")
    end

    ## add binary paths to GAPInfo.DirectoriesSystemPrograms
    paths = GAP.Globals.Concatenation(
        GapObj(map(GapObj, HOMALG_PATHS)),
        GAP.Globals.GAPInfo.DirectoriesSystemPrograms
    )
    paths = GAP.Globals.Unique(paths)
    GAP.Globals.GAPInfo.DirectoriesSystemPrograms = paths
    GAP.Globals.GAPInfo.DirectoriesPrograms = GAP.Globals.List(
        GAP.Globals.GAPInfo.DirectoriesSystemPrograms,
        GAP.Globals.Directory
    )

    LoadPackageAndExposeGlobals("", load = false)

    ## needed by the variable HOMALG_IO_Singular below
    LoadPackage("RingsForHomalg")

    SizeScreen( [ 2^12 ] )

    ## loading IO_ForHomalg now suppresses its banner later
    LoadPackage("IO_ForHomalg")

    ## suppress banners of external CAS
    GAP.Globals.HOMALG_IO.show_banners = false

    UseSystemSingular(false)

    if haskey(ENV, "CAP_AND_HOMALG_PRINT_BANNER")
        show_banner = ENV["CAP_AND_HOMALG_PRINT_BANNER"] == "true"
    else
        show_banner =
            isinteractive() && !any(x -> x.name in ["Oscar", "HomalgProject"], keys(Base.package_locks))
    end

    if show_banner
        print("CapAndHomalg v")
        printstyled("$version\n", color = :green)
        println("Imported OSCAR's components GAP and Singular_jll")
        println("Type: ?CapAndHomalg for more information")
    end

    SizeScreen(SIZE_SCREEN_ORIGINAL)
end

"""
    CapAndHomalg.version

The version number of the loaded `CapAndHomalg`.
Please mention this number in any bug report.
"""
global version = 0

if VERSION >= v"1.4"
    deps = Pkg.dependencies()
    if Base.haskey(deps, Base.UUID("c4774649-1891-41ea-a883-87141804c57c"))
        ver = Pkg.dependencies()[Base.UUID("c4774649-1891-41ea-a883-87141804c57c")]
        if occursin("/dev/", ver.source)
            version = VersionNumber("$(ver.version)")
        else
            version = VersionNumber("$(ver.version)")
        end
    else
        version = "not installed"
    end
else
    deps = Pkg.API.__installed(Pkg.PKGMODE_MANIFEST) #to also get installed dependencies
    if haskey(deps, "CapAndHomalg")
        ver = deps["CapAndHomalg"]
        dir = dirname(@__DIR__)
        if occursin("/dev/", dir)
            version = VersionNumber("$(ver)-dev")
        else
            version = VersionNumber("$(ver)")
        end
    else
        version = "not installed"
    end
end

include("setup.jl")

end # module

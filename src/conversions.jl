function LoadPackage(pkgname::String)
    GAP.LoadPackageAndExposeGlobals(pkgname, Main, all_globals = true)
end

export LoadPackage

function HomalgMatrix(M::Any, m::Int64, n::Int64, R::GAP.GapObj)
    return GAP.Globals.HomalgMatrix(GapObj(M, recursive=true), m, n, R)
end

function HomalgMatrix(M::Any, R::GAP.GapObj)
    return GAP.Globals.HomalgMatrix(GapObj(M, recursive=true), R)
end

export HomalgMatrix

function RepresentationCategoryObject(char::GAP.GapObj, category::GAP.GapObj, name::String)
    return GAP.Globals.RepresentationCategoryObject(char, category, GapObj(name))
end

export RepresentationCategoryObject

function SizeScreen()
    return Vector{Int}(GAP.Globals.SizeScreen())
end

function SizeScreen(L::Array)
    return Vector{Int}(GAP.Globals.SizeScreen(GapObj(L)))
end

export SizeScreen

## used in ../bin/gap-with-cap-and-homalg-via-julia
global SIZE_SCREEN_ORIGINAL = SizeScreen()

export SIZE_SCREEN_ORIGINAL

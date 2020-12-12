function LoadPackage(pkgname::String)
    GAP.LoadPackageAndExposeGlobals(pkgname, Main, all_globals = true)
end

export LoadPackage

function HomalgMatrix(M::String, m::Int64, n::Int64, R::GAP.GapObj)
    return GAP.Globals.HomalgMatrix(julia_to_gap(M), m, n, R)
end

export HomalgMatrix

function RepresentationCategoryObject(char::GAP.GapObj, category::GAP.GapObj, name::String)
    return GAP.Globals.RepresentationCategoryObject(char, category, julia_to_gap(name))
end

export RepresentationCategoryObject

function SizeScreen(L::Array)
    return gap_to_julia(GAP.Globals.SizeScreen(julia_to_gap(L)))
end

export SizeScreen

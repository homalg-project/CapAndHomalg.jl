function LoadPackageAndExposeGlobals(pkgname::String; load::Bool=true)
    old_gvar_list = GAP.Globals.ShallowCopy(GAP.Globals.NamesGVars())

    if load
        if !GAP.Packages.load(pkgname)
            error("cannot load package $pkgname")
        end
        new_gvar_list = GAP.Globals.Difference(GAP.Globals.NamesGVars(), old_gvar_list)
    else
        new_gvar_list = old_gvar_list
    end

    new_symbols = Vector{Symbol}(new_gvar_list)

    for sym in new_symbols
        if !isdefined(CapAndHomalg, sym)
            try
                CapAndHomalg.eval(:($(sym) = GAP.Globals.$(sym)))
                CapAndHomalg.eval(:(export $(sym)))
            catch
            end
        end
    end
end

function LoadPackage(pkgname::String)
    LoadPackageAndExposeGlobals(pkgname)
end

export LoadPackage

function HomalgMatrix(M::Any, m::Int64, n::Int64, R::GapObj)
    return GAP.Globals.HomalgMatrix(GapObj(M, recursive=true), m, n, R)
end

function HomalgMatrix(M::Any, R::GapObj)
    return GAP.Globals.HomalgMatrix(GapObj(M, recursive=true), R)
end

export HomalgMatrix

function RepresentationCategoryObject(char::GapObj, category::GapObj, name::String)
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

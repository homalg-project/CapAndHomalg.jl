global CAP_AND_HOMALG_PATH = dirname(@__DIR__)

import GAP
import GAP: @g_str, @gap, GapObj

export GAP
export @g_str, @gap, GapObj

"""
    CapAndHomalg.PKG_DIR

The directory in which to install [GAP](https://www.gap-system.org)
packages from the GitHub organization
[https://github.com/homalg-project/](https://github.com/homalg-project/).
It is equal to `joinpath(pathof(CapAndHomalg), "pkg")`.
"""
global PKG_DIR = joinpath(CAP_AND_HOMALG_PATH, "pkg")

"""
    DownloadPackageFromHomalgProject(pkgname)

Clone the repository named `pkgname` from the GitHub organization
[https://github.com/homalg-project/](https://github.com/homalg-project/)
to the subdirectory [`CapAndHomalg.PKG_DIR`](@ref).
On success return `true` and on failure `false`.

"""
function DownloadPackageFromHomalgProject(pkgname)

    res = GAP.Globals.LoadPackage(GapObj("PackageManager"), false)
    @assert res
    git = GapObj("git")
    clone = GapObj("clone")

    dir = joinpath(PKG_DIR, pkgname)

    if isdir(dir)
        return true
    end

    @info "Cloning into \"" * dir * "\""
    pkgname = GapObj("https://github.com/homalg-project/" * pkgname)
    pkgname =
        GAP.Globals.PKGMAN_Exec(GapObj("."), git, clone, pkgname, GapObj(dir))

    if pkgname.code != 0
        @warn "Cloning failed:\n" * String(pkgname.output)
        return false
    end

    return true

end

export DownloadPackageFromHomalgProject

"""
    UpdatePackageFromHomalgProject(pkgname)

Update the repository named `pkgname` located in the subdirectory
[`CapAndHomalg.PKG_DIR`](@ref) from the GitHub organization
[https://github.com/homalg-project/](https://github.com/homalg-project/).
If the package directory does not exist locally then invoke
[`DownloadPackageFromHomalgProject`](@ref)(`pkgname`).
On success return `true` and on failure `false`.
"""
function UpdatePackageFromHomalgProject(pkgname)

    res = GAP.Globals.LoadPackage(GapObj("PackageManager"), false)
    @assert res
    git = GapObj("git")
    pull = GapObj("pull")

    dir = joinpath(PKG_DIR, pkgname)

    if !isdir(dir)
        return DownloadPackageFromHomalgProject(pkgname)
    end

    @info "Updating \"" * dir * "\""
    pkgname =
        GAP.Globals.PKGMAN_Exec(GapObj(dir), git, pull, GapObj("--ff-only"))

    if pkgname.code != 0
        @warn "Updating failed:\n" * String(pkgname.output)
        return false
    end

    @info String(pkgname.output)
    return true

end

export UpdatePackageFromHomalgProject

"""
    RemovePackageFromHomalgProject(pkgname)

Delete the repository named `pkgname` from the subdirectory
[`CapAndHomalg.PKG_DIR`](@ref).
On success return `true` and on failure `false`.
Removing a repository and re-downloading it might be useful if udpating it fails.
"""
function RemovePackageFromHomalgProject(pkgname)

    res = GAP.Globals.LoadPackage(GapObj("PackageManager"), false)
    @assert res
    rm = GapObj("rm")
    opt = GapObj("-rf")

    dir = joinpath(PKG_DIR, pkgname)

    if !isdir(dir)
        return false
    end

    @info "Removing \"" * dir * "\""
    pkgname = GAP.Globals.PKGMAN_Exec(GapObj("."), rm, opt, GapObj(dir))

    if pkgname.code != 0
        @warn "Remving failed:\n" * String(pkgname.output)
        return false
    end

    return true

end

export RemovePackageFromHomalgProject

##
global PACKAGES_BASED_ON_HOMALG = [
    "homalg_project",
    "OscarForHomalg",
    ##
    "alcove",
    "AlgebraicThomas",
    "ArangoDBInterface",
    "Blocks",
    "D-Modules",
    "LessGenerators",
    "LoopIntegrals",
    "MatroidGeneration",
    "NConvex",
    "ParallelizedIterators",
    "PrimaryDecomposition",
    "Sheaves",
]

##
global PACKAGES_BASED_ON_CAP = [
    "CAP_project",
    ##
    "Algebroids",
    "CategoryConstructor",
    "CategoriesWithAmbientObjects",
    "CatReps",
    "FinSetsForCAP",
    "FinGSetsForCAP",
    "FunctorCategories",
    "GradedCategories",
    "HigherHomologicalAlgebra",
    "IntrinsicCategories",
    "IntrinsicModules",
    "InternalModules",
    "WrapperCategories",
    "LazyCategories",
    "Locales",
    "QPA2",
    "SubcategoriesForCAP",
    "Toposes",
    "ZariskiFrames",
]

##
global PACKAGES_BASED_ON_TORIC_VARIETIES = [
    "ToricVarieties_project",
]

##
global PACKAGES_NEEDED = [
    ##
    "InfiniteLists",
]

"""
    CapAndHomalg.PACKAGES_TO_DOWNLOAD

List of packages which will be considered by
* [`DownloadAllPackagesFromHomalgProject`](@ref)()
* [`UpdateAllPackagesFromHomalgProject`](@ref)()
* [`RemoveAllPackagesFromHomalgProject`](@ref)()
"""
global PACKAGES_TO_DOWNLOAD = vcat(PACKAGES_BASED_ON_HOMALG, PACKAGES_BASED_ON_CAP, PACKAGES_BASED_ON_TORIC_VARIETIES, PACKAGES_NEEDED)

"""
    CapAndHomalg.PACKAGES_DEPRECATED

List of packages deprecated packages.
"""
global PACKAGES_DEPRECATED = [
    "BBGG",
    "Bicomplexes",
    "ComplexesCategories",
    "DerivedCategories",
    "FrobeniusCategories",
    "HomotopyCategories",
    "ModelCategories",
    "QuotientCategories",
    "StableCategories",
    "TriangulatedCategories",
]

"""
    DownloadAllPackagesFromHomalgProject()

Apply [`DownloadPackageFromHomalgProject`](@ref) to all packages
listed in [`PACKAGES_TO_DOWNLOAD`](@ref).
"""
function DownloadAllPackagesFromHomalgProject()

    for pkg in PACKAGES_TO_DOWNLOAD
        DownloadPackageFromHomalgProject(pkg)
    end

end

export DownloadAllPackagesFromHomalgProject

"""
    UpdateAllPackagesFromHomalgProject()

Apply [`UpdatePackageFromHomalgProject`](@ref) to all packages listed
in [`PACKAGES_TO_DOWNLOAD`](@ref).
"""
function UpdateAllPackagesFromHomalgProject()

    for pkg in PACKAGES_TO_DOWNLOAD
        UpdatePackageFromHomalgProject(pkg)
    end

end

export UpdateAllPackagesFromHomalgProject

"""
    RemoveAllPackagesFromHomalgProject()

Apply [`RemovePackageFromHomalgProject`](@ref) to all packages listed
in [`PACKAGES_TO_DOWNLOAD`](@ref).
"""
function RemoveAllPackagesFromHomalgProject()

    for pkg in PACKAGES_TO_DOWNLOAD
        RemovePackageFromHomalgProject(pkg)
    end

end

export RemoveAllPackagesFromHomalgProject

"""
    RemoveDeprecatedPackagesFromHomalgProject()

Apply [`RemovePackageFromHomalgProject`](@ref) to all packages listed
in [`PACKAGES_DEPRECATED`](@ref).
"""
function RemoveDeprecatedPackagesFromHomalgProject()

    for pkg in PACKAGES_DEPRECATED
        RemovePackageFromHomalgProject(pkg)
    end

end

export RemoveDeprecatedPackagesFromHomalgProject

"""
    CapAndHomalg.PACKAGES_TO_COMPILE

The list of all [GAP](https://www.gap-system.org) packages that will
downloaded (once) and installed by `GAP.Packages.install` when
`using Pkg; Pkg.build("HomalgProject")` or when
[`CompilePackagesForHomalgProject`](@ref) is invoked. The latter should be
called once `GAP.jl` gets updated.
"""
global PACKAGES_TO_COMPILE = [
    "Gauss",
    #"Browse", ## do not compile browse as it results into GAP raising the error "Error opening terminal: xterm-256color."
    "io",
    "grape",
    "https://digraphs.github.io/Digraphs/PackageInfo.g",
    "ferret",
    "json",
    "orb",
]

"""
    CompilePackagesForHomalgProject()

Apply [`GAP.Packages.install`] to all packages listed
in [`PACKAGES_TO_COMPILE`](@ref).
"""
function CompilePackagesForHomalgProject()

    for pkg in PACKAGES_TO_COMPILE
        GAP.Packages.install(pkg, interactive = false)
    end

end

export CompilePackagesForHomalgProject

global PACKAGES_DOWNLOADING_EXTERNAL_CODE = ["CddInterface", "NormalizInterface"]

## $(CAP_AND_HOMALG_PATH)/bin should remain the last entry
global HOMALG_PATHS = [
    joinpath(CAP_AND_HOMALG_PATH, "bin"),
    joinpath(CAP_AND_HOMALG_PATH, "bin", "v$(VERSION.major).$(VERSION.minor)"),
]

export HOMALG_PATHS

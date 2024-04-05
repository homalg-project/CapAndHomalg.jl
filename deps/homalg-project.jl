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

    dir = joinpath(PKG_DIR, pkgname)

    if isdir(dir)
        return true
    end

    @info "Cloning into \"$(dir)\""
    try
        run(`git clone https://github.com/homalg-project/$pkgname $dir`)
        run(`git reset --hard \"\$(git rev-list --first-parent -n1 --before '2024-04-04 00:00' origin/master)\"`)
    catch
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

    dir = joinpath(PKG_DIR, pkgname)

    if !isdir(dir)
        return DownloadPackageFromHomalgProject(pkgname)
    end

    @info "Updating \"$(dir)\""
    try
        cd(dir) do
            run(`git pull --ff-only`)
        end
    catch
        return false
    end
    return true

end

export UpdatePackageFromHomalgProject

"""
    RemovePackageFromHomalgProject(pkgname)

Delete the repository named `pkgname` from the subdirectory
[`CapAndHomalg.PKG_DIR`](@ref).
On success return `true` and on failure `false`.
Removing a repository and re-downloading it might be useful if updating it fails.
"""
function RemovePackageFromHomalgProject(pkgname)

    dir = joinpath(PKG_DIR, pkgname)

    if !isdir(dir)
        return false
    end

    @info "Removing \"$(dir)\""
    try
        rm(dir, force=true, recursive=true)
    catch
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
    "CategoricalTowers",
    "FinSetsForCAP",
    "FinGSetsForCAP",
    "HigherHomologicalAlgebra",
    "QPA2",
]

##
global PACKAGES_BASED_ON_TORIC_VARIETIES = [
    "ToricVarieties_project",
]

##
global PACKAGES_NEEDED = [
]

"""
    CapAndHomalg.PACKAGES_TO_DOWNLOAD

List of packages which will be considered by
* [`DownloadAllPackagesFromHomalgProject`](@ref)()
* [`UpdateAllPackagesFromHomalgProject`](@ref)()
* [`UpdateAllPackagesFromHomalgProjectInParallel`](@ref)()
* [`RemoveAllPackagesFromHomalgProject`](@ref)()
"""
global PACKAGES_TO_DOWNLOAD = vcat(PACKAGES_BASED_ON_HOMALG, PACKAGES_BASED_ON_CAP, PACKAGES_BASED_ON_TORIC_VARIETIES, PACKAGES_NEEDED)

"""
    CapAndHomalg.PACKAGES_DEPRECATED

List of deprecated packages.
"""
global PACKAGES_DEPRECATED = [
    "Algebroids",
    "BBGG",
    "Bicomplexes",
    "CategoryConstructor",
    "CategoriesWithAmbientObjects",
    "CatReps",
    "ComplexesCategories",
    "DerivedCategories",
    "ExteriorPowersCategories",
    "FrobeniusCategories",
    "FunctorCategories",
    "GradedCategories",
    "HomotopyCategories",
    "InfiniteLists",
    "InternalModules",
    "IntrinsicCategories",
    "IntrinsicGradedModules",
    "IntrinsicModules",
    "LazyCategories",
    "Locales",
    "ModelCategories",
    "QuotientCategories",
    "StableCategories",
    "SubcategoriesForCAP",
    "Toposes",
    "TriangulatedCategories",
    "WrapperCategories",
    "ZariskiFrames",
]

"""
    DownloadAllPackagesFromHomalgProject()

Apply [`DownloadPackageFromHomalgProject`](@ref) to all packages
listed in [`CapAndHomalg.PACKAGES_TO_DOWNLOAD`](@ref).
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
in [`CapAndHomalg.PACKAGES_TO_DOWNLOAD`](@ref).
"""
function UpdateAllPackagesFromHomalgProject()

    for pkg in PACKAGES_TO_DOWNLOAD
        UpdatePackageFromHomalgProject(pkg)
    end

end

export UpdateAllPackagesFromHomalgProject

"""
    UpdateAllPackagesFromHomalgProjectInParallel()

Apply [`UpdatePackageFromHomalgProject`](@ref) to all packages listed
in [`CapAndHomalg.PACKAGES_TO_DOWNLOAD`](@ref) in parallel. The output of the git
commands might get intertwined.
"""
function UpdateAllPackagesFromHomalgProjectInParallel()

    @sync for pkg in PACKAGES_TO_DOWNLOAD
        @async UpdatePackageFromHomalgProject(pkg)
    end

end

export UpdateAllPackagesFromHomalgProjectInParallel

"""
    RemoveAllPackagesFromHomalgProject()

Apply [`RemovePackageFromHomalgProject`](@ref) to all packages listed
in [`CapAndHomalg.PACKAGES_TO_DOWNLOAD`](@ref).
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
in [`CapAndHomalg.PACKAGES_DEPRECATED`](@ref).
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
    "AutoDoc",
    "Gauss",
    #"Browse", ## do not compile browse as it results into GAP raising the error "Error opening terminal: xterm-256color."
    "datastructures",
    "io",
    "orb",
    "grape",
    "digraphs",
    "ferret",
    "images",
    "json",
    "repsn",
]

"""
    CompilePackagesForHomalgProject()

Apply [`GAP.Packages.install`] to all packages listed
in [`CapAndHomalg.PACKAGES_TO_COMPILE`](@ref).
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

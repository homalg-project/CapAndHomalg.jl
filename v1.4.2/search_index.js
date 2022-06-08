var documenterSearchIndex = {"docs":
[{"location":"examples/#CapAndHomalg.jl","page":"Examples","title":"CapAndHomalg.jl","text":"","category":"section"},{"location":"examples/#Examples","page":"Examples","title":"Examples","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"The following examples tests the functionality of the software projects","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"homalg project\nCAP project","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"DocTestSetup = quote\nend","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"julia> using CapAndHomalg\n\njulia> LoadPackage( \"GradedModules\" )\n\njulia> ℚ = HomalgFieldOfRationalsInSingular( )\nGAP: Q\n\njulia> R = ℚ[\"x,y,z\"]\nGAP: Q[x,y,z]\n\njulia> m = \"[ x*y,y*z,z,0,0, x^3*z,x^2*z^2,0,x*z^2,-z^2, x^4,x^3*z,0,x^2*z,-x*z, 0,0,x*y,-y^2,x^2-1, 0,0,x^2*z,-x*y*z,y*z, 0,0,x^2*y-x^2,-x*y^2+x*y,y^2-y ]\";\n\njulia> m = HomalgMatrix( m, 6, 5, R )\nGAP: <A 6 x 5 matrix over an external ring>\n\njulia> M = LeftPresentation( m )\nGAP: <A left module presented by 6 relations for 5 generators>\n\njulia> Display( M )\nx*y,  y*z,    z,        0,         0,\nx^3*z,x^2*z^2,0,        x*z^2,     -z^2,\nx^4,  x^3*z,  0,        x^2*z,     -x*z,\n0,    0,      x*y,      -y^2,      x^2-1,\n0,    0,      x^2*z,    -x*y*z,    y*z,\n0,    0,      x^2*y-x^2,-x*y^2+x*y,y^2-y\n\nCokernel of the map\n\nQ[x,y,z]^(1x6) --> Q[x,y,z]^(1x5),\n\ncurrently represented by the above matrix\n\njulia> filt = PurityFiltration( M )\nGAP: <The ascending purity filtration with degrees [ -3 .. 0 ] and graded parts:\n   0:\t<A codegree-[ 1, 1 ]-pure rank 2 left module presented by 3 relations for 4 generators>\n  -1:\t<A codegree-1-pure grade 1 left module presented by 4 relations for 3 generators>\n  -2:\t<A cyclic reflexively pure grade 2 left module presented by 2 relations for a cyclic generator>\n  -3:\t<A cyclic reflexively pure grade 3 left module presented by 3 relations for a cyclic generator>\nof\n<A non-pure rank 2 left module presented by 6 relations for 5 generators>>\n\njulia> Display( filt )\nDegree 0:\n\n0,  0,x, -y,\nx*y,0,-z,0,\nx^2,0,0, -z\n\nCokernel of the map\n\nQ[x,y,z]^(1x3) --> Q[x,y,z]^(1x4),\n\ncurrently represented by the above matrix\n----------\nDegree -1:\n\ny,-z,0,\n0,x, -y,\nx,0, -z,\n0,-y,x^2-1\n\nCokernel of the map\n\nQ[x,y,z]^(1x4) --> Q[x,y,z]^(1x3),\n\ncurrently represented by the above matrix\n----------\nDegree -2:\n\nQ[x,y,z]/< z, y-1 >\n----------\nDegree -3:\n\nQ[x,y,z]/< z, y, x >\n\njulia> II_E = SpectralSequence( filt )\nGAP: <A stable homological spectral sequence with sheets at levels [ 0 .. 4 ] each consisting of left modules at bidegrees [ -3 .. 0 ]x[ 0 .. 3 ]>\n\njulia> Display( II_E )\nThe associated transposed spectral sequence:\n\na homological spectral sequence at bidegrees\n[ [ 0 .. 3 ], [ -3 .. 0 ] ]\n---------\nLevel 0:\n\n * * * *\n * * * *\n . * * *\n . . * *\n---------\nLevel 1:\n\n * * * *\n . . . .\n . . . .\n . . . .\n---------\nLevel 2:\n\n s . . .\n . . . .\n . . . .\n . . . .\n\nNow the spectral sequence of the bicomplex:\n\na homological spectral sequence at bidegrees\n[ [ -3 .. 0 ], [ 0 .. 3 ] ]\n---------\nLevel 0:\n\n * * * *\n * * * *\n . * * *\n . . * *\n---------\nLevel 1:\n\n * * * *\n * * * *\n . * * *\n . . . *\n---------\nLevel 2:\n\n s . . .\n * s . .\n . * * .\n . . . *\n---------\nLevel 3:\n\n s . . .\n * s . .\n . . s .\n . . . *\n---------\nLevel 4:\n\n s . . .\n . s . .\n . . s .\n . . . s\n\njulia> FilteredByPurity( M )\nGAP: <A non-pure rank 2 left module presented by 12 relations for 9 generators>\n\njulia> Display( M )\n0,  0,x, -y,0,1, 0,    0,  0,\nx*y,0,-z,0, 0,0, 0,    0,  0,\nx^2,0,0, -z,1,0, 0,    0,  0,\n0,  0,0, 0, y,-z,0,    0,  0,\n0,  0,0, 0, 0,x, -y,   -1, 0,\n0,  0,0, 0, x,0, -z,   0,  -1,\n0,  0,0, 0, 0,-y,x^2-1,0,  0,\n0,  0,0, 0, 0,0, 0,    z,  0,\n0,  0,0, 0, 0,0, 0,    y-1,0,\n0,  0,0, 0, 0,0, 0,    0,  z,\n0,  0,0, 0, 0,0, 0,    0,  y,\n0,  0,0, 0, 0,0, 0,    0,  x\n\nCokernel of the map\n\nQ[x,y,z]^(1x12) --> Q[x,y,z]^(1x9),\n\ncurrently represented by the above matrix\n\njulia> OnFirstStoredPresentation( M )\nGAP: <A non-pure rank 2 left module presented by 6 relations for 5 generators>\n\njulia> Display( M )\nx*y,  y*z,    z,        0,         0,\nx^3*z,x^2*z^2,0,        x*z^2,     -z^2,\nx^4,  x^3*z,  0,        x^2*z,     -x*z,\n0,    0,      x*y,      -y^2,      x^2-1,\n0,    0,      x^2*z,    -x*y*z,    y*z,\n0,    0,      x^2*y-x^2,-x*y^2+x*y,y^2-y\n\nCokernel of the map\n\nQ[x,y,z]^(1x6) --> Q[x,y,z]^(1x5),\n\ncurrently represented by the above matrix\n\njulia> OnLastStoredPresentation( M )\nGAP: <A non-pure rank 2 left module presented by 12 relations for 9 generators>\n\njulia> Display( M )\n0,  0,x, -y,0,1, 0,    0,  0,\nx*y,0,-z,0, 0,0, 0,    0,  0,\nx^2,0,0, -z,1,0, 0,    0,  0,\n0,  0,0, 0, y,-z,0,    0,  0,\n0,  0,0, 0, 0,x, -y,   -1, 0,\n0,  0,0, 0, x,0, -z,   0,  -1,\n0,  0,0, 0, 0,-y,x^2-1,0,  0,\n0,  0,0, 0, 0,0, 0,    z,  0,\n0,  0,0, 0, 0,0, 0,    y-1,0,\n0,  0,0, 0, 0,0, 0,    0,  z,\n0,  0,0, 0, 0,0, 0,    0,  y,\n0,  0,0, 0, 0,0, 0,    0,  x\n\nCokernel of the map\n\nQ[x,y,z]^(1x12) --> Q[x,y,z]^(1x9),\n\ncurrently represented by the above matrix\n","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"julia> using CapAndHomalg\n\njulia> LoadPackage( \"GradedModulePresentationsForCAP\" )\n\njulia> ℚ = HomalgFieldOfRationalsInSingular( )\nGAP: Q\n\njulia> S = GradedRing( ℚ[\"x,y\"] )\nGAP: Q[x,y]\n(weights: yet unset)\n\njulia> Sgrmod = GradedLeftPresentations( S )\nGAP: The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ])\n\njulia> InfoOfInstalledOperationsOfCategory( Sgrmod )\n40 primitive operations were used to derive 290 operations for this category which constructively\n* IsMonoidalCategory\n* IsAbelianCategoryWithEnoughProjectives\n\njulia> #ListPrimitivelyInstalledOperationsOfCategory( Sgrmod )\n\njulia> M = GradedFreeLeftPresentation( 2, S, @gap([ 1, 1 ]) )\nGAP: <An object in The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ])>\n\njulia> N = GradedFreeLeftPresentation( 1, S, @gap([ 0 ]) )\nGAP: <An object in The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ])>\n\njulia> mat = HomalgMatrix( \"[x,y]\", 2, 1, S )\nGAP: <A 2 x 1 matrix over a graded ring>\n\njulia> Display( mat )\nx,\ny\n(over a graded ring)\n\njulia> ϕ = GradedPresentationMorphism( M, mat, N )\nGAP: <A morphism in The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ])>\n\njulia> IsWellDefined( ϕ )\ntrue\n\njulia> IsMonomorphism( ϕ )\nfalse\n\njulia> IsEpimorphism( ϕ )\nfalse\n\njulia> ι = ImageEmbedding( ϕ )\nGAP: <A monomorphism in The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ])>\n\njulia> IsMonomorphism( ι )\ntrue\n\njulia> IsIsomorphism( ι )\nfalse\n\njulia> coker_mod = CokernelObject( ϕ )\nGAP: <An object in The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ])>\n\njulia> Display( coker_mod )\nx,\ny\n(over a graded ring)\n\nAn object in The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ])\n\n(graded, degree of generator:[ 0 ])\n\njulia> IsZero( coker_mod )\nfalse\n\njulia> is_artinian = GapObj( M -> AffineDimension( M ) <= 0 );\n\njulia> SetNameFunction( is_artinian, g\"is_artinian\" )\n\njulia> C = FullSubcategoryByMembershipFunction( Sgrmod, is_artinian )\nGAP: <Subcategory of The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ]) by is_artinian>\n\njulia> CohP1 = Sgrmod / C\nGAP: The Serre quotient category of The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ]) by test function with name: is_artinian\n\njulia> InfoOfInstalledOperationsOfCategory( CohP1 )\n21 primitive operations were used to derive 241 operations for this category which constructively\n* IsAbelianCategory\n\njulia> Sh = CanonicalProjection( CohP1 )\nGAP: Localization functor of The Serre quotient category of The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ]) by test function with name: is_artinian\n\njulia> InstallFunctor( Sh, g\"Sheafification\" )\n\njulia> ψ = ApplyFunctor( Sh, ϕ )\nGAP: <A morphism in The Serre quotient category of The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ]) by test function with name: is_artinian>\n\njulia> IsMonomorphism( ψ )\nfalse\n\njulia> IsEpimorphism( ψ )\ntrue\n\njulia> coker_shv = CokernelObject( ψ )\nGAP: <A zero object in The Serre quotient category of The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ]) by test function with name: is_artinian>\n\njulia> IsZero( coker_shv )\ntrue\n\njulia> ϵ = ApplyFunctor( Sh, ι )\nGAP: <A morphism in The Serre quotient category of The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ]) by test function with name: is_artinian>\n\njulia> IsIsomorphism( ϵ )\ntrue\n","category":"page"},{"location":"examples/","page":"Examples","title":"Examples","text":"DocTestSetup = nothing","category":"page"},{"location":"#CapAndHomalg.jl","page":"Home","title":"CapAndHomalg.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = CapAndHomalg","category":"page"},{"location":"#Introduction","page":"Home","title":"Introduction","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The Julia package CapAndHomalg provides simplified access to the repositories of the GAP packages hosted on the GitHub organization homalg-project, most of which are based on the","category":"page"},{"location":"","page":"Home","title":"Home","text":"CAP project,\nhomalg project.","category":"page"},{"location":"","page":"Home","title":"Home","text":"These are open source GAP multi-package projects for constructive category theory and homological algebra with applications to module theory of commutative and non-commutative algebras and algebraic geometry.","category":"page"},{"location":"#Installation","page":"Home","title":"Installation","text":"","category":"section"},{"location":"#Install-Julia","page":"Home","title":"Install Julia","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"To install Julia follow the first Steps 0 and 1 on our installation page.","category":"page"},{"location":"#Install-CapAndHomalg.jl","page":"Home","title":"Install CapAndHomalg.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Then start julia in a terminal and add the package CapAndHomalg:","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> using Pkg; Pkg.add(\"CapAndHomalg\")\n\njulia> using CapAndHomalg","category":"page"},{"location":"#Testing","page":"Home","title":"Testing","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The correctness of the installation and the availability of the functionality can at any time be tested using","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> using Pkg; Pkg.test(\"CapAndHomalg\")","category":"page"},{"location":"#Updating","page":"Home","title":"Updating","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"After each update of the Julia package GAP a rebuild is (probably) necessary:","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> using Pkg; Pkg.update(\"CapAndHomalg\")\n\njulia> Pkg.build(\"CapAndHomalg\")","category":"page"},{"location":"","page":"Home","title":"Home","text":"This will also clone the repositories listed in CapAndHomalg.PACKAGES_TO_DOWNLOAD using DownloadAllPackagesFromHomalgProject and compile the packages listed in CapAndHomalg.PACKAGES_TO_COMPILE using GAP.Packages.install(pkgname).","category":"page"},{"location":"","page":"Home","title":"Home","text":"version\nPKG_DIR\nPACKAGES_TO_DOWNLOAD\nDownloadAllPackagesFromHomalgProject\nUpdateAllPackagesFromHomalgProject\nRemoveAllPackagesFromHomalgProject\nDownloadPackageFromHomalgProject\nUpdatePackageFromHomalgProject\nRemovePackageFromHomalgProject\nPACKAGES_TO_COMPILE","category":"page"},{"location":"#CapAndHomalg.version","page":"Home","title":"CapAndHomalg.version","text":"CapAndHomalg.version\n\nThe version number of the loaded CapAndHomalg. Please mention this number in any bug report.\n\n\n\n\n\n","category":"constant"},{"location":"#CapAndHomalg.PKG_DIR","page":"Home","title":"CapAndHomalg.PKG_DIR","text":"CapAndHomalg.PKG_DIR\n\nThe directory in which to install GAP packages from the GitHub organization https://github.com/homalg-project/. It is equal to joinpath(pathof(CapAndHomalg), \"pkg\").\n\n\n\n\n\n","category":"constant"},{"location":"#CapAndHomalg.PACKAGES_TO_DOWNLOAD","page":"Home","title":"CapAndHomalg.PACKAGES_TO_DOWNLOAD","text":"CapAndHomalg.PACKAGES_TO_DOWNLOAD\n\nList of packages which will be considered by\n\nDownloadAllPackagesFromHomalgProject()\nUpdateAllPackagesFromHomalgProject()\nRemoveAllPackagesFromHomalgProject()\n\n\n\n\n\n","category":"constant"},{"location":"#CapAndHomalg.DownloadAllPackagesFromHomalgProject","page":"Home","title":"CapAndHomalg.DownloadAllPackagesFromHomalgProject","text":"DownloadAllPackagesFromHomalgProject()\n\nApply DownloadPackageFromHomalgProject to all packages listed in PACKAGES_TO_DOWNLOAD.\n\n\n\n\n\n","category":"function"},{"location":"#CapAndHomalg.UpdateAllPackagesFromHomalgProject","page":"Home","title":"CapAndHomalg.UpdateAllPackagesFromHomalgProject","text":"UpdateAllPackagesFromHomalgProject()\n\nApply UpdatePackageFromHomalgProject to all packages listed in PACKAGES_TO_DOWNLOAD.\n\n\n\n\n\n","category":"function"},{"location":"#CapAndHomalg.RemoveAllPackagesFromHomalgProject","page":"Home","title":"CapAndHomalg.RemoveAllPackagesFromHomalgProject","text":"RemoveAllPackagesFromHomalgProject()\n\nApply RemovePackageFromHomalgProject to all packages listed in PACKAGES_TO_DOWNLOAD.\n\n\n\n\n\n","category":"function"},{"location":"#CapAndHomalg.DownloadPackageFromHomalgProject","page":"Home","title":"CapAndHomalg.DownloadPackageFromHomalgProject","text":"DownloadPackageFromHomalgProject(pkgname)\n\nClone the repository named pkgname from the GitHub organization https://github.com/homalg-project/ to the subdirectory CapAndHomalg.PKG_DIR. On success return true and on failure false.\n\n\n\n\n\n","category":"function"},{"location":"#CapAndHomalg.UpdatePackageFromHomalgProject","page":"Home","title":"CapAndHomalg.UpdatePackageFromHomalgProject","text":"UpdatePackageFromHomalgProject(pkgname)\n\nUpdate the repository named pkgname located in the subdirectory CapAndHomalg.PKG_DIR from the GitHub organization https://github.com/homalg-project/. If the package directory does not exist locally then invoke DownloadPackageFromHomalgProject(pkgname). On success return true and on failure false.\n\n\n\n\n\n","category":"function"},{"location":"#CapAndHomalg.RemovePackageFromHomalgProject","page":"Home","title":"CapAndHomalg.RemovePackageFromHomalgProject","text":"RemovePackageFromHomalgProject(pkgname)\n\nDelete the repository named pkgname from the subdirectory CapAndHomalg.PKG_DIR. On success return true and on failure false. Removing a repository and re-downloading it might be useful if updating it fails.\n\n\n\n\n\n","category":"function"},{"location":"#CapAndHomalg.PACKAGES_TO_COMPILE","page":"Home","title":"CapAndHomalg.PACKAGES_TO_COMPILE","text":"CapAndHomalg.PACKAGES_TO_COMPILE\n\nThe list of all GAP packages that will downloaded (once) and installed by GAP.Packages.install when using Pkg; Pkg.build(\"HomalgProject\") or when CompilePackagesForHomalgProject is invoked. The latter should be called once GAP.jl gets updated.\n\n\n\n\n\n","category":"constant"},{"location":"#Software-dependency","page":"Home","title":"Software dependency","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"CapAndHomalg relies on the","category":"page"},{"location":"","page":"Home","title":"Home","text":"computer algebra systems through the Julia packages\nGAP Gap.jl\nSingular Singular_jll.jl","category":"page"},{"location":"","page":"Home","title":"Home","text":"all of which are components of the computer algebra system OSCAR.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Some of the bundled packages use the GAP packages","category":"page"},{"location":"","page":"Home","title":"Home","text":"IO\nferret\njson\nQPA2","category":"page"},{"location":"","page":"Home","title":"Home","text":"and the","category":"page"},{"location":"","page":"Home","title":"Home","text":"third party software through the GAP packages and the Julia packages\nGraphviz dot-format generating code like in [Digraphs][Digraphs] [Graphvizjll.jl][Graphvizjll.jl]\n4ti2 [4ti2Interface][4ti2Interface] [lib4ti2jll.jl][lib4ti2jll.jl]","category":"page"},{"location":"","page":"Home","title":"Home","text":"<!– | cddlib         | [CddInterface][CddInterface]                            | [cddlibjll.jl][cddlibjll.jl]     | | Normaliz | [NormalizInterface][NormalizInterface]                  | [normalizjll.jl][normalizjll.jl] | –>","category":"page"},{"location":"#General-Disclaimer","page":"Home","title":"General Disclaimer","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The software comes with absolutely no warranty and will most likely have errors. If you use it for computations, please check the correctness of the result very carefully.","category":"page"},{"location":"","page":"Home","title":"Home","text":"This software is licensed under the LGPL, version 3, or any later version.","category":"page"},{"location":"#Funding","page":"Home","title":"Funding","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The development of this package and many of the GAP packages hosted on the GitHub organization homalg-project was partially funded by the DFG (German Research Foundation) through the","category":"page"},{"location":"","page":"Home","title":"Home","text":"Special Priority Project SPP 1489,\nTransregional Collaborative Research Centre SFB-TRR 195.","category":"page"},{"location":"","page":"Home","title":"Home","text":"[Digraphs]: https://github.com/gap-packages/digraphs/#readme [4ti2Interface]: https://github.com/homalg-project/homalgproject/tree/master/4ti2Interface/#readme [CddInterface]: https://github.com/homalg-project/CddInterface/#readme [NormalizInterface]: https://github.com/gap-packages/NormalizInterface/#readme [Graphvizjll.jl]: https://github.com/JuliaBinaryWrappers/Graphvizjll.jl/ [lib4ti2jll.jl]: https://github.com/JuliaBinaryWrappers/lib4ti2jll.jl/ [cddlibjll.jl]: https://github.com/JuliaBinaryWrappers/cddlibjll.jl/ [normalizjll.jl]: https://github.com/JuliaBinaryWrappers/normaliz_jll.jl/","category":"page"},{"location":"#Index","page":"Home","title":"Index","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"}]
}

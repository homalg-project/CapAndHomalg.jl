# CapAndHomalg.jl

## Examples

The following examples tests the functionality of the software projects
* [homalg project](https://github.com/homalg-project/homalg_project)
* [CAP project](https://github.com/homalg-project/CAP_project)

```@meta
DocTestSetup = quote
end
```

```jldoctest
julia> using CapAndHomalg

julia> LoadPackage( "GradedModules" )

julia> ℚ = HomalgFieldOfRationalsInSingular( )
GAP: Q

julia> R = ℚ["x,y,z"]
GAP: Q[x,y,z]

julia> m = "[ x*y,y*z,z,0,0, x^3*z,x^2*z^2,0,x*z^2,-z^2, x^4,x^3*z,0,x^2*z,-x*z, 0,0,x*y,-y^2,x^2-1, 0,0,x^2*z,-x*y*z,y*z, 0,0,x^2*y-x^2,-x*y^2+x*y,y^2-y ]";

julia> m = HomalgMatrix( m, 6, 5, R )
GAP: <A 6 x 5 matrix over an external ring>

julia> M = LeftPresentation( m )
GAP: <A left module presented by 6 relations for 5 generators>

julia> Display( M )
x*y,  y*z,    z,        0,         0,
x^3*z,x^2*z^2,0,        x*z^2,     -z^2,
x^4,  x^3*z,  0,        x^2*z,     -x*z,
0,    0,      x*y,      -y^2,      x^2-1,
0,    0,      x^2*z,    -x*y*z,    y*z,
0,    0,      x^2*y-x^2,-x*y^2+x*y,y^2-y

Cokernel of the map

Q[x,y,z]^(1x6) --> Q[x,y,z]^(1x5),

currently represented by the above matrix

julia> filt = PurityFiltration( M )
GAP: <The ascending purity filtration with degrees [ -3 .. 0 ] and graded parts:
   0:   <A codegree-[ 1, 1 ]-pure rank 2 left module presented by 3 relations for 4 generators>
  -1:   <A codegree-1-pure grade 1 left module presented by 4 relations for 3 generators>
  -2:   <A cyclic reflexively pure grade 2 left module presented by 2 relations for a cyclic generator>
  -3:   <A cyclic reflexively pure grade 3 left module presented by 3 relations for a cyclic generator>
of
<A non-pure rank 2 left module presented by 6 relations for 5 generators>>

julia> Display( filt )
Degree 0:

0,  0,x, -y,
x*y,0,-z,0,
x^2,0,0, -z

Cokernel of the map

Q[x,y,z]^(1x3) --> Q[x,y,z]^(1x4),

currently represented by the above matrix
----------
Degree -1:

y,-z,0,
0,x, -y,
x,0, -z,
0,-y,x^2-1

Cokernel of the map

Q[x,y,z]^(1x4) --> Q[x,y,z]^(1x3),

currently represented by the above matrix
----------
Degree -2:

Q[x,y,z]/< z, y-1 >
----------
Degree -3:

Q[x,y,z]/< z, y, x >

julia> II_E = SpectralSequence( filt )
GAP: <A stable homological spectral sequence with sheets at levels [ 0 .. 4 ] each consisting of left modules at bidegrees [ -3 .. 0 ]x[ 0 .. 3 ]>

julia> Display( II_E )
The associated transposed spectral sequence:

a homological spectral sequence at bidegrees
[ [ 0 .. 3 ], [ -3 .. 0 ] ]
---------
Level 0:

 * * * *
 * * * *
 . * * *
 . . * *
---------
Level 1:

 * * * *
 . . . .
 . . . .
 . . . .
---------
Level 2:

 s . . .
 . . . .
 . . . .
 . . . .

Now the spectral sequence of the bicomplex:

a homological spectral sequence at bidegrees
[ [ -3 .. 0 ], [ 0 .. 3 ] ]
---------
Level 0:

 * * * *
 * * * *
 . * * *
 . . * *
---------
Level 1:

 * * * *
 * * * *
 . * * *
 . . . *
---------
Level 2:

 s . . .
 * s . .
 . * * .
 . . . *
---------
Level 3:

 s . . .
 * s . .
 . . s .
 . . . *
---------
Level 4:

 s . . .
 . s . .
 . . s .
 . . . s

julia> FilteredByPurity( M )
GAP: <A non-pure rank 2 left module presented by 12 relations for 9 generators>

julia> Display( M )
0,  0,x, -y,0,1, 0,    0,  0,
x*y,0,-z,0, 0,0, 0,    0,  0,
x^2,0,0, -z,1,0, 0,    0,  0,
0,  0,0, 0, y,-z,0,    0,  0,
0,  0,0, 0, 0,x, -y,   -1, 0,
0,  0,0, 0, x,0, -z,   0,  -1,
0,  0,0, 0, 0,-y,x^2-1,0,  0,
0,  0,0, 0, 0,0, 0,    z,  0,
0,  0,0, 0, 0,0, 0,    y-1,0,
0,  0,0, 0, 0,0, 0,    0,  z,
0,  0,0, 0, 0,0, 0,    0,  y,
0,  0,0, 0, 0,0, 0,    0,  x

Cokernel of the map

Q[x,y,z]^(1x12) --> Q[x,y,z]^(1x9),

currently represented by the above matrix

julia> OnFirstStoredPresentation( M )
GAP: <A non-pure rank 2 left module presented by 6 relations for 5 generators>

julia> Display( M )
x*y,  y*z,    z,        0,         0,
x^3*z,x^2*z^2,0,        x*z^2,     -z^2,
x^4,  x^3*z,  0,        x^2*z,     -x*z,
0,    0,      x*y,      -y^2,      x^2-1,
0,    0,      x^2*z,    -x*y*z,    y*z,
0,    0,      x^2*y-x^2,-x*y^2+x*y,y^2-y

Cokernel of the map

Q[x,y,z]^(1x6) --> Q[x,y,z]^(1x5),

currently represented by the above matrix

julia> OnLastStoredPresentation( M )
GAP: <A non-pure rank 2 left module presented by 12 relations for 9 generators>

julia> Display( M )
0,  0,x, -y,0,1, 0,    0,  0,
x*y,0,-z,0, 0,0, 0,    0,  0,
x^2,0,0, -z,1,0, 0,    0,  0,
0,  0,0, 0, y,-z,0,    0,  0,
0,  0,0, 0, 0,x, -y,   -1, 0,
0,  0,0, 0, x,0, -z,   0,  -1,
0,  0,0, 0, 0,-y,x^2-1,0,  0,
0,  0,0, 0, 0,0, 0,    z,  0,
0,  0,0, 0, 0,0, 0,    y-1,0,
0,  0,0, 0, 0,0, 0,    0,  z,
0,  0,0, 0, 0,0, 0,    0,  y,
0,  0,0, 0, 0,0, 0,    0,  x

Cokernel of the map

Q[x,y,z]^(1x12) --> Q[x,y,z]^(1x9),

currently represented by the above matrix

```

```jldoctest
julia> using CapAndHomalg

julia> LoadPackage( "GradedModulePresentationsForCAP" )

julia> ℚ = HomalgFieldOfRationalsInSingular( )
GAP: Q

julia> S = GradedRing( ℚ["x,y"] )
GAP: Q[x,y]
(weights: yet unset)

julia> Sgrmod = GradedLeftPresentations( S )
GAP: The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ])

julia> InfoOfInstalledOperationsOfCategory( Sgrmod )
38 primitive operations were used to derive 331 operations for this category which algorithmically
* IsMonoidalCategory
* IsAbelianCategoryWithEnoughProjectives
and not yet algorithmically
* IsSymmetricClosedMonoidalCategory

julia> #ListPrimitivelyInstalledOperationsOfCategory( Sgrmod )

julia> M = GradedFreeLeftPresentation( 2, S, @gap([ 1, 1 ]) )
GAP: <An object in The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ])>

julia> N = GradedFreeLeftPresentation( 1, S, @gap([ 0 ]) )
GAP: <An object in The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ])>

julia> mat = HomalgMatrix( "[x,y]", 2, 1, S )
GAP: <A 2 x 1 matrix over a graded ring>

julia> Display( mat )
x,
y
(over a graded ring)

julia> ϕ = GradedPresentationMorphism( M, mat, N )
GAP: <A morphism in The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ])>

julia> IsWellDefined( ϕ )
true

julia> IsMonomorphism( ϕ )
false

julia> IsEpimorphism( ϕ )
false

julia> ι = ImageEmbedding( ϕ )
GAP: <A monomorphism in The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ])>

julia> IsMonomorphism( ι )
true

julia> IsIsomorphism( ι )
false

julia> coker_mod = CokernelObject( ϕ )
GAP: <An object in The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ])>

julia> Display( coker_mod )
x,
y
(over a graded ring)

An object in The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ])

(graded, degree of generator:[ 0 ])

julia> IsZero( coker_mod )
false

julia> is_artinian = GapObj( M -> AffineDimension( M ) <= 0 );

julia> SetNameFunction( is_artinian, g"is_artinian" )

julia> C = FullSubcategoryByMembershipFunction( Sgrmod, is_artinian )
GAP: <Subcategory of The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ]) by is_artinian>

julia> CohP1 = Sgrmod / C
GAP: The Serre quotient category of The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ]) by test function with name: is_artinian

julia> InfoOfInstalledOperationsOfCategory( CohP1 )
21 primitive operations were used to derive 286 operations for this category which algorithmically
* IsAbelianCategory

julia> Sh = CanonicalProjection( CohP1 )
GAP: Localization functor of The Serre quotient category of The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ]) by test function with name: is_artinian

julia> InstallFunctor( Sh, g"Sheafification" )

julia> ψ = ApplyFunctor( Sh, ϕ )
GAP: <A morphism in The Serre quotient category of The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ]) by test function with name: is_artinian>

julia> IsMonomorphism( ψ )
false

julia> IsEpimorphism( ψ )
true

julia> coker_shv = CokernelObject( ψ )
GAP: <A zero object in The Serre quotient category of The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ]) by test function with name: is_artinian>

julia> IsZero( coker_shv )
true

julia> ϵ = ApplyFunctor( Sh, ι )
GAP: <A morphism in The Serre quotient category of The category of graded left f.p. modules over Q[x,y] (with weights [ 1, 1 ]) by test function with name: is_artinian>

julia> IsIsomorphism( ϵ )
true

```

```@meta
DocTestSetup = nothing
```

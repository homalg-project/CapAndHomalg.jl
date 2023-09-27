<!-- BEGIN HEADER -->
# CapAndHomalg.jl&ensp;<sup><sup>[![View code][code-img]][code-url]</sup></sup>

### Simplified access to the repositories of the GitHub organization homalg-project

| **Documentation** | **Build Status** | **GitHub Actions** |
|:-----------------:|:----------------:|:------------------:|
| [![][docs-stable-img]][docs-stable-url] [![][docs-dev-img]][docs-dev-url] | [![][tests-img]][tests-url] [![][codecov-img]][codecov-url] | [![][tagbot-img]][tagbot-url] [![][docsbuilder-img]][docsbuilder-url] [![][compathelper-img]][compathelper-url] |

<!-- END HEADER -->

## Introduction

The [Julia](https://julialang.org/) package `CapAndHomalg` provides simplified access to the repositories of the [GAP](https://www.gap-system.org/) packages hosted on the [GitHub organization homalg-project](https://homalg-project.github.io/), most of which are based on the

* [CAP project](https://github.com/homalg-project/CAP_project#readme),
* [homalg project](https://github.com/homalg-project/homalg_project#readme).

These are open source [GAP](https://www.gap-system.org) multi-package projects for constructive category theory and homological algebra with applications to module theory of commutative and non-commutative algebras and algebraic geometry.

## Installation

#### Install Julia

To install Julia follow the first Steps 0 and 1 on our [installation page](https://homalg-project.github.io/docs/installation).

#### Install `CapAndHomalg.jl`

Then start `julia` in a terminal and add the package `CapAndHomalg`:

```julia
julia> using Pkg; Pkg.add("CapAndHomalg")

julia> using CapAndHomalg
```

For more information on the included [GAP](https://www.gap-system.org) packages see the [documentation](https://homalg-project.github.io/CapAndHomalg.jl/dev/#Installation-1).

The correctness of the installation and the availability of the functionality can at any time be tested using

```julia
julia> using Pkg; Pkg.test("CapAndHomalg")
```

After each update of the Julia package `GAP` a rebuild is (probably) necessary:

```julia
julia> using Pkg; Pkg.build("CapAndHomalg")
```

## Software dependency

`CapAndHomalg` relies on the

| computer algebra systems                    | through the Julia packages                                                |
|:-------------------------------------------:|:-------------------------------------------------------------------------:|
| [GAP](https://www.gap-system.org/)          | [Gap.jl](https://github.com/oscar-system/GAP.jl)                          |
| [Singular](https://www.singular.uni-kl.de/) | [Singular_jll.jl](https://github.com/JuliaBinaryWrappers/Singular_jll.jl) |

all of which are components of the computer algebra system [OSCAR](https://oscar.computeralgebra.de/).

Some of the bundled packages use the [GAP](https://www.gap-system.org) packages

* [IO](https://github.com/gap-packages/io/)
* [ferret](https://github.com/gap-packages/ferret/)
* [json](https://github.com/gap-packages/json/)
* [QPA2](https://github.com/sunnyquiver/QPA2/)

and the

| third party software                                | through the GAP packages                                | and the Julia packages             |
|:---------------------------------------------------:|:-------------------------------------------------------:|:----------------------------------:|
| [Graphviz](https://graphviz.org/)                   | dot-format generating code like in [Digraphs][Digraphs] | [Graphviz_jll.jl][Graphviz_jll.jl] |
| [4ti2](https://4ti2.github.io/)                     | [4ti2Interface][4ti2Interface]                          | [lib4ti2_jll.jl][lib4ti2_jll.jl]   |

<!--
| [cddlib](https://github.com/cddlib/cddlib/)         | [CddInterface][CddInterface]                            | [cddlib_jll.jl][cddlib_jll.jl]     |
| [Normaliz](https://www.normaliz.uni-osnabrueck.de/) | [NormalizInterface][NormalizInterface]                  | [normaliz_jll.jl][normaliz_jll.jl] |
-->

## General Disclaimer

The software comes with absolutely no warranty and will most likely have errors. If you use it for computations, please check the correctness of the result very carefully.

This software is licensed under the LGPL, version 3, or any later version.

## Funding

*The development of this package and many of the GAP packages hosted on the GitHub organization [homalg-project](https://github.com/homalg-project/) was partially funded by the [DFG (German Research Foundation)](https://www.dfg.de/) through the*

* [Special Priority Project SPP 1489](https://spp.computeralgebra.de/),
* [Transregional Collaborative Research Centre SFB-TRR 195](https://www.computeralgebra.de/sfb/).

[Digraphs]: https://github.com/gap-packages/digraphs/#readme
[4ti2Interface]: https://github.com/homalg-project/homalg_project/tree/master/4ti2Interface/#readme
[CddInterface]: https://github.com/homalg-project/CddInterface/#readme
[NormalizInterface]: https://github.com/gap-packages/NormalizInterface/#readme
[Graphviz_jll.jl]: https://github.com/JuliaBinaryWrappers/Graphviz_jll.jl/
[lib4ti2_jll.jl]: https://github.com/JuliaBinaryWrappers/lib4ti2_jll.jl/
[cddlib_jll.jl]: https://github.com/JuliaBinaryWrappers/cddlib_jll.jl/
[normaliz_jll.jl]: https://github.com/JuliaBinaryWrappers/normaliz_jll.jl/

<!-- BEGIN FOOTER -->

[docs-dev-img]: https://img.shields.io/badge/docs-dev-blue.svg
[docs-dev-url]: https://homalg-project.github.io/CapAndHomalg.jl/dev/

[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-stable-url]: https://homalg-project.github.io/CapAndHomalg.jl/stable/

[tests-img]: https://github.com/homalg-project/CapAndHomalg.jl/actions/workflows/Tests.yml/badge.svg?branch=master
[tagbot-img]: https://github.com/homalg-project/CapAndHomalg.jl/workflows/TagBot/badge.svg
[docsbuilder-img]: https://github.com/homalg-project/CapAndHomalg.jl/workflows/DocsBuilder/badge.svg
[compathelper-img]: https://github.com/homalg-project/CapAndHomalg.jl/workflows/CompatHelper/badge.svg

[action-url]: https://github.com/homalg-project/CapAndHomalg.jl/actions
[tests-url]: https://github.com/homalg-project/CapAndHomalg.jl/actions/workflows/Tests.yml
[tagbot-url]: https://github.com/homalg-project/CapAndHomalg.jl/actions/workflows/TagBot.yml
[docsbuilder-url]: https://github.com/homalg-project/CapAndHomalg.jl/actions/workflows/pages/pages-build-deployment
[compathelper-url]: https://github.com/homalg-project/CapAndHomalg.jl/actions/workflows/CompatHelper.yml

[codecov-img]: https://codecov.io/gh/homalg-project/CapAndHomalg.jl/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/homalg-project/CapAndHomalg.jl

[code-img]: https://img.shields.io/badge/-View%20code-blue?logo=github
[code-url]: https://github.com/homalg-project/CapAndHomalg.jl#top

<!-- END FOOTER -->

module Setup

# add shell scripts that startup another julia for some lib4ti2 programs
function regenerate_4ti2_wrapper(binpath, wrapperpath)
    mkpath("$wrapperpath")

    if Sys.iswindows()
        LIBPATH_env = "PATH"
    elseif Sys.isapple()
        LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"
    else
        LIBPATH_env = "LD_LIBRARY_PATH"
    end

    function force_symlink(p::AbstractString, np::AbstractString)
        rm(np; force = true)
        symlink(p, np)
    end

    for tool in ("4ti2gmp", "4ti2int32", "4ti2int64", "genmodel", "gensymm", "output", "ppi", "zsolve")
        force_symlink(joinpath(binpath, tool), joinpath(wrapperpath, tool))
    end

    for tool in ("circuits", "graver", "groebner", "hilbert", "markov", "minimize", "normalform", "qsolve", "rays", "walk", "zbasis")
        toolpath = joinpath(wrapperpath, tool)
        write(toolpath, """
        #!/bin/sh
        export $(LIBPATH_env)="$(lib4ti2_jll.LIBPATH[])"
        . $(binpath)/$(tool) "\$@"
        """)
        chmod(toolpath, 0o777)
    end
end

# add shell scripts that startup another julia for some Graphviz programs
function regenerate_Graphviz_wrapper(binpath, wrapperpath)
    mkpath("$wrapperpath")

    if Sys.iswindows()
        LIBPATH_env = "PATH"
    elseif Sys.isapple()
        LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"
    else
        LIBPATH_env = "LD_LIBRARY_PATH"
    end

    for tool in ("dot", )
        toolpath = joinpath(wrapperpath, tool)
        write(toolpath, """
        #!/bin/sh
        export $(LIBPATH_env)="$(Graphviz_jll.LIBPATH)"
        $(binpath)/$(tool) "\$@"
        """)
        chmod(toolpath, 0o777)
    end

end

#
# put the wrapper inside this package, but use different wrappers for each
# minor Julia version as those may get different versions of the various JLLs
#
# TODO/FIXME: don't write into the package directory; instead use a scratch space
# obtained via <https://github.com/JuliaPackaging/Scratch.jl> -- however, that
# requires Julia >= 1.5; so we can't use it until we drop support for Julia 1.3 & 1.4.
#

const wrapperpath = joinpath(dirname(@__DIR__), "bin", "v$(VERSION.major).$(VERSION.minor)")

@info "Regenerating 4ti2 wrappers in $(wrapperpath)"
import lib4ti2_jll
regenerate_4ti2_wrapper(joinpath(lib4ti2_jll.artifact_dir, "bin"), wrapperpath)

@info "Regenerating Graphviz wrappers in $(wrapperpath)"
import Graphviz_jll
regenerate_Graphviz_wrapper(joinpath(Graphviz_jll.artifact_dir, "bin"), wrapperpath)

# make sure CapAndHomalg can find the wrappers
function __init__()
    ENV["PATH"] = wrapperpath * ":" * ENV["PATH"]
end

end # module

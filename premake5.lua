dofile (path.join(os.getenv("DIR_SCRIPTS_ROOT"),"premake5_common.lua"))

workspace "muParser"

    SolutionConfiguration()
    defines {
        "MU_PSR_USE_DYN"
    }
    local _exportSymbol = "MU_PSR_MAKE_DLL"
    links {
    }

project "muParser"

    PrefilterSharedLibBuildOptions("muParser")
    defines {_exportSymbol}

    FilterSharedLibBuildOptions("muParser")


project "test_muParser"

    PrefilterTestBuildOptions("test_muParser")
    links { "muParser"}

    FilterTestBuildOptions("test_muParser")


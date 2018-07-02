
dofile (path.join(os.getenv("DIR_SCRIPTS_ROOT"),"premake5_common.lua"))

workspace "muParser" 

    SolutionConfiguration()
    defines {
        "MU_PSR_USE_DYN"
    }
    local _exportSymbol = "MU_PSR_MAKE_DLL"
    links { 
    }
    
    -- PROTECTED REGION ID(muParser.premake.solution) ENABLED START
    -- Insert here user code

    -- End of user code
    -- PROTECTED REGION END

project "muParser"

    PrefilterSharedLibBuildOptions("muParser")
    defines {_exportSymbol}
    
   -- PROTECTED REGION ID(muParser.premake.sharedlib) ENABLED START
   -- Insert here user code

   -- End of user code
   -- PROTECTED REGION END

    FilterSharedLibBuildOptions("muParser")


    

project "test_muParser"

    PrefilterTestBuildOptions("test_muParser")
    links { "muParser"}
    
    -- PROTECTED REGION ID(muParser.premake.test) ENABLED START
    -- Insert here user code

    -- End of user code
    -- PROTECTED REGION END

    FilterTestBuildOptions("test_muParser")


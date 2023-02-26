
dofile (path.join(os.getenv("DirScriptsRoot"),"premake_common.lua"))

-- solution muParser --
solution "muParser"

    SolutionConfiguration()

    -- COMMON CONFIGURATION MODIFICATION - START --
    configuration {}
        -- common defines (adapt if necessary) --
       defines {
                "MU_PSR_USE_DYN"
               }                
       -- for shared libs, export statement
       local _exportSymbol = "MU_PSR_MAKE_DLL"
       -- suffix to use for library versionning
       local _version = ""
       -- common libs  --
       links { 
          }
    -- COMMON CONFIGURATION MODIFICATION - END --

project "muParser"
    -- PROJECT MODIFICATIONS START--
    local _targetname = "muParser"
    -- additional defines --
    defines {_exportSymbol}
    -- PROJECT MODIFICATIONS END--

    AppendSharedLibBuildOptions(_targetname.._version)

project "test_muParser"
    -- PROJECT MODIFICATIONS START--
    local _targetname = "test_muParser"
    links {"muParser"}
    -- PROJECT MODIFICATIONS END--

    AppendTestBuildOptions(_targetname.._version)

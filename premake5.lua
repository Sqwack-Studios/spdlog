project "spdlog"

        kind "StaticLib"
        language "C++"
        staticruntime "on"

        targetdir("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
        debugdir("%{wks.location}/bin/" .. outputdir.. "/%{prj.name}")
        objdir("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

        warnings "High"

        files
        {
            "include/spdlog/**.h",
            "src/**.cpp"
        }

        includedirs
        {
            "include"
        }

        filter "system:windows"
                systemversion "latest"

                defines
                {
                    "SPDLOG_COMPILED_LIB",
                    "_CRT_SECURE_NO_WARNINGS"
                }
        
        filter "configurations:Debug"
                symbols "on"
        filter "configurations:Release"
                optimize "on"
                symbols "on"
        filter "configurations:Dist"
                optimize "on"
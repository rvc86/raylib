workspace "raylib"
	startproject "core_basic_window"
	location "%{_ACTION}" -- vs2015, vs2017, ninja, etc
	systemversion "latest"
	configurations { "Debug", "Release" }
	platforms { "windows" }
	defines { "UNICODE" }
	
	exceptionhandling "Off"
	staticruntime "On"
	rtti "Off"	
	warnings "Extra"
	flags {
	--	"FatalWarnings",
	--	"NoImplicitLink",
	--	"NoImportLib",
	--	"NoIncrementalLink",
	--	"NoMinimalRebuild",
	--	"NoPCH",
	}
	
	filter "configurations:Debug"
		defines { "DEBUG", "_DEBUG" }
		symbols "On"
		optimize "Off"
	
project "raylib"
	kind "StaticLib"
	language "C"
	
	defines {
		"GRAPHICS_API_OPENGL_33",
		"PLATFORM_DESKTOP",
		"BUILD_LIBTYPE_SHARED",
		"_LIB"
	}
	files {
		"../src/*.c",
		"../src/*.h",
		"../src/ReadMe.txt"
	}
	
	includedirs {
		"../src/external/glfw/include",
	}

project "core_basic_window"
	kind "ConsoleApp"
	language "C"
	dependson "raylib"
	links {
		"winmm",
		"raylib",
	}
	defines {
		"_CONSOLE",
		"PLATFORM_DESKTOP",
	}
	files {
		"../examples/core/core_basic_window.c"
	}
	includedirs {
		"../src"
	}

project "core_basic_window_cpp"
	kind "ConsoleApp"
	language "C++"
	dependson "raylib"
	links {
		"winmm",
		"raylib",
	}
	defines {
		"_CONSOLE",
		"PLATFORM_DESKTOP",
	}
	files {
		"../examples/core/core_basic_window.cpp"
	}
	includedirs {
		"../src"
	}
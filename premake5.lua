require("./export-compile-commands")
workspace("OpenGLSandbox")
configurations({ "Debug", "Release" })
platforms({ "x64" })

project("OpenGLSandbox")
kind("ConsoleApp")
language("C++")
cppdialect("C++17")
targetdir("bin/%{cfg.buildcfg}")

files({
	"main.cpp", -- here we are explicitly including the entry-point cpp
	"libs/stb/stb_image.h", -- as well as
	"src/**.cpp",
	"src/**.h",
})

includedirs({
	"libs/include", -- For glad/glad.h
	"libs/stb", -- For stb_image.h
	"libs/glfw/include", -- Keep if using local GLFW
	"libs/glm", -- Keep if using local GLM
})

filter({ "system:linux" })
links({ "GL", "glfw", "dl", "pthread" })

filter({ "system:windows" })
links({ "opengl32", "glfw3" })
libdirs({ "libs/glfw/lib/%{cfg.buildcfg}" })
systemversion("latest")

filter({ "system:macosx" })
links({
	"Cocoa.framework",
	"IOKit.framework",
	"CoreVideo.framework",
	"glfw",
})
buildoptions({ "-Wno-deprecated-declarations" })

filter("configurations:Debug")
defines({ "DEBUG" })
symbols("On")

filter("configurations:Release")
defines({ "NDEBUG" })
optimize("On")

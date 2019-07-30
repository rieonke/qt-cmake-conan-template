macro(init_conan)
        if(NOT EXISTS "${CMAKE_SOURCE_DIR}/cmake/conan.cmake")
                message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
                file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.14/conan.cmake"
                        "${CMAKE_SOURCE_DIR}/cmake/conan.cmake")
        endif()

        include(conan)

        if (NOT EXISTS "${CMAKE_BINARY_DIR}/conanbuildinfo.cmake")
                conan_cmake_run(
                        CONANFILE conanfile.txt
                        BASIC_SETUP CMAKE_TARGETS KEEP_RPATHS
                        BUILD missing)
        endif ()

        include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
        conan_basic_setup(TARGETS KEEP_RPATHS)
endmacro()

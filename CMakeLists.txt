cmake_minimum_required(VERSION 3.20)

get_filename_component(DYNAMIC_PROJECT_NAME ${CMAKE_SOURCE_DIR} NAME)

project(${DYNAMIC_PROJECT_NAME} CXX)

set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Suppress the #embed extension warning in Clang
if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    add_compile_options(-Wno-c23-extensions)
endif()

file(GLOB SRC_FILES "src/*.cpp")

foreach(SRC_FILE ${SRC_FILES})
    get_filename_component(EXEC_NAME ${SRC_FILE} NAME_WE)

    # Create an executable matching the exact file name (e.g. 'main', 'letters')
    add_executable(${EXEC_NAME} ${SRC_FILE})

    # Keep the default 'run' target pointed to 'main' for template backward compatibility
    if(EXEC_NAME STREQUAL "main")
        add_custom_target(run COMMAND ${EXEC_NAME} DEPENDS ${EXEC_NAME})
    endif()
endforeach()

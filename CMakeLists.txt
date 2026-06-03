cmake_minimum_required(VERSION 3.20)

project(LambdaProject CXX)

set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_EXTENSIONS OFF)

add_executable(${PROJECT_NAME} src/main.cpp)

add_custom_target(run COMMAND ${PROJECT_NAME} DEPENDS ${PROJECT_NAME})

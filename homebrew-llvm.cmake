set(CMAKE_C_COMPILER "/opt/homebrew/opt/llvm/bin/clang")
set(CMAKE_CXX_COMPILER "/opt/homebrew/opt/llvm/bin/clang++")

execute_process(COMMAND xcrun --show-sdk-path 
                OUTPUT_VARIABLE MAC_SDK_PATH 
                OUTPUT_STRIP_TRAILING_WHITESPACE)
set(CMAKE_OSX_SYSROOT ${MAC_SDK_PATH})

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -nostdinc++ -nostdlib++ -isystem /opt/homebrew/opt/llvm/include/c++/v1")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++ -lc++")

add_compile_options(-std=c++2c -Wall -Wextra -Wshadow -Wconversion -Wsign-conversion -Werror=conversion -Werror=sign-conversion -pedantic-errors)

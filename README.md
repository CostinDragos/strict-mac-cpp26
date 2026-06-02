# macOS Strict C++ Template

This template makes it easy to create a C++ project on macOS with the latest C++26 using Homebrew LLVM. It provides all the tools needed to start writing, compiling, and running code. The design of the compilation process is elegantly suited for debugging with LLDB.

## Prerequisites

You will need the latest LLVM toolchain, CMake, and the Ninja build system.

```bash
brew install llvm cmake ninja
```

## Quickstart

1. Clone the repository:

```bash
git clone https://github.com/CostinDragos/strict-mac-cpp26.git my_project
cd my_project
```

2. Configure and build the project:

```bash
cmake -B build -G Ninja -DCMAKE_TOOLCHAIN_FILE=homebrew-llvm.cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug
cmake --build build
```

3. Run the executable:

```bash
./build/my_project
```

## Editor Integration

For editors using the Language Server Protocol (LSP) such as Vim/Neovim or VS Code, create a symlink of the compilation database to your project's root directory so your editor can resolve includes and types correctly:

```bash
ln -s build/compile_commands.json .
```

> **Note:** Ensure your editor's LSP is configured to use the Homebrew-provided `clangd` located at `/opt/homebrew/opt/llvm/bin/clangd`. Avoid using Apple's default system `clangd` or it will fail to find modern C++ standard libraries.

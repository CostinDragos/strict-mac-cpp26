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

Note: For release builds, maximum speed is preferred, so the following will do their job well:

```bash
cmake -B build -G Ninja -DCMAKE_TOOLCHAIN_FILE=homebrew-llvm.cmake -DCMAKE_BUILD_TYPE=Release
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

### Vim

Useful mappings for formatting, building, and documentation:

```vim
# Format the current file with clang-format
autocmd FileType c,cpp nnoremap <buffer> <leader>f :silent !/opt/homebrew/opt/llvm/bin/clang-format -i %<CR>:edit!<CR>:redraw!<CR>:echo "Formatted!"<CR>

# Build and run the project
autocmd FileType cpp nnoremap <buffer> <leader>r :w<CR>:execute 'vert term zsh -c "cd ' . shellescape(fnamemodify(findfile('CMakeLists.txt', expand('%:p:h') . ';'), ':p:h')) . ' && cmake --build build --target run"'<CR>

# Open cppman documentation for the symbol under the cursor
autocmd FileType cpp nnoremap <buffer> gK :execute 'vert term cppman ' . expand('<cword>')<CR>
```

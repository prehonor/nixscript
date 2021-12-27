{ pkgs }:
with pkgs; 
[
  pkg-config            # A tool that allows packages to find out information about other packages (wrapper script)
  cmake                 # Cross-Platform Makefile Generator
  ninja                 # Small build system with a focus on speed
  rustup 
  autoconf              # Part of the GNU Build System
  meson                 # SCons-like build system that use python as a front-end language and Ninja as a building backend
  clang_x
  unixODBC              # ODBC driver manager for Unix
  extra-cmake-modules 
  libsForQt5.kdoctools
  # llvm_x lld_x lldb_x clang_x libclang_x   # gcc gdb 
]
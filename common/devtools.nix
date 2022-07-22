{ pkgs }:
with pkgs; [
  pkg-config # A tool that allows packages to find out information about other packages (wrapper script)
  libtool # GNU Libtool, a generic library support script
  cmake # Cross-Platform Makefile Generator
  ninja # Small build system with a focus on speed
  autoconf # Part of the GNU Build System
  meson # SCons-like build system that use python as a front-end language and Ninja as a building backend

  unixODBC # ODBC driver manager for Unix
  extra-cmake-modules
  libsForQt5.kdoctools
  gobject-introspection # A middleware layer between C libraries and language bindings
  # toybox              # Lightweight implementation of some Unix command line utilities
  hwinfo # Hardware detection tool from openSUSE
  gnumake
  automake
  autoconf
  gnum4
]

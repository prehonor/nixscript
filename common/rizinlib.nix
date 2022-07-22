{ pkgs }:
with pkgs; [
  file
  libzip
  capstone # Advanced disassembly library
  readline # Library for interactive line editing
  libusb-compat-0_1 # cross-platform user-mode USB device library
  libewf # Library for support of the Expert Witness Compression Format
  perl
  zlib
  lz4 # Extremely fast compression algorithm
  openssl
  libuv # A multi-platform support library with a focus on asynchronous I/O
  tree-sitter # A parser generator tool and an incremental parsing library
  xxHash # Extremely fast hash algorithm
]

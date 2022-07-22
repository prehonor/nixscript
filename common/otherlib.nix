{ pkgs }:
with pkgs; [
  linuxPackages.nvidia_x11 # X.org driver and kernel module for NVIDIA graphics cards
  cudaPackages.cudatoolkit # A compiler for NVIDIA GPUs, math libraries, and tools
  cudaPackages.cudnn # NVIDIA CUDA Deep Neural Network library (cuDNN)
  cudaPackages.nccl # Multi-GPU and multi-node collective communication primitives for NVIDIA GPUs

  mysql80 # The world's most popular open source database
  ocrmypdf # Adds an OCR text layer to scanned PDF files, allowing them to be searched
  electron # Cross platform desktop application shell
  mupdf.dev # Lightweight PDF, XPS, and E-book viewer and toolkit written in portable C
  ghostscript # PostScript interpreter (mainline version)
  desktop-file-utils # Command line utilities for working with .desktop files
  shared-mime-info # A database of common MIME types
  intltool # Translation helper tool
  ffmpegthumbnailer # A lightweight video thumbnailer
  udisks # A daemon, tools and libraries to access and manipulate disks, storage devices and technologies
  jmtpfs # A FUSE filesystem for MTP devices like Android phones
  gettext # Well integrated set of translation tools and documentation
  graphviz # Graph visualization tools
  grpc # The C based gRPC (C++, Python, Ruby, Objective-C, PHP, C#)
  # glslang      # Khronos reference front-end for GLSL and ESSL 

  # ncurses5     # Free software emulation of curses in SVR4 and more 
  ncurses.dev # Free software emulation of curses in SVR4 and more
  curl.dev # A command line tool for transferring files with URL syntax
  # binutils     # Tools for manipulating binaries (linker, assembler, etc.) (wrapper script)
  lcms2 # Color management engine
  pam # Pluggable Authentication Modules, a flexible mechanism for authenticating user 请搜索 linux-pam
  bamf # Application matching framewor. Bamf matches application windows to desktop files. It removes the headache of applications matching into a simple DBus daemon and C wrapper library

  jbig2dec # Decoder implementation of the JBIG2 image compression format
  harfbuzz.dev # An OpenType text shaping engine

  asciidoc # Text-based document generation system
  xmlto # Front-end to an XSL toolchain
  docbook_xml_dtd_45
  docbook_xsl

  file # A program that shows the type of files
  openexr # A high dynamic-range (HDR) image file format
  # spyder
  jdk11 # The open-source Java Development Kit
  # dotnet-sdk     # .NET SDK 6.0.100
  # dotnet-sdk_5   # .NET SDK 5.0.403
  perl # The standard implementation of the Perl 5 programmming language
  procps # Utilities that give information about processes using the /proc filesystem
  utillinux # A set of system utilities for Linux
  atk.dev # Accessibility toolkit
  dbus # Simple interprocess messaging system
  dbus-glib # Obsolete glib bindings for D-Bus lightweight IPC mechanism

  coreutils # The basic file, shell and text manipulation utilities of the GNU operating system

  at-spi2-atk # D-Bus bridge for Assistive Technology Service Provider Interface (AT-SPI) and Accessibility Toolkit (ATK)
  bzip2 # High-quality data compression program
  unzip # An extraction utility for archives compressed in .zip format

  vte.dev # A library implementing a terminal emulator widget for GTK
  gtk2.dev # A multi-platform toolkit for creating graphical user interfaces
  # gtk2-x11        # A multi-platform toolkit for creating graphical user interfaces
  gtk3.dev # A multi-platform toolkit for creating graphical user interfaces
  # gtk3-x11
  gtk4.dev # A multi-platform toolkit for creating graphical user interfaces
  gobject-introspection.dev # A middleware layer between C libraries and language bindings
  gtksourceview.dev # Source code editing widget for GTK
  gnome2.gtksourceview
  # gtk-mac-integration # Provides integration for GTK applications into the Mac desktop
  wxGTK31-gtk3 # A Cross-Platform C++ GUI Library
  webkitgtk.dev # Web content rendering engine, GTK port

  systemd # A system and service manager for Linux
  at-spi2-core # Assistive Technology Service Provider Interface protocol definitions and daemon for D-Bus
  gperf # Perfect hash function generator
  gnome2.GConf # Deprecated system for storing application preferences
  gnome2.gnome_vfs # gnome 虚拟文件系统 https://blog.csdn.net/whatday/article/details/105117941
  lsb-release # Prints certain LSB (Linux Standard Base) and Distribution information
  dpkg # The Debian package manager
  freetype.dev # A font rendering engine
  which

  # m4 没有
  # stdenv.cc 没有
  # gnumake gitFull # git gitRepo

  # unixODBCDrivers.mysql
  qrencode.dev # C library for encoding data in a QR Code symbol
  botan2 # Cryptographic algorithms library
  gmp.dev # GNU multiple precision arithmetic library
  pcre.dev # A library for Perl Compatible Regular Expressions
  opencv # Open Computer Vision Library with more than 500 algorithms
  ffmpeg # A complete, cross-platform solution to record, convert and stream audio and video
  libselinux # SELinux core library
  libclang_x # A C language family frontend for LLVM
  libpulseaudio # Sound server for POSIX and Win32 systems
  nspr # Netscape Portable Runtime, a platform-neutral API for system-level and libc-like functions
  nss # A set of libraries for development of security-enabled client and server applications
  freeglut # Create and manage windows containing OpenGL contexts
  boost # Collection of C++ libraries
  alsa-lib # ALSA, the Advanced Linux Sound Architecture alsa-oss emulation
  liburing # Userspace library for the Linux io_uring API
  # gmock          # Google's framework for writing C++ tests 从21开始就没有了 
  libmysqlclient # Client library that can be used to connect to MySQL or MariaDB
  libmysqlconnectorcpp # C++ library for connecting to mysql servers
  libpqxx # A C++ library to access PostgreSQL databases
  libfm # A glib-based library for file management
  openssl.dev # A cryptographic library that implements the SSL and TLS protocols
  libxml2 # An XML parsing library for C
  libxslt # A C library and tools to do XSL transformations
  cups # A standards-based printing system for UNIX
  fontconfig # A library for font customization and configuration
  # alsaLib        # ALSA, the Advanced Linux Sound Architecture libraries 21.版本起已经没有了
  speechd # Common interface to speech synthesis
  libjpeg # A faster (using SIMD) libjpeg implementation
  giflib # A library for reading and writing gif images
  # libpng       # The official reference implementation for the PNG file format with animation patch 
  libpng12 # The official reference implementation for the PNG file format
  libGL.dev # OpenGL libglvnd mesa
  libGLU # OpenGL utility library
  gnupg # Modern (2.1) release of the GNU Privacy Guard, a GPL OpenPGP implementation
  libdrm # Direct Rendering Manager library and headers
  mesa # An open source 3D graphics library
  gdk-pixbuf.dev # A library for image loading and manipulation
  libhandy.dev # Building blocks for modern adaptive GNOME apps
  libhandy_0.dev # A library full of GTK widgets for mobile phones
  # lttng-ust         # LTTng Userspace Tracer libraries

  gumbo # C99 HTML parsing algorithm
  libev # A high-performance event loop/event model with lots of features
  libmikmod # A library for playing tracker music module files
  mbedtls # Portable cryptographic and TLS library, formerly known as PolarSSL
  c-ares # A C library for asynchronous DNS requests
  zbar.dev # Bar code reader
  libglvnd # The GL Vendor-Neutral Dispatch library
  expat # A stream-oriented XML parser library written in C
  glib.dev # C library of programming buildings blocks 解决编译haskell某些库出现 The pkg-config package 'gobject-2.0' version >=2.32 is required but it could not be found
  zlib.dev # Lossless data-compression library 将zlib改成zlib.dev可以保证编译haskell的hoogle库不出错
  cairo.dev # A 2D graphics library with support for multiple output devices
  pango.dev # A library for laying out and rendering of text, with an emphasis on internationalization
  libsodium.dev # A modern and easy-to-use crypto library
  libcap # Library for working with POSIX capabilities
  graphviz # Graph visualization tools
  discount # Implementation of Markdown markup language in C
  djvulibre # The big set of CLI tools to make/modify/optimize/show/export DJVU files
  ebook_tools # Tools and library for dealing with various ebook file formats
  libspectre # PostScript rendering library
  libzip # A C library for reading, creating and modifying zip archives
  zstd # Zstandard real-time compression algorithm
  # glibc.dev    # The GNU C Library 导致问题编译cpp出现 <stdlib.h> not found https://discourse.nixos.org/t/trouble-in-building-c-environment/1413

  capstone # Advanced disassembly library
  readline # Library for interactive line editing
  libusb-compat-0_1 # cross-platform user-mode USB device library
  libewf # Library for support of the Expert Witness Compression Format
  lz4 # Extremely fast compression algorithm
  libuv # A multi-platform support library with a focus on asynchronous I/O
  tree-sitter # A parser generator tool and an incremental parsing library
  xxHash # Extremely fast hash algorithm
  udev # 没找到
  # dbus_glib      # 没找到
  # libfakeXinerama               # fakeXinerama for Xpra
  gst_all_1.gst-plugins-base # Base GStreamer plug-ins and helper libraries
  gst_all_1.gstreamer # Open source multimedia framework
  libjxl # JPEG XL image format reference implementation
  liblqr1 # Seam-carving C/C++ library called Liquid Rescaling
  libraw # Library for reading RAW files obtained from digital photo cameras (CRW/CR2, NEF, RAF, DNG, and others)
  librsvg # A small library to render SVG images to Cairo surfaces
  libtiff # Library and utilities for working with the TIFF image file format
  openjpeg # Open-source JPEG 2000 codec written in C language
  libwebp # Tools and library for the WebP image format
  libheif # ISO/IEC 23008-12:2017 HEIF image file format decoder and encoder
  portaudio # Portable cross-platform Audio API
  vulkan-loader
  texinfo # The GNU documentation system
  # xorriso grub2 qemu

  # libudev0-shim libgcrypt libgudev e2fsprogs SDL2
  libxkbcommon
]

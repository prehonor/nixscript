{pkgs}:
with pkgs;
[

   linuxPackages.nvidia_x11			# X.org driver and kernel module for NVIDIA graphics cards 
   cudaPackages.cudatoolkit_11		# A compiler for NVIDIA GPUs, math libraries, and tools
   cudnn_cudatoolkit_11				# NVIDIA CUDA Deep Neural Network library (cuDNN)
   nccl_cudatoolkit_11				# Multi-GPU and multi-node collective communication primitives for NVIDIA GPUs

   
   mysql80			# The world's most popular open source database
   ocrmypdf			# Adds an OCR text layer to scanned PDF files, allowing them to be searched

   ncurses5			# Free software emulation of curses in SVR4 and more 
   ncurses        # Free software emulation of curses in SVR4 and more
   curl				# A command line tool for transferring files with URL syntax
   binutils			# Tools for manipulating binaries (linker, assembler, etc.) (wrapper script)
   lcms2			   # Color management engine
   pam 				# Pluggable Authentication Modules, a flexible mechanism for authenticating user 请搜索 linux-pam

   file				# A program that shows the type of files
   # spyder
   jdk11			   # The open-source Java Development Kit
   perl           # The standard implementation of the Perl 5 programmming language
   procps			# Utilities that give information about processes using the /proc filesystem
   utillinux		# A set of system utilities for Linux
   atk				# Accessibility toolkit
   dbus				# Simple interprocess messaging system
   coreutils      # The basic file, shell and text manipulation utilities of the GNU operating system

   at-spi2-atk		# D-Bus bridge for Assistive Technology Service Provider Interface (AT-SPI) and Accessibility Toolkit (ATK)
   unzip             # An extraction utility for archives compressed in .zip format
   gtk3              # A multi-platform toolkit for creating graphical user interfaces
   gtk2              # A multi-platform toolkit for creating graphical user interfaces
   gtk2-x11          # A multi-platform toolkit for creating graphical user interfaces
   systemd				# A system and service manager for Linux
   at-spi2-core		# Assistive Technology Service Provider Interface protocol definitions and daemon for D-Bus
   gperf 				# Perfect hash function generator
   gnome2.GConf 		# Deprecated system for storing application preferences
   gnome2.gnome_vfs 	# gnome 虚拟文件系统 https://blog.csdn.net/whatday/article/details/105117941
   lsb-release     	# Prints certain LSB (Linux Standard Base) and Distribution information
   dpkg              # The Debian package manager
   freetype          # A font rendering engine
   which

   # m4 没有
   # stdenv.cc 没有
   # gnumake gitFull # git gitRepo


   # unixODBCDrivers.mysql

   libselinux      	# SELinux core library
   libpulseaudio		# Sound server for POSIX and Win32 systems
   nspr					# Netscape Portable Runtime, a platform-neutral API for system-level and libc-like functions 
   nss 					# A set of libraries for development of security-enabled client and server applications
   freeglut				# Create and manage windows containing OpenGL contexts
   boost				   # Collection of C++ libraries
   liburing					# Userspace library for the Linux io_uring API
   # gmock					# Google's framework for writing C++ tests 从21开始就没有了 
   libmysqlclient			# Client library that can be used to connect to MySQL or MariaDB 
   libmysqlconnectorcpp	# C++ library for connecting to mysql servers
   openssl.dev				# A cryptographic library that implements the SSL and TLS protocols
   libxml2					# An XML parsing library for C
   libxslt					# A C library and tools to do XSL transformations
   cups						# A standards-based printing system for UNIX
   fontconfig				# A library for font customization and configuration
   # alsaLib				# ALSA, the Advanced Linux Sound Architecture libraries 21.版本起已经没有了
   libjpeg				# A faster (using SIMD) libjpeg implementation
   giflib				# A library for reading and writing gif images
   libpng				# The official reference implementation for the PNG file format with animation patch 
   libGL				   # OpenGL libglvnd mesa
   gnupg				   # Modern (2.1) release of the GNU Privacy Guard, a GPL OpenPGP implementation
   libdrm				# Direct Rendering Manager library and headers
   mesa					# An open source 3D graphics library
   gdk-pixbuf			# A library for image loading and manipulation
   webkitgtk			# Web content rendering engine, GTK port
   libglvnd				# The GL Vendor-Neutral Dispatch library
   expat          # A stream-oriented XML parser library written in C
   glib           # C library of programming buildings blocks    
   zlib				# Lossless data-compression library
   cairo          # A 2D graphics library with support for multiple output devices
   pango          # A library for laying out and rendering of text, with an emphasis on internationalization
   libsodium		# A modern and easy-to-use crypto library
   libcap			# Library for working with POSIX capabilities
   graphviz			# Graph visualization tools
   discount			# Implementation of Markdown markup language in C
   djvulibre		# The big set of CLI tools to make/modify/optimize/show/export DJVU files
   ebook_tools 	# Tools and library for dealing with various ebook file formats
   libspectre 		# PostScript rendering library
   libzip 			# A C library for reading, creating and modifying zip archives
   glibc			   # The GNU C Library
   capstone          # Advanced disassembly library
   readline          # Library for interactive line editing
   libusb-compat-0_1	# cross-platform user-mode USB device library
   libewf				# Library for support of the Expert Witness Compression Format
   lz4               # Extremely fast compression algorithm
   libuv             # A multi-platform support library with a focus on asynchronous I/O
   tree-sitter       # A parser generator tool and an incremental parsing library
   xxHash            # Extremely fast hash algorithm
   # udev           # 没找到
   # dbus_glib      # 没找到
   libfakeXinerama   # fakeXinerama for Xpra


   # libudev0-shim libgcrypt libgudev e2fsprogs SDL2
]
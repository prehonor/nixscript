with import <nixpkgs> {}; 
mkShell rec {
	name = "codelite";
  
	buildInputs = [
		file
		libzip
		capstone
		readline
		libusb-compat-0_1
		libewf
		perl
		zlib
		lz4
		openssl
		libuv
		tree-sitter
		xxHash

		(python3.withPackages (ps: [ ps.setuptools ps.shiboken2 ps.pyside2 ]))
		graphviz
		qt5.qtbase qt5.qtsvg qt5.qtwebengine qt5.qttools libsForQt5.qt5.qtdeclarative libsForQt5.syntax-highlighting
	];
	mesonFlags = [
	    "-Duse_sys_capstone=enabled"
	    "-Duse_sys_magic=enabled"
	    "-Duse_sys_libzip=enabled"
	    "-Duse_sys_zlib=enabled"
	    "-Duse_sys_xxhash=enabled"
	    "-Duse_sys_lz4=enabled"
	    "-Duse_sys_openssl=enabled"
	    "-Duse_sys_tree_sitter=enabled"
  	];

  	cmakeFlags = [
	    "-DCUTTER_ENABLE_PYTHON=ON"
	    "-DCUTTER_ENABLE_PYTHON_BINDINGS=ON"
  ];
  	nativeBuildInputs = [ qt5.qmake meson cmake ninja pkg-config (python3.withPackages (ps: [ ps.setuptools ps.shiboken2 ps.pyside2 ])) ];

  	shellHook = ''
		LIBRARY_PATH=""
	    for b in ${toString (map lib.getLib buildInputs)}; do
	      if [[ -d "$b/lib" ]]; then
	        LIBRARY_PATH="$b/lib''${LIBRARY_PATH:+:}$LIBRARY_PATH"
	      fi
	    done
	    export LIBRARY_PATH
    '';
    
}

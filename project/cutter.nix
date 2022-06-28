let 
	pkgs = import <nixpkgs> {};

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
    ];



    nativeBuildInputs = [ meson cmake ninja pkg-config (python3.withPackages (ps: [ ps.setuptools ])) ];

    ld = with pkgs; lib.makeLibraryPath ([
        stdenv.cc.cc.lib fontconfig.lib
    ] ++ libs );

    hardeningDisable = [ "all" ];  # 为了解决cgo warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
    


	fhs =  with pkgs; buildFHSUserEnv {

		name = "fhs";

		targetPkgs = pkgs: (buildInputs ++ nativeBuildInputs);

		runScript = ''
			bash
		'';

		profile = ''
	    	


	  	'';

	};
in with pkgs; stdenv.mkDerivation {

	name = "fhsenv";

	nativeBuildInputs = [ fhs ];

	shellHook = ''

		exec fhs

	'';
}

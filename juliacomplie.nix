with import <nixpkgs> {}; 
mkShell rec {
  name = "juliacomplieenv";
 # arpack_ = stdenv.lib.arpack;
 # arpack = arpack_.override { openblas=stdenv.lib.openblas; };
  buildInputs = [
    arpack fftw fftwSinglePrec gmp libgit2 libunwind mpfr
    pcre2.dev openblas openlibm openspecfun readline utf8proc
    zlib
	curl gfortran m4 makeWrapper patchelf perl python2 which
  ];
  
  ld = stdenv.lib.makeLibraryPath ([
    arpack fftw fftwSinglePrec gmp libgit2 mpfr openblas openlibm
    openspecfun pcre2.dev
  ] );
/*
  makeFlags =
    let
      arch = builtins.head (lib.splitString "-" stdenv.system);
      march = { x86_64 = stdenv.hostPlatform.platform.gcc.arch or "x86-64"; i686 = "pentium4"; }.${arch}
              or (throw "unsupported architecture: ${arch}");
      # Julia requires Pentium 4 (SSE2) or better
      cpuTarget = { x86_64 = "x86-64"; i686 = "pentium4"; }.${arch}
                  or (throw "unsupported architecture: ${arch}");
      # Julia applies a lot of patches to its dependencies, so for now do not use the system LLVM
      # https://github.com/JuliaLang/julia/tree/master/deps/patches
    in [
      "ARCH=${arch}"
      "MARCH=${march}"
      "JULIA_CPU_TARGET=${cpuTarget}"
      "SHELL=${stdenv.shell}"

      "USE_SYSTEM_BLAS=1"
      "USE_BLAS64=${if openblas.blas64 then "1" else "0"}"
      "LIBBLAS=-lopenblas"
      "LIBBLASNAME=libopenblas"
      #"USE_BLAS64=${if blas.is64bit then "1" else "0"}"

      "USE_SYSTEM_LAPACK=1"
       "LIBLAPACK=-lopenblas"
      "LIBLAPACKNAME=libopenblas"

      "USE_SYSTEM_ARPACK=1"
      "USE_SYSTEM_FFTW=1"
      "USE_SYSTEM_GMP=1"
      "USE_SYSTEM_LIBGIT2=1"
      "USE_SYSTEM_LIBUNWIND=1"

      "USE_SYSTEM_MPFR=1"
      "USE_SYSTEM_OPENLIBM=1"
      "USE_SYSTEM_OPENSPECFUN=1"
      "USE_SYSTEM_PATCHELF=1"
      "USE_SYSTEM_PCRE=1"
      "PCRE_CONFIG=${pcre2.dev}/bin/pcre2-config"
      "PCRE_INCL_PATH=${pcre2.dev}/include/pcre2.h"
      "USE_SYSTEM_READLINE=1"
      "USE_SYSTEM_UTF8PROC=1"
      "USE_SYSTEM_ZLIB=1"

      "USE_BINARYBUILDER=0"
    ];
	makeFlagss = lib.concatStrings makeFlags;
	*/
	    
	shellHook = ''
		export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}
		unset http_proxy
		unset https_proxy
    '';
}


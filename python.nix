with import <nixpkgs> {}; 
mkShell rec { 

  name = "python3_env";
  python3 = python3.withPackages(ps: with ps; [ pip urllib3 ]);
  
  rJava = [ pkgs.zlib pkgs.bzip2.dev pkgs.icu pkgs.lzma.dev pkgs.pcre.dev pkgs.jdk pkgs.libzip ];
  buildInputs = [
    python3
  #  pkgconfig
    R gettext
  ] ++ rJava;
  ld = stdenv.lib.makeLibraryPath ([
      stdenv.cc.cc.lib fontconfig.lib glibc 
  ] ++ buildInputs);

  shellHook = ''
  
  interp="$(cat $NIX_CC/nix-support/dynamic-linker)"
	
  SOURCE_DATE_EPOCH=$(date +%s)
  export PIP_PREFIX="/home/prehonor/.local"
  export PYTHONPATH="$PIP_PREFIX/${python3.sitePackages}:$PYTHONPATH"
  
	export LD_LIBRARY_PATH=${ld}:$LD_LIBRARY_PATH
  export JAVA_CPPFLAGS=-I${jdk}/include/
  export JAVA_HOME=${jdk.home}
  export MAVEN_OPTS='-Xms300m -Xmx300m'
	
  export PATH=:"/home/prehonor/.local/bin":$PATH
  export R_LIBS_SITE=${R}/lib/R/library
  export R_LIBS_USER="/home/prehonor/R/x86_64-pc-linux-gnu-library/3.6"
  
  export ANDROID_HOME="/gh/prehonor/Android/Sdk"
  
	# unset SOURCE_DATE_EPOCH
  
  unset http_proxy
  unset https_proxy
  unset ftp_proxy
  unset all_proxy
  
  
  '';
}
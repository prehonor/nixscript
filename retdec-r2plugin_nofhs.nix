with import /home/prehonor/Public/Code/nixpkgs/default.nix {}; 
mkShell rec { 

  name = "ret_nofhs";
  python3 = python36Full.withPackages(ps: with ps; [ virtualenv pip urllib3 ]);

  buildInputs = [
    
      gcc
      cmake
      git
      openssl
      python3
      
      autoconf
      automake
      libtool
      pkg-config 
      m4
      zlib
      
      radare2
      qt5.qtbase
      
      glibc
  ];
  ld = stdenv.lib.makeLibraryPath ([
      stdenv.cc.cc.lib fontconfig.lib
  ] ++ buildInputs);

  shellHook = ''
	
    export LD_LIBRARY_PATH=${ld}:$LD_LIBRARY_PATH
    export JAVA_CPPFLAGS=-I${jdk}/include/
    export JAVA_HOME=${jdk.home}
    export PYTHONPATH="/home/prehonor/.local/lib/python3.6/site-packages"

  '';
}
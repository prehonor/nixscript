 { pkgs ? import /home/prehonor/Public/Code/nixpkgs/default.nix {} }:

(pkgs.buildFHSUserEnv {
  name = "retdec";
  targetPkgs = pkgs: (with pkgs;
    [   
      
      gcc
      cmake
      git
      
      openssl
      (python36Full.withPackages(ps: with ps; [ virtualenv pip urllib3 ]))
      
      autoconf
      automake
      libtool
      pkg-config 
      m4
      zlib
      zlib.dev
      qt5.qtbase
      radare2
    ]);
    
    /*
    multiPkgs = pkgs: with pkgs;
    [
      zlib
      cmake
    ];
    */
    profile = ''
      export JAVA_CPPFLAGS=-I${pkgs.jdk.home}/include/
      export JAVA_HOME=${pkgs.jdk.home}
      export PYTHONPATH="/home/prehonor/.local/lib/python3.6/site-packages"

    '';
  runScript = "bash";
}).env

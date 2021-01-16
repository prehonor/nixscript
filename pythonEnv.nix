with import /gh/prehonor/gitproject/nixpkgs/default.nix {}; 
mkShell rec { 

  name = "pythonEnv";
 
 python = python3.withPackages(ps: with ps; [ pip urllib3 ]);
  # pypy = pypy3.withPackages(ps: with ps; [ pip urllib3 ]);

  buildInputs = [
                        pkgs.qt5Full
                    pkgs.qtcreator
    python
   #  pypy
   
    jdk11

    libxml2 libxslt openssl # pypy3 install lxml 需要的lib
    libmysqlclient # pymysql 需要的lib

    # gcc gfortran  gdb blas lapack
    # cmake lapack openblasCompat
    
  ];
  
  libs = with xorg; [
      alsaLib atk cairo cups dbus expat fontconfig gnome2.GConf gdk-pixbuf glib gtk2
      libX11 libxcb libXcomposite libXcursor libXdamage libXext libXfixes libXi
      libXrandr libXrender libXScrnSaver libXtst nspr nss pango libpulseaudio
      systemd at-spi2-core at-spi2-atk
      libdrm mesa
    ];

  ld = stdenv.lib.makeLibraryPath ([
      stdenv.cc.cc.lib  glibc # fontconfig.lib
      
  ] ++ libs);

  shellHook = ''
  
    export PATH=:"/home/prehonor/.local/bin":$PATH
    export LD_LIBRARY_PATH=${ld}:/nix/store/h1rvnw5gvfw82m6maiw9jb2g89ygdbis-openjdk-11.0.9+11/lib/openjdk/lib/server:/nix/store/h1rvnw5gvfw82m6maiw9jb2g89ygdbis-openjdk-11.0.9+11/lib/openjdk/lib:/home/prehonor/Public/test:$LD_LIBRARY_PATH

    # 

    cd /home/prehonor/.local/pythonEnvs/
    source foo/bin/activate


    export ANDROID_HOME="/gh/prehonor/Android/Sdk"

    export MAVEN_OPTS='-Xms300m -Xmx300m'


    export JAVA_CPPFLAGS=-I${jdk11}/include/
    export JAVA_HOME=${jdk11.home}
    

    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset all_proxy
                      
  '';
}
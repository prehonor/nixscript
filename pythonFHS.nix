with import <nixpkgs> {} ;
let
    python = python3.withPackages(ps: with ps; [ pip urllib3 ]);
    Xlibs = with xorg; [
      alsaLib atk cairo cups dbus expat fontconfig gnome2.GConf gdk-pixbuf glib gtk2
      libX11 libxcb libXcomposite libXcursor libXdamage libXext libXfixes libXi
      libXrandr libXrender libXScrnSaver libXtst nspr nss pango libpulseaudio
      systemd at-spi2-core at-spi2-atk
      libdrm mesa
    ];
    fhs = pkgs.buildFHSUserEnv {

        name = "julia-R-python";

        targetPkgs = pkgs: with pkgs;[ 
          
            python
           
            jdk11

            libxml2 libxslt openssl libGL
            libmysqlclient
            gcc binutils


            pkg-config
            zlib

          ] ++ Xlibs;
          
          profile = ''

                export PATH=$PATH:"$(rustc --print sysroot)/bin/":"$CARGO_HOME/bin":"/home/prehonor/.local/bin":"/ah/prehonor/.npm/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator:/gh/prehonor/gitproject/wasmtime/target/debug"
                export LD_LIBRARY_PATH='/home/prehonor/Public/test':$LD_LIBRARY_PATH


                export ANDROID_HOME="/gh/prehonor/Android/Sdk"

                export MAVEN_OPTS='-Xms300m -Xmx300m'


                export JAVA_CPPFLAGS=-I${jdk11}/include/
                export JAVA_HOME=${jdk11.home}

                export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
                export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
                

                unset http_proxy
                unset https_proxy
                unset ftp_proxy
                unset all_proxy

                cd /home/prehonor/.local/pythonEnvs/
                source foo/bin/activate
      

          '';
        runScript = "bash";
    };
in fhs.env

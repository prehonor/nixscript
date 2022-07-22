let
  pkgs = import <nixpkgs> { };

  inherit (import ./common/pythonlib.nix {
    python = pkgs.python3;
    version = "python3.9";
  })
    mypy mypy_v;

  publibs = import ./common/otherlib.nix { inherit pkgs; };
  xlibs = import ./common/xorglib.nix { inherit pkgs; };
  qtlibs = import ./common/qtlib.nix { inherit pkgs; };
  libsforbin = import ./common/bin.nix { inherit pkgs; };
  LibsBinPath = with pkgs; lib.makeBinPath libsforbin;

  # C#
  dotnet-combined = with pkgs.dotnetCorePackages;
    combinePackages [ sdk_6_0 sdk_5_0 ];
  dotnetRoot = "${dotnet-combined}";
  dotnetSdk = "${dotnet-combined}/sdk";
  dotnetBinary = "${dotnetRoot}/bin/dotnet";
  # packages = [ dotnet-combined ];

  buildInputs = [ mypy dotnet-combined ] ++ publibs ++ xlibs ++ qtlibs;

  libs = buildInputs;

  toollibs = import ./common/devtools.nix { inherit pkgs; };

  nativeBuildInputs = toollibs;

  ld = with pkgs;
    lib.makeLibraryPath
    ([ stdenv.cc.cc.lib fontconfig.lib ] ++ libs ++ toollibs);

  GOROOT = "${pkgs.go.out}/share/go";
  CFLAGS = "-I${pkgs.glibc.dev}/include";
  hardeningDisable = [
    "all"
  ]; # 为了解决cgo warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
  LDFLAGS = "-L${pkgs.glibc}/lib";

  LIBCLANG_PATH = with pkgs; lib.makeLibraryPath [ libclang_x.lib ];
  HISTFILE = toString ./.history;

  RUSTC_VERSION = "nightly"; # stable
  # Add libvmi precompiled library to rustc search path
  RUSTFLAGS = with pkgs; (builtins.map (a: "-L ${a}/lib") [ libvmi ]);
  # Add libvmi, glibc, clang, glib headers to bindgen search path
  BINDGEN_EXTRA_CLANG_ARGS = with pkgs;
  # Includes with normal include path
    (builtins.map (a: ''-I"${a}/include"'') [ libvmi glibc.dev ])
    # Includes with special directory paths
    ++ [
      ''-I"${libclang_x.lib}/lib/clang/${libclang_x.version}/include"''
      ''-I"${glib.dev}/include/glib-2.0"''
      "-I${glib.out}/lib/glib-2.0/include/"
    ];

  fhs = with pkgs;
    buildFHSUserEnv {

      name = "fhs";

      targetPkgs = pkgs: (buildInputs ++ nativeBuildInputs);

      runScript = "	bash\n";

      profile = ''

        export PATH="$HOME/.local/bin":"$HOME/.local/usr/bin":"/ah/prehonor/.npm/bin:/gh/prehonor/gitproject/wasmtime/target/debug:/gh/prehonor/gitproject/vcpkg":$PATH

        export PATH=$PATH:/home/prehonor/.roswell/bin  # lem 一个 lisp IDE

        # export PATH=$PATH:${LibsBinPath} # ocmal环境

        export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH" # haskell环境

        export MATLABROOT=/ah/prehonor/Programmers/MATLAB/R2021b


        export ANDROID_HOME="/gh/prehonor/Android/Sdk"
        export MAVEN_OPTS='-Xms300m -Xmx300m'
        export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator:$HOME/doom-emacs/bin


        export JAVA_CPPFLAGS=-I${jdk11}/include/
        export JAVA_HOME=${jdk11.home}
        export ANT_HOME="/ah/prehonor/Programmers/apache-ant-1.10.8"


        export CARGO_HOME="$HOME/.cargo/"


        export RUSTUP_DIST_SERVER=http://mirrors.ustc.edu.cn/rust-static
        export RUSTUP_UPDATE_ROOT=http://mirrors.ustc.edu.cn/rust-static/rustup
        export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
        export PATH=$PATH:"$(rustc --print sysroot)/bin/":"$CARGO_HOME/bin"


        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}:/home/prehonor/Public/test:${cudaPackages.cudatoolkit}/lib

        export LIBCLANG_PATH=${LIBCLANG_PATH}

        export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/home/prehonor/.local/usr/lib/pkgconfig

        # idea 调试 rust 会下载本地调试插件和lldb调试器 ，需要patchelf

        # export LD_LIBRARY_PATH=/home/prehonor/.cache/JetBrains/IntelliJIdea2021.2/intellij-rust/lldb/lib::$LD_LIBRARY_PATH
             
        # autoPatchelf /home/prehonor/.cache/JetBrains/IntelliJIdea2021.2/intellij-rust/lldb/bin
        # autoPatchelf /ah/prehonor/.npm


        export CUDA_HOME=${cudaPackages.cudatoolkit}
        export CUDA_PATH=${cudaPackages.cudatoolkit}
        export EXTRA_LDFLAGS="-L/lib -L${linuxPackages.nvidia_x11}/lib"
        export EXTRA_CCFLAGS="-I/usr/include"
        export PYTHON_LIBRARY=${mypy}/lib
        export PYTHON_INCLUDE_DIRS=${mypy}/include/${mypy_v}
        export NCCL_ROOT=${cudaPackages.nccl.dev}
        export CUDNN_ROOT=${cudaPackages.cudnn}

        # export PIP_PREFIX=/home/prehonor/.local/pythonEnvs/pip_packages
        # export PYTHONPATH="$PIP_PREFIX/${python.sitePackages}:$PYTHONPATH"
        # export PATH="$PIP_PREFIX/bin:$PATH"
        # unset SOURCE_DATE_EPOCH

              
        export GOROOT=${GOROOT}
        export GOPATH="$HOME/go"
        export GOPROXY="https://goproxy.io,direct"


        export JULIA_PKG_SERVER=https://mirrors.tuna.tsinghua.edu.cn/julia
        export GUROBI_HOME="/gh/prehonor/opt/gurobi810/linux64"
        export GRB_LICENSE_FILE="/gh/prehonor/opt/gurobi810/gurobi.lic"
        export PATH=$PATH:$GUROBI_HOME/bin
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$GUROBI_HOME/lib
        export LIBPATH=${ld}

        export XDG_DATA_DIRS=$XDG_DATA_DIRS:"${gtk3}/share/gsettings-schemas/${gtk3.name}"

        # C#
        export PATH="$PATH:/home/prehonor/.dotnet/tools"
        export DOTNET_ROOT=${dotnetRoot}
        # dotnetBase=${dotnetSdk}/$(${dotnetBinary} --version)
        # export MSBuildSdksPath=$dotnetBase/Sdks
        # export MSBUILD_EXE_PATH=$dotnetBase/MSBuild.dll



        unset http_proxy
        unset https_proxy
        unset ftp_proxy
        unset all_proxy

        LIBRARY_PATH=""
          for b in ${toString (map lib.getLib libs)}; do
            if [[ -d "$b/lib" ]]; then
              LIBRARY_PATH="$b/lib''${LIBRARY_PATH:+:}$LIBRARY_PATH"
            fi
          done

        export LIBRARY_PATH

        source /home/prehonor/.local/pythonEnvs/spider/bin/activate
        eval $(opam env) # 必要的opam环境设置
        export PATH=$(echo $PATH|sed 's/:/\n/g'|sort|uniq|tr -s '\n' ':'|sed 's/:$//g')

      '';

    };
in with pkgs;
stdenv.mkDerivation {

  name = "fhsenv";

  nativeBuildInputs = [ fhs ];

  shellHook = "\n	exec fhs\n\n";
}

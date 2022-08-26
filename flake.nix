{
  description = "clion";

  # inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-21.11;
  inputs.nixpkgs = <nixpkgs>;
  # inputs.nixpkgs.follows = <nixpkgs>;

  outputs = { self, nixpkgs }: {

  	defaultPackage.x86_64-linux =
      # Notice the reference to nixpkgs here.
      with import nixpkgs {};
      stdenv.mkDerivation rec {
        name = "CLion-env";

		    inherit (import ./common/pythonlib.nix { python = python3; version = "python3.9"; }) mypy mypy_v;
		    publibs = import ./common/otherlib.nix { inherit pkgs; };
		    xlibs = import ./common/xorglib.nix { inherit pkgs; };
		    qtlibs = import ./common/qtlib.nix { inherit pkgs; };
		    

		    buildInputs = [
		      mypy
		      autoPatchelfHook
		    ] ++ publibs ++ xlibs ++ qtlibs;


		    libs = buildInputs;

		    toollibs = import ./common/devtools.nix { inherit pkgs; };

		    nativeBuildInputs = toollibs;


		    ld = lib.makeLibraryPath ([
		        stdenv.cc.cc.lib fontconfig.lib
		    ] ++ libs);


		    GOROOT = "${go.out}/share/go";
		    CFLAGS="-I${glibc.dev}/include";
		    hardeningDisable = [ "all" ];  # 为了解决cgo warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
		    LDFLAGS="-L${glibc}/lib";

		    
		    shellHook = ''
		    

		      export MATLABROOT=/ah/prehonor/Programmers/MATLAB/R2021b
		      export ANDROID_HOME="/gh/prehonor/Android/Sdk"
		      export MAVEN_OPTS='-Xms300m -Xmx300m'
		      export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator


		      export JAVA_CPPFLAGS=-I${jdk}/include/
		      export JAVA_HOME=${jdk.home}
		      export ANT_HOME="/ah/prehonor/Programmers/apache-ant-1.10.8"


		      export CARGO_HOME="$HOME/.cargo/"
		      export RUSTUP_DIST_SERVER=http://mirrors.ustc.edu.cn/rust-static
		      export RUSTUP_UPDATE_ROOT=http://mirrors.ustc.edu.cn/rust-static/rustup
		      export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
		      export PATH=$PATH:"$(rustc --print sysroot)/bin/":"$CARGO_HOME/bin"


		      export PATH=$PATH:"$HOME/.local/bin":"$HOME/.local/usr/bin":"/ah/prehonor/.npm/bin:/gh/prehonor/gitproject/wasmtime/target/debug:/gh/prehonor/gitproject/vcpkg"



		      export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}:/home/prehonor/Public/test:${cudaPackages.cudatoolkit_11}/lib

		      export LIBCLANG_PATH="${libclang_x.lib}/lib"

		      export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/home/prehonor/.local/usr/lib/pkgconfig

		      # idea 调试 rust 会下载本地调试插件和lldb调试器 ，需要patchelf

		      # export LD_LIBRARY_PATH=/home/prehonor/.cache/JetBrains/IntelliJIdea2021.2/intellij-rust/lldb/lib::$LD_LIBRARY_PATH
		     
		      # autoPatchelf /home/prehonor/.cache/JetBrains/IntelliJIdea2021.2/intellij-rust/lldb/bin
		      # autoPatchelf /ah/prehonor/.npm


		      export CUDA_HOME=${cudaPackages.cudatoolkit_11}
		      export CUDA_PATH=${cudaPackages.cudatoolkit_11}
		      export EXTRA_LDFLAGS="-L/lib -L${linuxPackages.nvidia_x11}/lib"
		      export EXTRA_CCFLAGS="-I/usr/include"
		      export PYTHON_LIBRARY=${mypy}/lib
		      export PYTHON_INCLUDE_DIRS=${mypy}/include/${mypy_v}
		      export NCCL_ROOT=${nccl_cudatoolkit_11.dev}
		      export CUDNN_ROOT=${cudnn_cudatoolkit_11}

		      # export PIP_PREFIX=/home/prehonor/.local/pythonEnvs/pip_packages
		      # export PYTHONPATH="$PIP_PREFIX/${python.sitePackages}:$PYTHONPATH"
		      # export PATH="$PIP_PREFIX/bin:$PATH"
		      # unset SOURCE_DATE_EPOCH

		      
		      export GOROOT=${GOROOT}
		      export GOPATH="$HOME/go"
		      export GOPROXY="https://mirrors.aliyun.com/goproxy/"


		      export JULIA_PKG_SERVER=https://mirrors.tuna.tsinghua.edu.cn/julia
		      export GUROBI_HOME="/gh/prehonor/opt/gurobi810/linux64"
		      export GRB_LICENSE_FILE="/gh/prehonor/opt/gurobi810/gurobi.lic"
		      export PATH=$PATH:$GUROBI_HOME/bin
		      export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}:$GUROBI_HOME/lib
		      export LIBPATH=${ld}

		      
		      # export QT_DEBUG_PLUGINS=1
		      # export XDG_DATA_DIRS=$XDG_DATA_DIRS:"${gtk3}/share/gsettings-schemas/${gtk3.name}" # also right


		      LIBRARY_PATH=""
		        for b in ${toString (map lib.getLib libs)}; do
		          if [[ -d "$b/lib" ]]; then
		            LIBRARY_PATH="$b/lib''${LIBRARY_PATH:+:}$LIBRARY_PATH"
		          fi
		        done

		      export LIBRARY_PATH
		        
		      source /home/prehonor/.local/pythonEnvs/spider/bin/activate
		    


		      unset http_proxy
		      unset https_proxy
		      unset ftp_proxy
		      unset all_proxy

		    '';
      };

  };
}
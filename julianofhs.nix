with import <nixpkgs> {}; 
mkShell rec {
  name = "julia";
  
  
  buildInputs = [
  #  ffmpeg glib gcc 
  #  qt4
  ];
  
  ld = stdenv.lib.makeLibraryPath ([
      stdenv.cc.cc.lib fontconfig.lib # zlib systemd.lib
  ] ++ buildInputs );

#     find ./bin -type f -perm -0100 \
#         -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
  shellHook = ''
    interp="$(cat $NIX_CC/nix-support/dynamic-linker)"
    rpath=${ld}
    
    export JULIA_PKG_SERVER=https://mirrors.tuna.tsinghua.edu.cn/julia
    export GUROBI_HOME="/gh/prehonor/opt/gurobi810/linux64"
	  export GRB_LICENSE_FILE="/gh/prehonor/opt/gurobi810/gurobi.lic"
	  export PATH=$PATH:$GUROBI_HOME/bin
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}:$GUROBI_HOME/lib
    export LIBPATH=${ld}
    
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset all_proxy

    # find /gh/prehonor/opt/gurobi810/linux64/bin/ -type f -perm -0100 -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
    '';
}


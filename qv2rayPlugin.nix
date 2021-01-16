with import /home/prehonor/Public/Code/nixpkgs/default.nix {}; 
mkShell rec {
  name = "julia";
  
  
  buildInputs = [
  #  ffmpeg glib gcc 
    qt5.qtbase
    openssl
  ];
  
  ld = stdenv.lib.makeLibraryPath ([
      stdenv.cc.cc.lib fontconfig.lib zlib systemd.lib
  ] ++ buildInputs );

#     find ./bin -type f -perm -0100 \
#         -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
  shellHook = ''
    interp="$(cat $NIX_CC/nix-support/dynamic-linker)"
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}
    export LIBPATH=${ld}
    unset http_proxy
    unset https_proxy
   # unset WEBIDE_JDK
    # find /gh/prehonor/opt/gurobi810/linux64/bin/ -type f -perm -0100 -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
    '';
}
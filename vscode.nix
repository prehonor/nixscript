 with import /home/prehonor/Public/Code/nixpkgs/default.nix {}; 
mkShell rec {
  name = "patchCppTools";
  buildInputs = [
    # clang-tools
    jdk11
    llvm
    clang
    mono
    gdb
    gcc
    cmake
    pkg-config
    vscode
  ];
  
  ld = stdenv.lib.makeLibraryPath ([
      stdenv.cc.cc.lib ncurses5 zlib
  ] ++ buildInputs );

#     find ./bin -type f -perm -0100 \
#         -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
  shellHook = ''
    interp="$(cat $NIX_CC/nix-support/dynamic-linker)"
    rpath=${ld}
    export PATH=$PATH:${stdenv.lib.makeBinPath [ coreutils gnugrep gnused which ]}
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}
    # find . -type f -perm -0100 -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
    '';
}

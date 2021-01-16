{ pkgs ? import /gh/prehonor/gitproject/nixpkgs/default.nix {} }:
	with pkgs;
  pkgs.mkShell {

    buildInputs = [
                    qt5.full
                    qtcreator
                    boost172_my
                    gmock
                   # (python3.withPackages(ps: with ps; [ pip urllib3 ]))
                   python3
                    cmake gcc gdb llvm clang 
                  ];
  }
{ pkgs ? import /gh/prehonor/gitproject/nixpkgs/default.nix {} }:
	with pkgs;
  pkgs.mkShell {

    buildInputs = [
                    cmake gcc gdb llvm clang 

                    lua pkgconfig systemd          
                  ];
  }
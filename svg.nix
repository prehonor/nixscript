{ pkgs ? with import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "GravitDesigner";
  targetPkgs = pkgs: (with pkgs;
    [
	  zlib
      glibc
	  fuse
    ]);
 
  runScript = "bash";
}).env


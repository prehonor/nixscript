{ pkgs ? import /home/prehonor/Public/Code/nixpkgs/default.nix {} }:

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


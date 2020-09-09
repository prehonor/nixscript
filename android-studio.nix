{ pkgs ? import /home/prehonor/Public/Code/nixpkgs/default.nix {} }:

(pkgs.buildFHSUserEnv {
  name = "android-sdk-env";
  targetPkgs = pkgs: (with pkgs;
    [
#       androidenv.androidPkgs_9_0.androidsdk
      glibc
    ]);
  runScript = "bash";
}).env

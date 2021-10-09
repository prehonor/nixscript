{ pkgs ? with import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "android-sdk-env";
  targetPkgs = pkgs: (with pkgs;
    [
#       androidenv.androidPkgs_9_0.androidsdk
      glibc
    ]);
  runScript = "bash";
}).env

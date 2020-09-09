{ pkgs ? import /home/prehonor/Public/Code/nixpkgs/default.nix {} }:
(pkgs.buildFHSUserEnv {
  name = "android-sdk-env";
  targetPkgs = pkgs: (with pkgs;
    [
      jdk
      nodejs-12_x
      yarn
      watchman
      fontconfig
      zlib
      glibc
#       androidenv.androidPkgs_9_0.androidsdk  
    ]);
  profile = ''
    export WEBIDE_JDK="/gh/prehonor/gitproject/JetBrainsRuntime/build/linux-x86_64-normal-server-release/jdk"
    export JAVA_HOME=${pkgs.jdk.home}
    export ANDROID_HOME="/gh/prehonor/Android/Sdk"
    export PATH=$PATH:$HOME"/.npm/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator"
    unset http_proxy
    unset https_proxy
  '';
  runScript = "bash";
}).env


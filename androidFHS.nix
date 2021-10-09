{ pkgs ? import <nixpkgs> {} }:

let fhs = pkgs.buildFHSUserEnv {
  name = "android-env";
  targetPkgs = pkgs: with pkgs;
    [ 
      flutter
      gitFull
      gitRepo
      gnupg
      curl
      procps
      openssl
      gnumake
      nettools
      # For nixos < 19.03, use `androidenv.platformTools`
#       androidenv.androidPkgs_9_0.platform-tools
      jdk11
      schedtool
      utillinux
      m4
      gperf
      perl
      libxml2
      zip
      unzip
      bison
      flex
      lzop
    ];
  multiPkgs = pkgs: with pkgs;
    [ 
      zlib
    ];
  runScript = "bash";
  profile = ''

    export MAVEN_OPTS='-Xms300m -Xmx300m'
    export GRADLE_OPTS='-Xms396m -Xmx396m'

    export USE_CCACHE=1
    export ANDROID_JAVA_HOME=${pkgs.jdk.home}
    export FLUTTER_SDK=${pkgs.flutter.unwrapped}

    export PATH=$PATH:/gh/prehonor/Android/Sdk/platform-tools


    export PUB_HOSTED_URL=https://pub.flutter-io.cn
    export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
    # export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
    export PUB_CACHE=$PUB_CACHE:$HOME/.pub-cache

    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset all_proxy


  '';
};
in pkgs.stdenv.mkDerivation {
  name = "android-env-shell";
  nativeBuildInputs = [ fhs ];
  shellHook = "exec android-env";

}

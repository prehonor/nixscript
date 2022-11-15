with import <nixpkgs> { };
mkShell rec {
  name = "react-native";

  buildInputs = [ jdk fontconfig glibc autoPatchelfHook ];

  ld = lib.makeLibraryPath ([ stdenv.cc.cc.lib stdenv.cc.libc zlib ]);
  GRADLE_OPTS =
    "-Dorg.gradle.project.android.aapt2FromMavenOverride=/gh/prehonor/Android/Sdk/build-tools/33.0.0/aapt2";

  shellHook = ''
    interp="$(cat $NIX_CC/nix-support/dynamic-linker)"
    rpath=${ld}
    export ANDROID_HOME="/gh/prehonor/Android/Sdk"
    export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator

    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}
    unset http_proxy
    unset https_proxy
    # find /gh/prehonor/Android/Sdk/platform-tools/ -type f -perm -0100 -exec patchelf --interpreter $interp {} \;
  '';

}


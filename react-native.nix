with import <nixpkgs> {}; 
mkShell rec {
  name = "react-native";
  
  buildInputs = [
    jdk
#     gcc
#     pkg-config
#     autoconf
#     watchman
    fontconfig
    zlib
  ];

  ld = stdenv.lib.makeLibraryPath ([
      stdenv.cc.cc.lib stdenv.cc.libc zlib fontconfig.lib
  ]);
  
  GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=/gh/prehonor/Android/Sdk/build-tools/28.0.3/aapt2";

#     find ./bin -type f -perm -0100 \  registry=https://registry.npm.taobao.org
#         -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" {} \;
  shellHook = ''
    interp="$(cat $NIX_CC/nix-support/dynamic-linker)"
    rpath=${ld}
     export WEBIDE_JDK="/gh/prehonor/gitproject/JetBrainsRuntime/build/linux-x86_64-normal-server-release/jdk"
    export ANDROID_HOME="/gh/prehonor/Android/Sdk"
    export PATH=$PATH:$HOME"/.npm/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator"

    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${ld}
     unset http_proxy
     unset https_proxy
#     find /gh/prehonor/Android/Sdk -type f -perm -0100 -exec patchelf --interpreter $interp {} \;
    '';
    
}

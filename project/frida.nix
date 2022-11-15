with import <nixpkgs> {};

let
  inherit (import ../common/pythonlib.nix {
      python = pkgs.python3;
      version = "python3.9";
    }) mypy mypy_v;

  fhs = pkgs.buildFHSUserEnv {
    name = "frida-env";
    targetPkgs = pkgs: with pkgs; [
      gcc_multi
      binutils
      gnumake
      which
      git
      mypy
      nodejs
      perl
      curl
      glibc_multi
      yarn
      zlib
    ];
    profile = ''
      export ANDROID_HOME=/gh/prehonor/Android/Sdk
      export ANDROID_NDK_ROOT=$ANDROID_HOME/ndk/25.1.8937393
      export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator:$ANDROID_NDK_ROOT
      export hardeningDisable=all
      export SSL_CERT_FILE="${cacert}/etc/ssl/certs/ca-bundle.crt"
      export PYTHON_LIBRARY=${mypy}/lib
      export PYTHON_INCLUDE_DIRS=${mypy}/include/${mypy_v}
      # initialize sdk
      make
      # npm does not frida-gum/bindings/gumjs/node_modules -> bug?
      (cd frida-gum/bindings/gumjs && yarn install)

      # for frida-python wheel
      export FRIDA_VERSION=$(git describe --tags)
      export FRIDA_EXTENSION=$(realpath build/frida-linux-x86_64/${python3.sitePackages}/_frida.so)
      export SOURCE_DATE_EPOCH="315532800"
    '';
  };
in fhs.env
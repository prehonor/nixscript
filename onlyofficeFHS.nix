{ pkgs ? with import <nixpkgs> {} }:
 
let fhs = pkgs.buildFHSUserEnv {
  name = "onlyoffice";
  targetPkgs = pkgs: with pkgs;
    [ 
          gnome3.gsettings_desktop_schemas
          glib
          gtk3
          gtk2
          cairo
          atk
          gdk-pixbuf
          at-spi2-atk
          dbus
          dconf
          gst_all_1.gstreamer
          gst_all_1.gst-plugins-base
          qt5.qtbase
          qt5.qtdeclarative
          qt5.qtsvg
          xorg.libX11
          xorg.libxcb
          xorg.libXi
          xorg.libXcursor
          xorg.libXdamage
          xorg.libXrandr
          xorg.libXcomposite
          xorg.libXext
          xorg.libXfixes
          xorg.libXrender
          xorg.libXtst
          xorg.libXScrnSaver
          nss
          nspr
          alsaLib
          fontconfig
          libpulseaudio
    ];
  multiPkgs = pkgs: with pkgs;
    [ 
      zlib
    ];
  runScript = "bash";
  profile = ''
    export XDG_DATA_DIRS=$XDG_DATA_DIRS:"${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    export QT_PLUGIN_PATH=/home/prehonor/Public/Program/desktopeditors  # ONLYOFFICE
    export QT_QPA_PLATFORM_PLUGIN_PATH=/home/prehonor/Public/Program/desktopeditors/platforms # ONLYOFFICE
  '';
};
in pkgs.stdenv.mkDerivation {
  name = "onlyoffice";
  nativeBuildInputs = [ fhs ];
  shellHook = "exec onlyoffice";

}


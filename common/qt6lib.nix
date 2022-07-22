{ pkgs }:
with pkgs.qt6; [
  qt3d
  qtsvg
  qtdoc
  qtbase
  qttools
  # qtscxml
  # qtlottie
  qtcharts
  qtwebview
  # qtwayland
  qtsensors
  # qtquick3d
  qt5compat
  qtwebengine
  qtserialbus
  # qtdatavis3d
  qtwebsockets
  qtwebchannel
  qtserialport
  qtmultimedia
  # qtshadertools
  # qtpositioning
  qtnetworkauth
  qtdeclarative
  qttranslations
  qtimageformats
  qtconnectivity
  # qtremoteobjects
  # qtquicktimeline
  # qtlanguageserver
  qtvirtualkeyboard
]

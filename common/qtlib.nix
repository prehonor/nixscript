{pkgs}:
with pkgs.libsForQt5; 
[ 
  breeze-icons
  kactivities
  karchive 
  kbookmarks 
  kcompletion 
  kconfig 
  kconfigwidgets 
  kcoreaddons 
  kdbusaddons 
  kdegraphics-mobipocket 
  kiconthemes 
  kjs 
  khtml 
  kio 
  kparts 
  kpty 
  kpurpose 
  kwallet 
  kwindowsystem 
  libkexiv2 
  phonon 
  poppler 
  qca-qt5 
  threadweaver 
  kcrash 
  syntax-highlighting
  phonon-backend-gstreamer
  kdoctools # 这个之前放在buildInput里，放这里合适吗？
  qscintilla # A Qt port of the Scintilla text editing library
  # qt3d 
  qt5.full  # qt3d qtcharts qtconnectivity qtdeclarative qtdoc qtgraphicaleffects
            # qtimageformats qtlocation qtmultimedia qtquickcontrols qtquickcontrols2
            # qtscript qtsensors qtserialport qtsvg qttools qttranslations
            # qtvirtualkeyboard qtwebchannel qtwebengine qtwebkit qtwebsockets
            # qtwebview qtx11extras qtxmlpatterns
  qt5.qtspeech
  # qt5.qtsvg 
  # qt5.qtwebkit 
  # qt5.qtdeclarative
  kproperty 
  # qt5.qtsensors 
  qt5.qtgamepad 
  qt5.qtserialbus
  qt5.qtnetworkauth
  # qt5.qtcharts
  # mapbox-gl-native         # nteractive, thoroughly customizable maps in native Android, iOS, macOS, Node.js, and Qt applications, powered by vector tiles and OpenGL

]
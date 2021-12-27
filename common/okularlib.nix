{ pkgs, libsForQt ? pkgs.libsForQt5}:
with pkgs; 
[
  discount 
  djvulibre 
  ebook_tools 
  libspectre 
  libzip 
]
/*
++
(with libsForQt; 
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
  kio kparts 
  kpty 
  kpurpose 
  kwallet 
  kwindowsystem 
  libkexiv2 
  phonon 
  poppler 
  qca-qt5 
  qt5.qtdeclarative 
  qt5.qtsvg 
  threadweaver 
  kcrash 
])
*/
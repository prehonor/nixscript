with import <nixpkgs> {}; 
mkShell rec {
  name = "sasm";
  buildInputs = [
    libsForQt5.qt5.qtbase
  ];

  nativeBuildInputs = [ pkg-config gnumake libsForQt5.qt5.qmake ];
 
  shellHook = ''
    '';
    
}

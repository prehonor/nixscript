{ pkgs }:
with pkgs.xorg; [
  libX11
  libICE
  libXrender
  libXtst
  libXt
  libXinerama
  libXcursor
  libXi
  libXmu
  libXext
  libX11.dev
  libXv
  libXrandr
  libxcb
  libXcomposite
  libXdamage
  libXfixes
  libXScrnSaver
  libXft
  libSM
  libXxf86vm
  libxshmfence
  xorgproto
]

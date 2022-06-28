with import <nixpkgs> {}; 
mkShell rec {
  name = "pcmanfmnix";
  withGtk3 = true;
  libfm' = libfm.override { inherit withGtk3; };
  buildInputs = [
    gtk3 gnome.adwaita-icon-theme libfm' pango glib xorg.libX11 menu-cache
  ];

  nativeBuildInputs = [ pkg-config gnumake intltool];
 
  shellHook = ''

    '';
    
}

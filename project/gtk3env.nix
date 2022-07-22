with import <nixpkgs> {}; 
mkShell rec {
  name = "pcmanfmnix";
  withGtk3 = true;
  libfm' = libfm.override { inherit withGtk3; };
  buildInputs = [
    gtk3 gnome.adwaita-icon-theme libfm' glib cairo pango libjpeg curl
  ];

  nativeBuildInputs = [ cmake pkg-config gnumake meson ninja ];
 
  shellHook = ''

    '';
    
}

with import <nixpkgs> {}; 
mkShell {
  nativeBuildInputs = with pkgs; [
    gobject-introspection
    bamf
    dbus        # Simple interprocess messaging system
   dbus-glib      # Obsolete glib bindings for D-Bus lightweight IPC mechanism
  ];
  buildInputs = with pkgs; [
    (python39.withPackages (ps: with ps; [
      pygobject3 dbus-python
    ]))
    glib
    gtk3
    pkgconfig
    bashInteractive
    bamf
    dbus        # Simple interprocess messaging system
   dbus-glib      # Obsolete glib bindings for D-Bus lightweight IPC mechanism
  ];
}
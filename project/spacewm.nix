with import <nixpkgs> {}; 
mkShell rec {
  name = "spacewm";
  
  buildInputs = [
    gtk3  udev desktop-file-utils shared-mime-info intltool ffmpegthumbnailer 
    jmtpfs lsof udisks2 
  ];

  nativeBuildInputs = [ pkg-config gnumake gcc gdb ];
 
  shellHook = ''

    '';
    
}

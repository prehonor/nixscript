with import <nixpkgs> {}; 
mkShell rec { 

    buildInputs = [
            # autoPatchelfHook
      cmake gcc gdb 
    
      pkgconfig systemd    
    ];
}
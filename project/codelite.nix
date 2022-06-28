with import <nixpkgs> {}; 
mkShell rec {
  name = "codelite";
  
  buildInputs = [
    gtk3 libssh sqlite.dev harfbuzz.dev
  ];

  nativeBuildInputs = [ pkg-config gnumake gcc gdb cmake];


  # https://github.com/NixOS/nixpkgs/pull/75789
  # https://github.com/eranif/codelite/issues/2380
  # https://github.com/eranif/codelite/issues/2346
  # https://gitlab.kitware.com/cmake/cmake/-/issues/19531
  NIX_CFLAGS_COMPILE = [ "-I${harfbuzz.dev}/include/harfbuzz" ]; 


  shellHook = ''

    '';
    
}

with import <nixpkgs> {}; 
stdenv.mkDerivation rec { 
  
  name = "Coq";
  buildInputs = [
    coq 
    coqPackages.mathcomp
  ];

  
  shellHook = ''
    nohup coqide > /dev/null 2>&1 &
  '';
}



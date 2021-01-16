with import /gh/prehonor/gitproject/nixpkgs/default.nix {}; 
mkShell rec { 
  
  product = "CLion";


  buildInputs = [


  #  jdk11
  #  ncurses5
    # makeWrapper
  #  libnotify
  #  libsecret
 
#    cmake
   
    gmock
    boost172_my
    python3
    libmysqlconnectorcpp

   # gcc 
   # gdb 


    
  ];
  /*
  nativeBuildInputs = [
    gmock
    boost172_my
    python3
    ];*/
  
}



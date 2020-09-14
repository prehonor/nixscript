with import /home/prehonor/Public/Code/nixpkgs/default.nix {}; 
mkShell rec { 

  name = "python3_env";
  python3 = python36Full.withPackages(ps: with ps; [ virtualenv pip urllib3 ]);
  buildInputs = [
    python3
	
  ];
  ld = stdenv.lib.makeLibraryPath ([
      stdenv.cc.cc.lib fontconfig.lib
  ]);

  shellHook = ''
	
	export LD_LIBRARY_PATH=${ld}:$LD_LIBRARY_PATH
	export PYTHONPATH="/home/prehonor/.local/lib/python3.6/site-packages"
	unset SOURCE_DATE_EPOCH
  '';
}
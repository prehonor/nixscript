let 
	pkgs = import <nixpkgs> {};

 	# C#
  	dotnet-combined = with pkgs.dotnetCorePackages; combinePackages [
   	 sdk_6_0 sdk_5_0 
  	];
  	dotnetRoot = "${dotnet-combined}";
  	dotnetSdk = "${dotnet-combined}/sdk";
  	dotnetBinary = "${dotnetRoot}/bin/dotnet";
  	
  	# cd /home/prehonor/.local/pythonEnvs
  	# python -m venv spider
  	# source /home/prehonor/.local/pythonEnvs/spider/bin/activate
  	inherit (import ../common/pythonlib.nix {
    	python = pkgs.python3;
    	version = "python3.9";
  	}) mypy mypy_v;

	buildInputs = [
		dotnet-combined
      	pkgs.autoPatchelfHook
      	pkgs.jdk
    ];

	fhs =  with pkgs; buildFHSUserEnv {

		name = "fhs";

		targetPkgs = pkgs: buildInputs;

		runScript = ''
			bash
		'';

		profile = ''
			export PYTHON_LIBRARY=${mypy}/lib
        	export PYTHON_INCLUDE_DIRS=${mypy}/include/${mypy_v}   	
	  	'';

	};
in with pkgs; stdenv.mkDerivation {

	name = "fhsenv";

	nativeBuildInputs = [ fhs ];

	shellHook = ''
		exec fhs
	'';
}

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
      	pkgs.jdk8
      	pkgs.boost_x
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
        	export ANDROID_HOME="/gh/prehonor/Android/Sdk"
        	export ANDROID_NDK_ROOT=$ANDROID_HOME/ndk/25.1.8937393
    		export PATH=$PATH:/ah/prehonor/.npm/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/build-tools/33.0.0:$ANDROID_NDK_ROOT
    		export JAVA_HOME=${pkgs.jdk8.home}

    		export SOURCE_DATE_EPOCH="315532800"

    		export PUB_HOSTED_URL=https://pub.flutter-io.cn
 			export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
    		source /home/prehonor/.local/pythonEnvs/spider/bin/activate

	  	'';

	};
in with pkgs; stdenv.mkDerivation {

	name = "fhsenv";

	nativeBuildInputs = [ fhs ];

	shellHook = ''
		exec fhs
	'';
}

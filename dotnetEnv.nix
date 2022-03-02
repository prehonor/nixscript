with import <nixpkgs> {}; 
mkShell {
  name = "dotnet-env";
  buildInputs = [
    dotnet-sdk
  ];
  shellHook = ''
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset all_proxy
    export FrameworkPathOverride=${pkgs.mono}/lib/mono/4.7.2-api
  '';
}
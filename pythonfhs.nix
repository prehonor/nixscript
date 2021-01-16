with import /gh/prehonor/gitproject/nixpkgs/default.nix {} ;
let
    fhs = pkgs.buildFHSUserEnv {

        name = "julia";

        targetPkgs = pkgs: with pkgs;[ 
          
            zlib bzip2.dev icu lzma.dev pcre.dev jdk libzip

            (python36Full.withPackages(ps: with ps; [ virtualenv pip urllib3 ]))

          ];
          
          profile = ''

              SOURCE_DATE_EPOCH=$(date +%s)
              export PIP_PREFIX="/home/prehonor/.local"
              export PYTHONPATH="$PIP_PREFIX/${python36Full.sitePackages}:$PYTHONPATH"

              export JAVA_CPPFLAGS=-I${pkgs.jdk}/include/
              export JAVA_HOME=${pkgs.jdk.home}

              export PATH=:"/home/prehonor/.local/bin":$PATH

              # unset SOURCE_DATE_EPOCH

              unset http_proxy
              unset https_proxy
              unset ftp_proxy
              unset all_proxy
              
              
          '';
        runScript = "bash";
    };
in fhs.env

/*
{ pkgs ? import /home/prehonor/Public/Code/nixpkgs/default.nix {} }:
(pkgs.buildFHSUserEnv {

        name = "julia";

        targetPkgs = pkgs: with pkgs;[ 
          
            zlib bzip2.dev icu lzma.dev pcre.dev jdk libzip

            (python36Full.withPackages(ps: with ps; [ virtualenv pip urllib3 ]))

          ];
          
          profile = ''

              SOURCE_DATE_EPOCH=$(date +%s)
              export PIP_PREFIX="/home/prehonor/.local"
              export PYTHONPATH="$PIP_PREFIX/lib/python3.6/site-packages:$PYTHONPATH"

              export JAVA_CPPFLAGS=-I${pkgs.jdk}/include/
              export JAVA_HOME=${pkgs.jdk.home}

              export PATH=:"/home/prehonor/.local/bin":$PATH

              # unset SOURCE_DATE_EPOCH

              unset http_proxy
              unset https_proxy
              unset ftp_proxy
              
              
          '';
        runScript = "bash";
}).env
*/
 { pkgs ? import /home/prehonor/Public/Code/nixpkgs/default.nix {} }:

(pkgs.buildFHSUserEnv {
  name = "simple-x11-env";
  targetPkgs = pkgs: (with pkgs;
    [ udev
      alsaLib
    ]) ++ (with pkgs.xorg;
    [ libX11
      libXcursor
      libXrandr
    ]);
  multiPkgs = pkgs: (with pkgs;
    [ udev
      alsaLib
    ]);
  runScript = "bash";
}).env

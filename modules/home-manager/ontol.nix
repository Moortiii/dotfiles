with import <nixpkgs> {};
# run with
# $ nix-shell ./masterpdfeditor.nix
  mkShell {
    NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
      nss
      sane-backends
      nspr
      zlib
      libglvnd
      qt5.qtbase
      qt5.qtsvg
      qt5.qtdeclarative
      qt5.qtwayland
      stdenv.cc.cc
    ];

    NIX_LD = builtins.readFile "${stdenv.cc}/nix-support/dynamic-linker";

    shellHook = ''
      
    '';
  }
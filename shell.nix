#with import <nixpkgs> { overlays = [(import ./neovim-nightly.nix)]; };

#{ pkgs ? import <nixpkgs> { overlays = [ (import ./nix_files/overlay.nix) ]; } }:
{ pkgs ? import <nixpkgs> { overlays = [ (import ./neovim-nightly.nix) ]; } }:
stdenv.mkDerivation {
  name = "env";

  nativeBuildInputs = [
    neovim-nightly
  ];

  buildInputs = [
    gcc
    gnumake
    go
    xorg.libX11
    xvfb-run
  ];

  shellHook = ''
    export LD_LIBRARY_PATH="${lib.makeLibraryPath [ xorg.libX11 ]}"
  '';
}



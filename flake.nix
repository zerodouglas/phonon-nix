{
  description = "Phonon development nix file";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {inherit system; config = { allowUnfree = true; };};
      in {
        devShells.default = import ./shell.nix {inherit pkgs;};
      });
}
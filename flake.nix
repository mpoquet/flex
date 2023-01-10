{
  description = "Root of mpoquet/flex flakes.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=22.11";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, flake-compat }:
    #let templates = import ./templates/nix_flake_templates.nix;
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let
        pkgs = import nixpkgs { inherit system; };
        shell-set = import ./shells/default.nix { inherit pkgs; };
      in rec {
        #packages = import ./pkgs/default.nix { inherit pkgs; };
        devShells = shell-set;
      }
    );
}

{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=22.11";
    nur-kapack = {
      url = "github:oar-team/nur-kapack/master";
      inputs.nixpkgs.follows = "nixpkgs"; # tell kapack to use the nixpkgs that is defined above
    };
    flake-utils.url = "github:numtide/flake-utils";
    mybatsim-src.url = "git+ssh://git@framagit.org/batsim/batsim";
    mybatsched-src.url = "git+ssh://git@framagit.org/batsim/batsched";
  };

  outputs = { self, nixpkgs, nur-kapack, flake-utils, mybatsim-src, mybatsched-src }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let
        pkgs = import nixpkgs { inherit system; };
        kapack = nur-kapack.packages.${system};
      in rec {
        packages = {
          mybatsim = kapack.batsim.overrideAttrs (final: previous: {
            version = mybatsim-src.shortRev;
            src = mybatsim-src;
          });
          mybatsched = kapack.batsched.overrideAttrs (final: previous: {
            version = mybatsched-src.shortRev;
            src = mybatsched-src;
          });
        };
        devShells = {
          simulation = pkgs.mkShell {
            buildInputs = [
              packages.mybatsim
              packages.mybatsched
              kapack.batexpe
            ];
            WORKLOAD_DIR = "${mybatsim-src}/workloads";
            PLATFORM_DIR = "${mybatsim-src}/platforms";
          };
        };
      }
    );
}

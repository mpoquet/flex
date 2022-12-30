flex
====

My public collections of Nix Flakes. Inspired by [qornflakes](https://github.com/GuilloteauQ/qornflakes).

Usage
-----

- List available flakes: `nix flake show github:mpoquet/flex`
- Enter a nix-shell:
  - R: `nix develop github:mpoquet/flex#r-shell --command R`
  - python: `nix develop github:mpoquet/flex#r-shell --command ipython`

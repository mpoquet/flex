{ pkgs ? import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/22.05.tar.gz";
    sha256 = "0d643wp3l77hv2pmg2fi7vyxn4rwy0iyr8djcw1h5x72315ck9ik";
  }) {}
}:

let
  self = rec {
    document = pkgs.stdenv.mkDerivation rec {
      name = "report";
      nativeBuildInputs = with pkgs; [
        texlive.combined.scheme-full
        pandoc
      ];
      src = pkgs.lib.sourceByRegex ./. [
        "irit-logo\.pdf"
        ".*\.md"
        "latex\.template"
      ];
      buildPhase = ''
        pandoc -o document.pdf document.md --template latex.template
      '';
      installPhase = ''
        mkdir -p $out
        mv document.pdf $out/
      '';
    };
  };
in
  self

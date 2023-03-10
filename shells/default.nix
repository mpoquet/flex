{ pkgs } :
{
  r-shell = pkgs.mkShell {
    buildInputs = with pkgs; [
      R
      rPackages.tidyverse
      rPackages.patchwork
      rPackages.ggpubr
    ];
  };

  py-shell = pkgs.mkShell {
    buildInputs = with pkgs; [
      python3Packages.ipython
      python3Packages.pandas
    ];
  };

  asymptote-shell = pkgs.mkShell {
    buildInputs = with pkgs; [
      asymptote
      ghostscript
      texlive.combined.scheme-full
    ];
  };
}

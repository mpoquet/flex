{ pkgs } :
{
  r-shell = pkgs.mkShell {
    buildInputs = with pkgs; [
      R
      rPackages.tidyverse
      rPackages.viridis
      rPackages.patchwork
      rPackages.ggpubr
      rPackages.timetk
      rPackages.ggcorrplot
      rPackages.GGally
      rPackages.forecast
      rPackages.maps
      rPackages.ggmap
      rPackages.svglite
      rPackages.extrafont
      rPackages.showtext
      libertinus
    ];
    FONTS_PATH="${pkgs.libertinus}/share/fonts/opentype";
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

  c-shell = pkgs.mkShell {
    buildInputs = with pkgs;  [
      meson ninja
    ];
  };
}

{ pkgs } :

let
  fonts_opentype = with pkgs; [
    fira
    fira-math
    fira-mono
    libertinus
  ];
  fonts_truetype = with pkgs; [
    fira-code
    inconsolata
  ];
  fonts = fonts_opentype ++ fonts_truetype;
  fonts_opentype_paths = map (x: "${x}/share/fonts/opentype") fonts_opentype;
  fonts_truetype_paths = map (x: "${x}/share/fonts/truetype") fonts_truetype;
  fonts_paths = pkgs.lib.strings.concatStringsSep ":" (fonts_opentype_paths ++ fonts_truetype_paths);
in
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
    buildInputs = with pkgs; [
      meson ninja
    ];
  };

  typst-shell = pkgs.mkShell {
    buildInputs = with pkgs; [
      typst
    ] ++ fonts;
    TYPST_FONT_PATHS = fonts_paths;
  };
}

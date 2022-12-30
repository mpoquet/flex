{ pkgs } :
{
  r-shell = pkgs.mkShell {
    buildInputs = with pkgs; [
      R
      rPackages.tidyverse
    ];
  };

  py-shell = pkgs.mkShell {
    buildInputs = with pkgs; [
      python3Packages.ipython
      python3Packages.pandas
    ];
  };
}

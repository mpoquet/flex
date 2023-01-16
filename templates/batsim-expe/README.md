## Create a local copy of the batsim-expe template
`nix flake init -t github:mpoquet/flex#batsim-expe`

## Usage to directly run the simulation (as defined in your local `flake.nix` description)
`nix develop .#simulation --command sh ./script.sh`

## Usage to enter the simulation shell (as defined in your local `flake.nix` description)
`nix develop .#simulation`

or if you want to use another shell, for example zsh: `nix develop .#simulation --command zsh`

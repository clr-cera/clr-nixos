{ pkgs, inputs, ... }:
{
  imports = [
    ./steam.nix
    ./lutris.nix
    ./itch
  ];

  home.packages = with pkgs;
  [
  osu-lazer-bin
  inputs.clrpkgs.packages.x86_64-linux.pokemmo-installer
  ];
}

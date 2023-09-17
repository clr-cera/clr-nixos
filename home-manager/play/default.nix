{ pkgs, clr, ... }:
{
  imports = [
    ./steam.nix
    ./lutris.nix
    ./itch
  ];

  home.packages = with pkgs;
  [
  osu-lazer-bin
  clr.pokemmo-installer
  ];
}

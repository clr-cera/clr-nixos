{ pkgs, outputs, ... }:
{
  imports = [
    ./steam.nix
    ./lutris.nix
    ./itch
  ];

  home.packages = with pkgs;
  [
  osu-lazer-bin
  outputs.packages.x86_64-linux.pokemmo
  ];
}

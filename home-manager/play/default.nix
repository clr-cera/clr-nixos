{ pkgs, inputs,config, ... }:
{
  imports = [
    ./steam.nix
    ./lutris.nix
    ./itch
  ];

  home.packages = with pkgs;
  [
  osu-lazer-bin
  bottles
  ];
}

{ pkgs, inputs, ... }:
{
  imports = [
    ./steam.nix
    ./lutris.nix
  ];

  home.packages = with pkgs;
  [
  osu-lazer-bin
  ];
}

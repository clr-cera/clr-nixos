{ pkgs, inputs, ... }:
{
  imports = [
    ./steam.nix
  ];

  home.packages = with pkgs;
  [
	lutris
  osu-lazer-bin
  ];


  services.joycond.enable = true;
}

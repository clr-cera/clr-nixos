{ pkgs, inputs, ... }:
{
  imports = [
    ./fish.nix
    ./starship.nix
  ];

  home.packages = with pkgs;
  [
	zip
	unzip
	ranger
  ];

}

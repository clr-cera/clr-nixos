{ pkgs, inputs, ... }:
{
  imports = [
    ./fish.nix

  ];

  home.packages = with pkgs;
  [
	zip
	unzip
	ranger
  ];

}

{ pkgs, inputs, ... }:
{
  imports = [
    ./python.nix

  ];

  home.packages = with pkgs;
  [
	gcc
	gh
	neovim
  ];

}

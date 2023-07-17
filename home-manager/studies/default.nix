{ pkgs, inputs, config, lib, ... }:
{
  imports = [
    ./python.nix
  ];

  home.packages = with pkgs;
  [
	gcc
	gh
	neovim
  vscode
  ];
}

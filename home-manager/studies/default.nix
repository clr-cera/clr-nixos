{ pkgs, inputs, config, lib, ... }:
{
  imports = [
    ./python.nix
  ];

  home.packages = with pkgs;
  [
	gcc
  clang-tools
  gh
	neovim
  vscode
  ];
}

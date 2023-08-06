{ pkgs, inputs, config, lib, ... }:
{
  imports = [
    ./python.nix
    ./c.nix
    ./haskell.nix
  ];

  home.packages = with pkgs;
  [
  gh
	neovim
  vscode
  notion-app-enhanced
  ];
}

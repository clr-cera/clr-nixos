{ pkgs, inputs, ... }:
{
  imports = [
    ./python.nix
    ./vscode.nix
  ];

  home.packages = with pkgs;
  [
	gcc
	gh
	neovim
  ];

}

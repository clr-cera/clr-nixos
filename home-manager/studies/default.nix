{ pkgs, inputs, ... }:
{
  imports = [


  ];

  home.packages = with pkgs;
  [
	gcc
	gh
	neovim
  ];

}
